Feature: Dashboard

  Scenario Outline: API to get List Of Dashboards Along With The Applicant Mapped To Each Dashboard And The Interview Aligned For Them
    Given Set the Dashboard endpoint "<endpoint>" and method "<method>"
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                                                                   | method | expectedStatus |
      | getListOfDashboardsAlongWithTheApplicantMappedToEachDashboardAndTheInterviewAlignedForThem | get    | 200            |

  Scenario Outline: API to get Yearly Report Of DashboardCount / Applicant Count/ Offered Candidate Count
    Given Set the Dashboard endpoint "<endpoint>" and method "<method>"
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                                             | method | expectedStatus |
      | getYearlyReportOfDashboardCount/ApplicantCount/OfferedCandidateCount | get    | 200            |

  Scenario Outline: API to get Number Of Applicants Based On Stage
    Given Set the Dashboard endpoint "<endpoint>" and method "<method>"
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus |
      | getNumberOfApplicantsBasedOnStage | get    | 200            |