class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :attempts, dependent: :destroy

  # Guest - not registered user
  # Regular - registered user
  # Admin - user with admin rights
  enum role: { guest: 0,  regular: 1, admin: 2  }

  before_create :set_role

  private

  def set_role
    self.role = :regular if guest?
  end
end
