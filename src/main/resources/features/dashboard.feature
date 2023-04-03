Feature: Dashboard

  Scenario Outline: ATS, API to get List Of Jobs Along With The Applicant Mapped To Each Jobs And The Interview Aligned For Them
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                                                                   | method | expectedStatus |
      | getListOfJobsAlongWithTheApplicantMappedAndInterview | get    | 200            |

  Scenario Outline:ATS, API to get Yearly Report Of DashboardCount / Applicant Count/ Offered Candidate Count
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                                             | method | expectedStatus |
      | getYearlyReportOfJobCount/ApplicantCount/OfferedCandidateCount | get    | 200            |

  Scenario Outline:ATS, API to get Number Of Applicants Based On Stage
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus |
      | getNumberOfApplicantsBasedOnStage | get    | 200            |