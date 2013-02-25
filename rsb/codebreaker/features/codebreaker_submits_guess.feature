Feature: code-breaker submits guess
  
  The code-breaker submits a guess of four numbers.  The game marks the guess
  with + and - signs.

  Scenario Outline:
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

    Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5555  |      |

    Scenarios: 1 number correct
      | code | guess | mark |
      | 1234 | 1555  | +    |
      | 1234 | 2555  | -    |

    Scenarios: 2 numbers correct
      | code | guess | mark |
      | 1234 | 5254  | ++   |
      | 1234 | 5154  | +-   |
      | 1234 | 5125  | --   |

    Scenarios: 3 numbers correct
      | code | guess | mark |
      | 1234 | 1235  | +++  |
      | 1234 | 1245  | ++-  |
      | 1234 | 1345  | +--  |
      | 1234 | 2345  | ---  |

    Scenarios: all numbers correct
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 2341  | ---- |
