class Task < ActiveRecord::Base

  has_ancestry

  validates :name, :presence => true
  validates :completion,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :greater_then_or_equal_to => 0,
      :less_than_or_equal_to => 1
      }
  validates :estimate,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :only_integer => true,
      :greater_then_or_equal_to => 0,
      :less_than_or_equal_to => 5
     }
  validates :importance,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :only_integer => true,
      :greater_then_or_equal_to => 0,
      :less_than_or_equal_to => 5
    }
  validates :urgency,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :only_integer => true,
      :greater_then_or_equal_to => 0,
      :less_than_or_equal_to => 5
    }

end
