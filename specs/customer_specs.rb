require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')


class CustomerTest < MiniTest::Test
  def setup
    @customer1 = Customer.new("John", 200, 23, 0)

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

end
