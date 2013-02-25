Feature: Large Warror can stab using a sword
  As a large warrior
  I would like to be able to do massive damage using a sword
  So i can kill people dead

  Scenario: Kill People with a sword
    Given I am a large warrior
    When I attempt to pick up a sword
    Then I am successful
