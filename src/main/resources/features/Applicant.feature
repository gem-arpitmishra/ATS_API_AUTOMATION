Feature: Applicants

  Scenario Outline: ATS, HealthCheck of Applicants API - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                | endpoint                            | method | expectedStatus |
      | FetchApplicantUsingFilters          | FetchApplicantUsingFilters          | get    | 200            |
      | FetchApplicantWithId                | FetchApplicantWithId                | get    | 200            |
      | FetchCurrentStageOfApplicant        | FetchCurrentStageOfApplicant        | get    | 200            |
      | FetchApplicantOnSearchUsingPagesize | FetchApplicantOnSearchUsingPagesize | get    | 200            |
      | FetchApplicantOnSearch              | FetchApplicantOnSearch              | get    | 200            |
      | FetchResumeUsingApplicantId         | FetchResumeUsingApplicantId         | get    | 200            |
      | FetchApplicantPersonalDetails       | FetchApplicantPersonalDetails       | get    | 200            |
      | FetchJobOfApplicant                 | FetchJobOfApplicant                 | get    | 200            |
      | FetchListOfHR                       | FetchListOfHR                       | get    | 200            |
      | FetchApplicantConstants             | FetchApplicantConstants             | get    | 200            |
      | FetchAllApplicantWithPaging         | FetchAllApplicantWithPaging         | get    | 200            |
