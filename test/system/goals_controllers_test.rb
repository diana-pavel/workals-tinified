require "application_system_test_case"

class GoalsControllersTest < ApplicationSystemTestCase
  setup do
    @goals_controller = goals_controllers(:one)
  end

  test "visiting the index" do
    visit goals_controllers_url
    assert_selector "h1", text: "Goals controllers"
  end

  test "should create goals controller" do
    visit goals_controllers_url
    click_on "New goals controller"

    click_on "Create Goals controller"

    assert_text "Goals controller was successfully created"
    click_on "Back"
  end

  test "should update Goals controller" do
    visit goals_controller_url(@goals_controller)
    click_on "Edit this goals controller", match: :first

    click_on "Update Goals controller"

    assert_text "Goals controller was successfully updated"
    click_on "Back"
  end

  test "should destroy Goals controller" do
    visit goals_controller_url(@goals_controller)
    click_on "Destroy this goals controller", match: :first

    assert_text "Goals controller was successfully destroyed"
  end
end
