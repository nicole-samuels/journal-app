require "application_system_test_case"

class PatternsTest < ApplicationSystemTestCase
  test "creating a pattern" do

    visit new_pattern_path

    click_on "New Pattern"

    fill_in "Pattern Name", with: "Sophie Scarf"
    fill_in "Description", with: "Mini version of Sophie Scarf"
    fill_in "Item Category", with: "Scarf"
    choose "Beginner"


    click_on "Create Pattern"
    assert_text "All Patterns"
    
  end
end
  
    