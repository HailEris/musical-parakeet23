Feature: Dexcom Code Challenge New User Registration

#A01
  #navigate to testing page +screenshot
  #page to register new user is displayed

Scenario: A01 - test page load
  Given user navigates to registration page
  When user navigates to registration page
  Then registration page displays

#A02
  #except for First Name: fill all required fields with valid data and check all checkboxes
   #select Save User button. +screenshot
  #validate error message displays indicating First Name is required value

Scenario: A02 - Registration attempt with First Name field blank
  Given user navigates to registration page
  When user fills all fields except First Name
  And user selects Save User button
  Then page displays "First Name cannot be blank" error

#A03
  #clear all fields
  #except for First Name: Fill all required fields with valid data and check all checkboxes
    #attempt to fill First Name field with 16 characters +save_input +screenshot
  #validate only 15 characters are allowed in field +save_field_contents

Scenario: A03 - First Name character limit test
  Given user navigates to registration page
  When user fills all fields except First Name
  And user enters 16 characters in First Name field
  Then only 15 characters remain in First Name field

#A04
  #clear all fields
  #except for suffix: fill all fields with valid data and check all checkboxes +screenshot
  #no validation?

#A05
  #assumed to be immediately after A04
  #select Save User button +screenshot
  #validate Success Page is displayed
  #validate no error messages displayed

Scenario: A04 A05 - Successful User Registration
  Given user navigates to registration page
  When user fills all fields with valid data
  And user selects Save User button
  Then Success page displays
  And no error messages displayed

#A06
  #navigate to testing page (is there a need to log out or clear data?)
  #no validation stated. validate page to register new user is displayed as matter of course?

#A07
  #clear all fields (shouldn't all fields be clear already?)
  #except Title field: fill all fields with valid data and check all checkboxes
    #enter value containing letters and at least one number in Title field
    #select Save User button +screenshot
  #validate error message displays indicating Title field only accepts letters and spaces

  Scenario: A06 A07 - Invalid input in Title field
    Given user navigates to registration page
    When user fills all fields except Title
    And user enters Title value with numbers
    And user selects Save User button
    Then page displays "Title can only contain letters and spaces" error

#A08
  #clear all fields (shouldn't all fields be clear already?)
  #except Title field: fill all fields with valid data and check all checkboxes
    #enter value containing letters and at least one space in Title field
    #select Save User button +screenshot
  #validate Success Page is displayed
  #validate no error messages displayed

  Scenario: A08 - Valid input in Title field
    Given user navigates to registration page
    When user fills all fields except Title
    And user enters Title value with alpha and space characters
    And user selects Save User button
    Then Success page displays
    And no error messages displayed