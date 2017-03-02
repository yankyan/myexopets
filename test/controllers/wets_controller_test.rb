require 'test_helper'

class WetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wet = wets(:one)
  end

  test "should get index" do
    get wets_url
    assert_response :success
  end

  test "should get new" do
    get new_wet_url
    assert_response :success
  end

  test "should create wet" do
    assert_difference('Wet.count') do
      post wets_url, params: { wet: { date: @wet.date, pet_id: @wet.pet_id } }
    end

    assert_redirected_to wet_url(Wet.last)
  end

  test "should show wet" do
    get wet_url(@wet)
    assert_response :success
  end

  test "should get edit" do
    get edit_wet_url(@wet)
    assert_response :success
  end

  test "should update wet" do
    patch wet_url(@wet), params: { wet: { date: @wet.date, pet_id: @wet.pet_id } }
    assert_redirected_to wet_url(@wet)
  end

  test "should destroy wet" do
    assert_difference('Wet.count', -1) do
      delete wet_url(@wet)
    end

    assert_redirected_to wets_url
  end
end
