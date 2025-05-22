Feature: Points of Sale Management
  This feature allows users to create and modify points of sale (POS).

  Scenario: Insert and retrieve two POS
    Given an empty POS list
    When I insert POS with the following elements
      | name                   | description             | type             | campus | street          | houseNumber | postalCode | city     |
      | Lidl (Nürnberger Str.) | Vending machine at Lidl | VENDING_MACHINE  | ZAPF   | Nürnberger Str. | 3a          | 95448      | Bayreuth |
      | New Cafe               | Fancy new cafe          | CAFE             | MAIN   | Teststraße      | 99          | 12345      | New City |
    Then the POS list should contain the same elements in the same order

  Scenario: Update one of three existing POS
    Given an empty POS list
    When I insert POS with the following elements
      | name                   | description             | type             | campus | street          | houseNumber | postalCode | city     |
      | Lidl (Nürnberger Str.) | Vending machine at Lidl | VENDING_MACHINE  | ZAPF   | Nürnberger Str. | 3a          | 95448      | Bayreuth |
      | New Cafe               | Fancy new cafe          | CAFE             | MAIN   | Teststraße      | 99          | 12345      | New City |
      | Very New Cafe          | Newer than new cafe     | CAFE             | MAIN   | Newstraße       | 33          | 95448      | Bayreuth |
    And I update the description of the entry with the following name
      | name                   | description             | type             | campus | street          | houseNumber | postalCode | city     |
      | Very New Cafe          | New as a cucumber       | CAFE             | MAIN   | Newstraße       | 33          | 95448      | Bayreuth |
    Then the description of the POS should be updated accordingly
