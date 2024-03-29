class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable,
         :omniauth_providers => [:twitter, :github,
                                 :facebook, :google_oauth2]

  has_one :profile
  has_many :book_ownerships
  has_many :books, through: :book_ownerships

  has_many :rentals
  has_many :borrowers, through: :rentals
  has_many :owerns, through: :rentals

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || email_out_of(auth)
      user.password = Devise.friendly_token[0,20]
    end
  end

  def borrow_requests
    BorrowRequest.where(requester_id: id)
  end

  def lent_requests
    BorrowRequest.where(owner_id: id)
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def self.email_out_of(auth)
    "#{auth.info.nickname}@no-mail.com"
  end
end
