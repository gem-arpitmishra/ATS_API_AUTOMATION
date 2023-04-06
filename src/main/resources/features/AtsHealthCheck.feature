Feature: ATS scenario

  Scenario Outline: ATS , Create a new Job
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint            | method | expectedStatus | payload_key | payload_value                 |
      | PostNewJob          | post   | 201            | job,jdFile  | apiCheckJob1.json,sample1.txt |
      | UpdateJob           | put    | 200            | job,jdFile  | apiJobUpdate.json,sample1.txt |
      | UpdateJobUsingJobID | put    | 200            | job,jdFile  | apiJobUpdate.json,sample1.txt |

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

  Scenario Outline: ATS, Create an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                             |
      | SaveApplicantDetails   | post   | 201            | applicantData,resume,image | Applicant.json,Skribbl.pptx,Skribbl.pptx  |
      | UpdateApplicantDetails | put    | 201            | applicantData,resume,image | Applicant.json, Skribbl.pptx,Skribbl.pptx |


  Scenario Outline: ATS, Align the applicant to that job

    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint      | method | expectedStatus | stage |
      | AlignToNewJob | post   | 201            |       |

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


  Scenario Outline:ATS , Set the applicant stage to "Approved"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | UpdateStageOfApplicant | put    | 201            | 2     |


  Scenario Outline:ATS, API to schedule interview for the same job and same applicant
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    |
      | addNewInterview | post   | 201            | interview1 |

  Scenario Outline: ATS, API to get interviews for a particular job
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | interviewsForAParticularJob | get    | 200            |

  Scenario Outline: ATS, API to fetch interview by interview ID
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                       | method | expectedStatus |
      | apiToGetInterviewByInterviewId | get    | 200            |

  Scenario Outline: ATS, API to fetch all the employees who can be attendee or interviewer for an interview
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                                   | method | expectedStatus |
      | getAllEmployeesWhoCanBeAttendeeOrInterviewerForAnInterview | get    | 200            |

  Scenario Outline: ATS, API to get all interviews of an applicant on basis of applicant ID
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                          | method | expectedStatus |
      | getAllInterviewsOfAnApplicantOnBasisOfApplicantId | get    | 200            |

  Scenario Outline: ATS, API to get feedback for all interviews for a Job
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                           | method | expectedStatus |
      | getFeedbackForAllInterviewsForAJob | get    | 200            |

  Scenario Outline: ATS, API to get feedback of an interview on the basis of interview id
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus |
      | getFeedbackOfAnInterview | get    | 200            |

  Scenario Outline: ATS, API to get feedback list of all interviews of an applicant
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                    | method | expectedStatus |
      | getFeedbackListOfAllInterviewsOfAnApplicant | get    | 200            |

#TO WORK ON THIS SCENARIO
#  Scenario Outline : ATS, API to update the interview
#    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
#    Then Verify Interview status code <expectedStatus>
#    Examples:
#      | endpoint          | method | expectedStatus | payload    |
#      | updateAnInterview | put    | 200            | interview2 |

  Scenario Outline:ATS , Set the applicant stage to "Interview"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | UpdateStageOfApplicant | put    | 201            | 3     |

  Scenario Outline:ATS, API to send feedback reminder to all
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                  | method | expectedStatus |
      | sendFeedbackReminderToAll | post   | 200            |

  Scenario Outline:ATS, API to send feedback reminder on the basis of interview ID
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | sendFeedbackReminderBasedOnInterviewId | post   | 200            |

  Scenario Outline:ATS, API to post a new feedback
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   |
      | addNewFeedback | post   | 200            | feedback1 |

  Scenario Outline:ATS, API to update a feedback
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   |
      | addNewFeedback | put    | 200            | feedback2 |

  Scenario Outline:ATS , Set the applicant stage to "Management Approval"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | UpdateStageOfApplicant | put    | 201            | 4     |


  Scenario Outline:ATS, API to send management approval email without CC recipient
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                             | method | expectedStatus |
      | sendManagementApprovalEmailWithoutCC | post   | 200            |

  Scenario Outline:ATS, API to send management approval email with CC recipient
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus |
      | sendManagementApprovalEmailWithCC | post   | 200            |


  Scenario Outline:ATS, API to delete a feedback
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus |
      | deleteFeedback | delete | 200            |


  Scenario Outline:ATS, API to delete an interview
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus |
      | deleteAnInterview | delete | 200            |


  Scenario Outline: ATS,API to delete the applicant
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus |
      | deleteAnApplicant | delete | 200            |

  Scenario Outline: ATS,API to delete the job
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus |
      | deleteAJob | delete | 200            |


