class Quiz < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :attempts, dependent: :destroy

  enum status: { draft: 0, active: 1 }
  scope :visible, -> (user) { where(status: statuses[:active]) unless user.admin? }
  validates_presence_of :title
end
