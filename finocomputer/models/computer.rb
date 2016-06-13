class Computer < ActiveRecord::Base

  before_create do
    self.secret_key = SecureRandom.hex(3)
  end

  validates :name, presence: true

  validates :price_cents,
    :presence => true,
    :numericality => { :greater_than => 0}

  validates :modelo, {
     :presence => true,
     :numericality => {
       :greater_than => 0,
       :less_than_or_equal_to => 36
     }
  }

end