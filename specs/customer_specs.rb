require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')
require "pry"

class CustomerTest < MiniTest::Test
  def setup
    @customer1 = Customer.new("John", 200.00, 23, 0)
    @customer2 = Customer.new("Laura", 90.00, 16, 0)
    @drink1 = Drink.new("Martini", 8.30, 2)
    @drink2 = Drink.new("Picpoul", 6.00, 3)
    @pub = Pub.new("SuperPub", 250.00, [@drink1, @drink2])
  end

  def test_customer_has_name
    assert_equal("John", @customer1.name)
  end

  def test_customer_has_money
    assert_equal(200, @customer1.wallet)
  end

  def test_customer_has_age
    assert_equal(23, @customer1.age)
  end

  def test_customer_has_drunkeness
    assert_equal(0, @customer1.drunkeness)
  end

  def test_buy_drink__wallet_value_decreased
    @customer1.buy_drink(@drink1, @pub, @customer1)
    assert_equal(191.70, @customer1.wallet)
    assert_equal(258.30, @pub.till)
  end

  def test_pub_checks_age_before_selling
    @customer2.buy_drink(@drink1, @pub, @customer2)
    assert_equal("Sorry, you're too young to buy a drink",
    @customer2.buy_drink(@drink1, @pub, @customer2))
  end

  def test_customer_drunk
    @customer1.increase_drunkeness(@drink1)
    assert_equal(2, @customer1.drunkeness)
  end

  def test_customer_drunk__after_two_drinks
    @customer1.increase_drunkeness(@drink1)
    @customer1.increase_drunkeness(@drink2)
    assert_equal(5, @customer1.drunkeness)
  end


end
