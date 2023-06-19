@hc
Feature: Dashboard

  Scenario Outline: ATS, Run the API to generate access token
    Given Set the url to generate access token <method> method and url <url>
    Then Verify scenario status code <expectedStatus>
    Examples:
      | method | url         | expectedStatus |
      | post   | accessToken | 200            |


  Scenario Outline: ATS, API to get List Of Jobs Along With The Applicant Mapped To Each Jobs And The Interview Aligned For Them
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                             | method | expectedStatus |
      | getListOfJobsAlongWithTheApplicantMappedAndInterview | get    | 200            |

  Scenario Outline:ATS, API to get Yearly Report Of DashboardCount / Applicant Count/ Offered Candidate Count
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                                       | method | expectedStatus |
      | getYearlyReportOfJobCount/ApplicantCount/OfferedCandidateCount | get    | 200            |

  Scenario Outline:ATS, API to get Number Of Applicants Based On Stage
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus |
      | getNumberOfApplicantsBasedOnStage | get    | 200            |

  Scenario Outline: API to get list of applicants month wise for a specific year
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                     | method | expectedStatus |
      | getListOfApplicantsMonthWiseForASpecificYear | get    | 200            |

  Scenario Outline: API to  get list of offered applicants month wise for a specific year
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                            | method | expectedStatus |
      | getListOfOfferedApplicantsMonthWiseForASpecificYear | get    | 200            |

  Scenario Outline: API to get list of jobs month wise for a specific year
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | getListOfJobsMonthWiseForASpecificYear | get    | 200            |