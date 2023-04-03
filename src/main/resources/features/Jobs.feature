Feature: Jobs

  Scenario Outline: ATS, HealthCheck of Jobs API - <name>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | name                            | endpoint                        | method | expectedStatus |
      | FetchJobUsingSearchKeyword      | FetchJobUsingSearchKeyword      | get    | 200            |
      | GetConstants                    | GetConstants                    | get    | 200            |
      | GetAllJobDetails                | GetAllJobDetails                | get    | 200            |
      | FetchJobUsingJobID              | FetchJobUsingJobID              | get    | 200            |
      | FetchJobDetails                 | FetchJobDetails                 | get    | 200            |
      | FetchRecruiterDetailsUsingJobID | FetchRecruiterDetailsUsingJobID | get    | 200            |







