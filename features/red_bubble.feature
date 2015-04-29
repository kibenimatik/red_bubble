Feature: My app works
  Scenario: App shows help
    When I get help for "red_bubble"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
      |--input|
      |--output|
      |--layout|
    And the banner should document that this app takes no arguments

  Scenario: App generates index html file
    When I run `red_bubble -i ../../data/input.xml`
    Then the exit status should be 0
    And the "output" folder contains "index.html" file
