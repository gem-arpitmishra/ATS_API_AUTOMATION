@hc
Feature: ATS scenario

  Scenario Outline: ATS, Run the API to generate access token
    Given Set the url to generate access token <method> method and url <url>
    Then Verify scenario status code <expectedStatus>
    Examples:
      | method | url         | expectedStatus |
      | post   | accessToken | 200            |

  Scenario Outline: ATS, HealthCheck of GetVetterHistory - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name             | endpoint         | method | expectedStatus |
      | GetVetterHistory | getVetterHistory | get    | 200            |

  Scenario Outline: ATS ,Job--> <name1>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint            | method | expectedStatus | payload_key | payload_value              | name1                     |
      | postNewJob          | post   | 201            | job,jdFile  | apiCheckJob1.json,new4.doc | Create a job              |
      | updateJob           | put    | 200            | job,jdFile  | apiJobUpdate.json,new4.doc | Update a job              |
      | updateJobUsingJobID | put    | 200            | job,jdFile  | apiJobUpdate.json,new4.doc | Update a job using job ID |

  Scenario Outline: ATS , Job---><name1>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | name1             |
      | updateJobStatus | put    | 200            | Update Job Status |

  Scenario Outline: ATS, HealthCheck of Jobs API - <name>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | name                                                   | endpoint                                               | method | expectedStatus |
      | FetchJobUsingSearchKeyword                             | fetchJobUsingSearchKeyword                             | get    | 200            |
      | GetConstants                                           | getConstants                                           | get    | 200            |
      | GetAllJobDetails                                       | getAllJobDetails                                       | get    | 200            |
      | FetchJobUsingJobID                                     | fetchJobUsingJobID                                     | get    | 200            |
      | GetAllJobDetailsOnTheBasisOfAppliedSearchFilterAndDate | getAllJobDetailsOnTheBasisOfAppliedSearchFilterAndDate | get    | 200            |
      | GetAllJobDetailsOnTheBasisOfDate                       | getAllJobDetailsOnTheBasisOfDate                       | get    | 200            |
      | GetAllJobDetailsOnTheBasisOfSearchAndDate              | getAllJobDetailsOnTheBasisOfSearchAndDate              | get    | 200            |
      | FetchJobDetails                                        | fetchJobDetails                                        | get    | 200            |

  Scenario Outline: ATS, <name> an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint             | method | expectedStatus | payload_key                | payload_value                      | name   |
      | saveApplicantDetails | post   | 201            | applicantData,resume,image | applicant.json,resume.pdf,test.pdf | Create |

  Scenario Outline:ATS , Set the applicant stage to "New"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 200            | 9     |


  Scenario Outline: ATS, HealthCheck of Applicants API - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                 | endpoint             | method | expectedStatus |
      | FetchApplicantWithId | fetchApplicantWithId | get    | 200            |

  Scenario Outline: ATS, <name> an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint                        | method | expectedStatus | payload_key                | payload_value                      | name              |
      | updateApplicantOnTheBasisOfUuid | put    | 201            | applicantData,resume,image | applicant.json,resume.pdf,test.pdf | Update Using UUID |
      | updateApplicantDetails          | put    | 201            | applicantData,resume,image | applicant.json,resume.pdf,test.pdf | Update            |


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

  Scenario Outline: ATS, HealthCheck of Applicants API - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                     | endpoint                                 | method | expectedStatus |
      | FetchApplicantUsingFilters               | fetchApplicantUsingFilters               | get    | 200            |
      | FetchCurrentStageOfApplicant             | fetchCurrentStageOfApplicant             | get    | 200            |
      | FetchAParticularApplicantDetail          | fetchAParticularApplicantDetail          | get    | 200            |
      | FetchApplicantOnSearchUsingPagesize      | fetchApplicantOnSearchUsingPagesize      | get    | 200            |
      | FetchApplicantOnSearch                   | fetchApplicantOnSearch                   | get    | 200            |
      | FetchResumeUsingApplicantId              | fetchResumeUsingApplicantId              | get    | 200            |
      | FetchApplicantPersonalDetails            | fetchApplicantPersonalDetails            | get    | 200            |
      | FetchJobOfApplicant                      | fetchJobOfApplicant                      | get    | 200            |
      | FetchApplicantConstants                  | fetchApplicantConstants                  | get    | 200            |
      | FetchAllApplicantWithPaging              | fetchAllApplicantWithPaging              | get    | 200            |
      | FetchApplicantUsingPageNumberSizeAndDate | fetchApplicantUsingPageNumberSizeAndDate | get    | 200            |
      | FetchApplicantUsingDate                  | fetchApplicantUsingDate                  | get    | 200            |


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

  Scenario Outline: ATS, API to fetch interviews for Vetting for a particular email ID
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                        | method | expectedStatus |
      | apiToGetInterviewsForVettingForAParticularEmail | get    | 200            |

  Scenario Outline:ATS, API to schedule interview for the same job and same applicant
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    |
      | addNewInterview | post   | 201            | interview1 |

  Scenario Outline:ATS, API to send feedback reminder on the basis of interview ID
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | sendFeedbackReminderBasedOnInterviewId | post   | 200            |

  Scenario Outline:ATS, API to update interview
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus | payload    |
      | updateAnInterview | put    | 200            | interview2 |

  Scenario Outline: ATS,API to update the notification data
    Given Setting the Interview endpoint <endpoint> , method <method> and payload <payload> for notification Read
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload               |
      | updateNotificationData | put    | 200            | notificationRead.json |

  Scenario Outline: ATS, API to get interviews for a particular job
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | interviewsForAParticularJob | get    | 200            |

  Scenario Outline: ATS,API to get Vetting History By Interviewer
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                       | method | expectedStatus |
      | getVettingHistoryByInterviewer | get    | 200            |

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


  Scenario Outline:ATS , Set the applicant stage to "Interview"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 200            | 3     |

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
      | updateStageOfApplicant | put    | 200            | 4     |

  Scenario Outline:ATS, API to send  email without CC recipient
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus |
      | sendEmails | post   | 200            |

  Scenario Outline:ATS, API to send  email with CC recipient
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus |
      | sendEmailsWithCC | post   | 200            |

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

  Scenario Outline: ATS, API to get notification data
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint            | method | expectedStatus |
      | getNotificationData | get    | 200            |

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

  Scenario Outline: API to add multiple Applicants
    Given Set the Applicant endpoint <endpoint> and method <method> and keys <payload_keys> , values <payload_values> to add multiple applicants
    Then  Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload_keys                  | payload_values                       |
      | addMultipleApplicants | post   | 201            | applicantList,resumes,resumes | applicantList.json,test.pdf,test.pdf |

  Scenario Outline: ATS, HealthCheck of Jobs API - <name>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | name             | endpoint         | method | expectedStatus |
      | GetJobAllDetails | getJobAllDetails | get    | 200            |

  Scenario Outline: ATS, HealthCheck of Applicants Paging API - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                 | endpoint                             | method | expectedStatus |
      | GetApplicantWithPaging               | getApplicantWithPaging               | get    | 200            |
      | GetApplicantWithPagingWithDaysFilter | getApplicantWithPagingWithDaysFilter | get    | 200            |

  Scenario Outline: ATS, HealthCheck of Applicants Paging API - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                               | endpoint                           | method | expectedStatus |
      | GetApplicantWithPagingWithPageSize | getApplicantWithPagingWithPageSize | get    | 200            |

  Scenario Outline: ATS,API to execute data masking for interview service
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                | method | expectedStatus |
      | dataMaskingForInterview | post   | 200            |

  Scenario Outline: ATS,API to execute data masking for applicants service
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus |
      | dataMaskingForApplicants | post   | 200            |