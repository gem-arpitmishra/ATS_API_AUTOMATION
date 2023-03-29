Feature: Applicants

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                   | method | expectedStatus |
      | FetchApplicantUsingFilters | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint             | method | expectedStatus |
      | FetchApplicantWithId | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                     | method | expectedStatus |
      | FetchCurrentStageOfApplicant | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                            | method | expectedStatus |
      | FetchApplicantOnSearchUsingPagesize | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus |
      | FetchApplicantOnSearch | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | FetchResumeUsingApplicantId | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                      | method | expectedStatus |
      | FetchApplicantPersonalDetails | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                      | method | expectedStatus |
      | FetchApplicantNotAlignedToJob | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint            | method | expectedStatus |
      | FetchJobOfApplicant | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint      | method | expectedStatus |
      | FetchListOfHR | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                | method | expectedStatus |
      | FetchApplicantConstants | get    | 200            |

  Scenario Outline: API VALIDATION: FetchJobUsing SearchKeyword
    Given Set the Applicant endpoint "<endpoint>" and method "<method>"
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | FetchAllApplicantWithPaging | get    | 200            |