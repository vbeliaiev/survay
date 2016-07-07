class Variant < ActiveRecord::Base
  belongs_to :question
  belongs_to :compare
  has_many :selected_variants, dependent: :destroy

  accepts_nested_attributes_for :compare, allow_destroy: true
  validates_presence_of :title

  def compare
    super || build_compare
  end
end
