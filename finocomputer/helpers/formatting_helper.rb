helpers do

  def formating_price(price_cents)
    "$#{'%.2f' % (price_cents.to_i)}"
  end

  def formating_diameter(age)
    "#{age.to_i} Age"
  end
end