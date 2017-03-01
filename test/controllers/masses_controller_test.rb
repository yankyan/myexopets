require 'test_helper'

class MassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mass = masses(:one)
  end

  test "should get index" do
    get masses_url
    assert_response :success
  end

  test "should get new" do
    get new_mass_url
    assert_response :success
  end

  test "should create mass" do
    assert_difference('Mass.count') do
      post masses_url, params: { mass: { date: @mass.date, mass: @mass.mass, pet_id: @mass.pet_id } }
    end

    assert_redirected_to mass_url(Mass.last)
  end

  test "should show mass" do
    get mass_url(@mass)
    assert_response :success
  end

  test "should get edit" do
    get edit_mass_url(@mass)
    assert_response :success
  end

  test "should update mass" do
    patch mass_url(@mass), params: { mass: { date: @mass.date, mass: @mass.mass, pet_id: @mass.pet_id } }
    assert_redirected_to mass_url(@mass)
  end

  test "should destroy mass" do
    assert_difference('Mass.count', -1) do
      delete mass_url(@mass)
    end

    assert_redirected_to masses_url
  end
end
