require 'test_helper'

class PomoTimerControllerTest < ActionDispatch::IntegrationTest
  test "should get short_time" do
    get pomo_timer_short_time_url
    assert_response :success
  end

  test "should get long_time" do
    get pomo_timer_long_time_url
    assert_response :success
  end

  test "should get short_resr" do
    get pomo_timer_short_resr_url
    assert_response :success
  end

  test "should get long_rest" do
    get pomo_timer_long_rest_url
    assert_response :success
  end

end
