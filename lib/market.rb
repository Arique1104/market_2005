class Market
 attr_reader  :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
  vendors_have_item =  @vendors.find_all do |vendor|
        if vendor.inventory[item] >= 1
          vendor.name
        end
    end
    vendors_have_item.map do |vendor|
      vendor.name
    end
  end

  def total_inventory
    inventory_all = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        inventory_all[item] = {}
        inventory_all[item] = :quanitity
        inventory_all[item][:quantity] += amount
        inventory_all[item][:vendors] = []
        require "pry"; binding.pry
        inventory_all

      end
    end
    # final_hash = Hash.new{|hash, key| hash[key]= []}
    # inventory_all.each do |item, amount|
    #   final_hash[item] = amount


    # end

  end




end
