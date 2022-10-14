require_relative "../main"

require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase
  $counter = Counter.new
  $counter.create
  def test_first
    assert_equal(-1, $counter.first)
  end
  def test_second
    print "test ", $counter.second
    assert_equal([4,1], $counter.second)
  end
  def test_third
    assert_equal(true, $counter.third)
  end
  def test_fourth
    assert_equal(true, $counter.fourth)
  end
  def test_fifth
    assert_equal(false, $counter.fifth)
  end
end
