class Computer < ActiveRecord::Base

  validates :name, presence: true

  # validates :price_cents,
  #   :presence => true,
  #   :numericality => { :greater_than => 0}

  # validates :modelo, {
  #    :presence => true,
  #    :numericality => {
  #      :greater_than => 0,
  #      :less_than_or_equal_to => 3000
  #    }
  # }

end