Feature: Jobs

  Scenario Outline: API VALIDATION: HealthCheck of Jobs API
    Given Set the Job endpoint "<endpoint>" and method "<method>"
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                        | method | expectedStatus |
      | FetchJobUsingSearchKeyword      | get    | 200            |
      | GetConstants                    | get    | 200            |
      | GetAllJobDetails                | get    | 200            |
      | FetchJobUsingJobID              | get    | 200            |
      | FetchJobDetails                 | get    | 200            |
      | FetchRecruiterDetailsUsingJobID | get    | 200            |



