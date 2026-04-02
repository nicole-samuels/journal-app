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

    test "creating a pattern and project" do

    visit new_pattern_path

    click_on "New Pattern"

    fill_in "Pattern Name", with: "Sophie Scarf"
    fill_in "Description", with: "Mini version of Sophie Scarf"
    fill_in "Item Category", with: "Scarf"
    choose "Beginner"


    click_on "Create Pattern"
    assert_text "All Patterns"
    click_on "View", match: :first

    click_on "Add New Attempt"

    select "In progress", from: "Status"
    fill_in "Start Date", with: "20/03/2026"
    fill_in "Yarn Used", with: "Drops Air"
    select "Thread", from: "Yarn Weight"
    fill_in "Yarn Price in GBP", with: "-2"
    fill_in "Yarn Quantity", with: "-3"
    fill_in "Purchase Link", with: "Not a url"
    select "US 8 - 5.0 mm", from: "Needle Size"
    fill_in "Garment Size", with: "S"
    click_on "Create Project"

    assert_text "Yarn price must be greater than or equal to 0"
    assert_text "Yarn quantity must be greater than or equal to 0"
    assert_text "Purchase link is not a valid URL"
  end

end
  
    