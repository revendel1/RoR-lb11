require 'test_helper'

class MersenControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get mersen_input_url
    assert_response :success
  end

  test "should get output" do
    get mersen_output_url, params: { form: { data: '10000' }}
    assert_response :success
  end
  
end
