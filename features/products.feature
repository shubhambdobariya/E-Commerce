Feature: Manage products
  In order to manage products
  As an admin
  I want to add, edit, and delete products

  Scenario: Add a new product
    Given I am on the new product page
    When I fill in "Title" with "Phone"
    And I fill in "Price" with "100"
    And I fill in "Compare at price" with "150"
    And I select "Electronics" from "Category"
    And I press "Create Product"
    Then I should see "Product was successfully created."
    And I should see "Phone"
    And I should see "101" # price after increment
