@regression
Feature: ATS scenario

  Scenario Outline: ATS , Job using wrong method - <name>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                        | method | expectedStatus | name                             |
      | PostNewJob                      | get    | 405            | Create a job                     |
      | UpdateJob                       | get    | 405            | Update a job                     |
      | UpdateJobUsingJobID             | get    | 405            | Update a job using job ID        |
      | updateJobStatus                 | get    | 405            | Update Job Status                |
      | updateJobStatusUsingJobId       | get    | 405            | Update Job Status Using Order ID |
      | FetchJobUsingSearchKeyword      | post   | 405            | FetchJobUsingSearchKeyword       |
      | GetConstants                    | post   | 405            | GetConstants                     |
      | GetAllJobDetails                | post   | 405            | GetAllJobDetails                 |
      | FetchJobUsingJobID              | post   | 405            | FetchJobUsingJobID               |
      | FetchJobDetails                 | post   | 405            | FetchJobDetails                  |
      | FetchRecruiterDetailsUsingJobID | post   | 405            | FetchRecruiterDetailsUsingJobID  |

  Scenario Outline: ATS, Applicant using wrong method - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                | endpoint                            | method | expectedStatus |
      | FetchApplicantUsingFilters          | FetchApplicantUsingFilters          | post   | 405            |
      | FetchApplicantWithId                | FetchApplicantWithId                | post   | 405            |
      | FetchCurrentStageOfApplicant        | FetchCurrentStageOfApplicant        | post   | 405            |
      | FetchApplicantOnSearchUsingPagesize | FetchApplicantOnSearchUsingPagesize | post   | 405            |
      | FetchApplicantOnSearch              | FetchApplicantOnSearch              | post   | 405            |
      | FetchResumeUsingApplicantId         | FetchResumeUsingApplicantId         | post   | 405            |
      | FetchApplicantPersonalDetails       | FetchApplicantPersonalDetails       | post   | 405            |
      | FetchJobOfApplicant                 | FetchJobOfApplicant                 | post   | 405            |
      | FetchListOfHR                       | FetchListOfHR                       | post   | 405            |
      | FetchApplicantConstants             | FetchApplicantConstants             | post   | 405            |
      | FetchAllApplicantWithPaging         | FetchAllApplicantWithPaging         | post   | 405            |

