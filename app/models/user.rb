class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :attempts, dependent: :destroy

  enum role: { guest: 0,  regular: 1, admin: 2  }
end
