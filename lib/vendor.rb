class Vendor
 attr_reader  :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    potential_money = 0
    @inventory.each do |item, amount|
      total = item.price * amount
      potential_money += total
    end
    potential_money
  end



end
