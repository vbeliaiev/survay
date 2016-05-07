class SelectedVariant < ActiveRecord::Base
  belongs_to :answer
  belongs_to :variant
  belongs_to :compare
end
