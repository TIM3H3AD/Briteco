require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase

  setup do
    @item = items(:first) # Reference to the first fixture item
  end

  test "Creating a new item" do
    # When we visit the Items#index page
    # we expect to see a title with the text "Items"
    visit items_path
    assert_selector "h1", text: "Items"

    # When we click on the link with the text "New item"
    # we expect to land on a page with the title "New item"
    click_on "New item"
    assert_selector "h1", text: "New item"

    # When we fill in the name input with "Capybara item"
    # and we click on "Create Item"
    fill_in "Name", with: "Capybara item"
    click_on "Create item"

    # We expect to be back on the page with the title "Items"
    # and to see our "Capybara item" added to the list
    assert_selector "h1", text: "Items"
    assert_text "Capybara item"
  end

  test "Showing an item" do
    visit items_path
    click_link @item.name

    assert_selector "h1", text: @item.name
  end

  test "Updating an item" do
    visit items_path
    assert_selector "h1", text: "Items"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit item"

    fill_in "Name", with: "Updated item"
    click_on "Update item"

    assert_selector "h1", text: "Items"
    assert_text "Updated item"
  end

  test "Destroying an item" do
    visit items_path
    assert_text @item.name

    click_on "Delete", match: :first
    assert_no_text @item.name
  end
end
