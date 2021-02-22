require 'test_helper'

class MersenTest < ActiveSupport::TestCase
  test 'should save into database' do
    assert(Mersen.create(input: '10002', output: '[[1, 3], [2, 7], [3, 31], [4, 127], [5, 8191]]').save)
  end

  test 'should get from database' do
    str = '10001'
    res = '[[1, 3], [2, 7], [3, 31], [4, 127], [5, 8191]]'
    Mersen.create(input: str, output: res)
    actual_res = Mersen.find_by(input: str).output
    assert_equal(actual_res, res)
  end

  test 'should check originality of data in database' do
    Mersen.create(input: '2000')
    assert(!Mersen.create(input: '2000').valid?)
  end
end
