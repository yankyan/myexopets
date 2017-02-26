require 'test_helper'

class MoltsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @molt = molts(:one)
  end

  test "should get index" do
    get molts_url
    assert_response :success
  end

  test "should get new" do
    get new_molt_url
    assert_response :success
  end

  test "should create molt" do
    assert_difference('Molt.count') do
      post molts_url, params: { molt: { date: @molt.date } }
    end

    assert_redirected_to molt_url(Molt.last)
  end

  test "should show molt" do
    get molt_url(@molt)
    assert_response :success
  end

  test "should get edit" do
    get edit_molt_url(@molt)
    assert_response :success
  end

  test "should update molt" do
    patch molt_url(@molt), params: { molt: { date: @molt.date } }
    assert_redirected_to molt_url(@molt)
  end

  test "should destroy molt" do
    assert_difference('Molt.count', -1) do
      delete molt_url(@molt)
    end

    assert_redirected_to molts_url
  end
end
