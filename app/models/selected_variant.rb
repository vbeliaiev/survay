class SelectedVariant < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :question
  belongs_to :variant
  belongs_to :compare
end
