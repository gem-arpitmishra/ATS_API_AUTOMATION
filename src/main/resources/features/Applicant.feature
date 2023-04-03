Feature: Applicants

  Scenario Outline: API VALIDATION: HealthCheck of Applicants Api
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                            | method | expectedStatus |
      | FetchApplicantUsingFilters          | get    | 200            |
      | FetchApplicantWithId                | get    | 200            |
      | FetchCurrentStageOfApplicant        | get    | 200            |
      | FetchApplicantOnSearchUsingPagesize | get    | 200            |
      | FetchApplicantOnSearch              | get    | 200            |
      | FetchResumeUsingApplicantId         | get    | 200            |
      | FetchApplicantPersonalDetails       | get    | 200            |
      | FetchJobOfApplicant                 | get    | 200            |
      | FetchListOfHR                       | get    | 200            |
      | FetchApplicantConstants             | get    | 200            |
      | FetchAllApplicantWithPaging         | get    | 200            |

