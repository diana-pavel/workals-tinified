require "test_helper"

class GoalsControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goals_controller = goals_controllers(:one)
  end

  test "should get index" do
    get goals_controllers_url
    assert_response :success
  end

  test "should get new" do
    get new_goals_controller_url
    assert_response :success
  end

  test "should create goals_controller" do
    assert_difference("GoalsController.count") do
      post goals_controllers_url, params: { goals_controller: {  } }
    end

    assert_redirected_to goals_controller_url(GoalsController.last)
  end

  test "should show goals_controller" do
    get goals_controller_url(@goals_controller)
    assert_response :success
  end

  test "should get edit" do
    get edit_goals_controller_url(@goals_controller)
    assert_response :success
  end

  test "should update goals_controller" do
    patch goals_controller_url(@goals_controller), params: { goals_controller: {  } }
    assert_redirected_to goals_controller_url(@goals_controller)
  end

  test "should destroy goals_controller" do
    assert_difference("GoalsController.count", -1) do
      delete goals_controller_url(@goals_controller)
    end

    assert_redirected_to goals_controllers_url
  end
end
