@apiReg
Feature: Rejection of an Applicant

  Scenario Outline: ATS, Run the API to generate access token
    Given Set the url to generate access token <method> method and url <url>
    Then Verify scenario status code <expectedStatus>
    Examples:
      | method | url         | expectedStatus |
      | post   | accessToken | 200            |




  Scenario Outline: ATS, <name> an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint             | method | expectedStatus | payload_key                | payload_value                    | name   |
      | saveApplicantDetails | post   | 201            | applicantData,resume,image | applicant.json,test.pdf,test.pdf | Create |

  Scenario Outline:ATS , Set the applicant stage to "New"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 200            | 9     |

  Scenario Outline: ATS, Align the applicant to that job

    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint      | method | expectedStatus | stage |
      | alignToNewJob | post   | 201            |       |

  Scenario Outline:ATS , Set the applicant stage to "In-Review"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 200            | 1     |

  Scenario Outline: ATS, API to get applicants in Vetting State
    Given Setting the Interview endpoint <endpoint> and method <method> , for getting applicants in Vetting
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | apiToGetApplicantsInVetting | get    | 200            |

  Scenario Outline: ATS, <name> an applicant and send him for vetting
    Given Setting the Applicant endpoint <endpoint> method <method> payload <payload> for vetting
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus | payload               | name   |
      | sendApplicantsForVetting | post   | 200            | applicantVetting.json | Create |

  Scenario Outline:ATS, API to post a new feedback for vetting
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload   |
      | addFeedbackForVetting | post   | 200            | feedback1 |

  Scenario Outline:ATS, API to schedule interview for the same job and same applicant
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    |
      | addNewInterview | post   | 201            | interview1 |

  Scenario Outline:ATS , Set the applicant stage to "Rejected"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 200            | 5     |

  Scenario Outline:ATS , Update the reason of Rejection using wrong method Get
    Given Set the Applicant endpoint <endpoint> and method <method> for wrong methods
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                | method | expectedStatus |
      | updateReasonOfRejection | get    | 405            |

  Scenario Outline:ATS , Update the reason of Rejection using wrong method Post
    Given Set the Applicant endpoint <endpoint> and method <method> for wrong methods
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                | method | expectedStatus |
      | updateReasonOfRejection | post   | 405            |