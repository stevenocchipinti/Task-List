class Task < ActiveRecord::Base

  has_ancestry

  validates :name, :presence => true
  validates :completion,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :greater_than_or_equal_to => 0,
      :less_than_or_equal_to => 1
      }
  validates :estimate,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :only_integer => true,
      :greater_than => 0,
      :less_than_or_equal_to => 3
     }
  validates :importance,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :only_integer => true,
      :greater_than => 0,
      :less_than_or_equal_to => 3
    }
  validates :urgency,
    :allow_nil => true, # nil means auto-calculate
    :numericality => {
      :only_integer => true,
      :greater_than => 0,
      :less_than_or_equal_to => 3
    }


  def self.completion_options
    (1..10).collect{|x| ["#{x*10}%", x/10.0]}
  end

  def self.estimate_options
    [["Not long", 1], ["Average", 2], ["Long time", 3]]
  end

  def self.importance_options
    [["Not important", 1], ["Important", 2], ["Very important", 3]]
  end

  def self.urgency_options
    [["Not urgent", 1], ["Urgent", 2], ["Very urgent", 3]]
  end

end
