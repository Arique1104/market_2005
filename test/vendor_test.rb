require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/item"
require "./lib/vendor"

class VendorTest < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
    expected = {}
    assert_equal expected, vendor.inventory
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    assert_equal 0, vendor.check_stock(item1)
  end

  def test_it_can_stock_items
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.stock(item1, 30)

    assert_equal 30, vendor.check_stock(item1)

      expected = {item1=>30}
    assert_equal expected, vendor.inventory

  end

end