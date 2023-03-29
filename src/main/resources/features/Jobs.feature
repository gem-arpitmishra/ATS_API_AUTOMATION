Feature: Jobs

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                   | method | expectedStatus |
      | FetchJobUsingSearchKeyword | get    | 200            |

  Scenario Outline: API VALIDATION: FetchConstants
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint     | method | expectedStatus |
      | GetConstants | get    | 200            |

  Scenario Outline: API VALIDATION: FetchDataForAllJobDetails
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus |
      | GetAllJobDetails | get    | 200            |

  Scenario Outline: API VALIDATION: FetchDataForEmployeeDirectory
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint           | method | expectedStatus |
      | FetchJobUsingJobID | get    | 200            |

  Scenario Outline: API VALIDATION: FetchDataForEmployeeDirectory
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus |
      | FetchJobDetails | get    | 200            |

  Scenario Outline: API VALIDATION: FetchDataForEmployeeDirectory
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                        | method | expectedStatus |
      | FetchRecruiterDetailsUsingJobID | get    | 200            |