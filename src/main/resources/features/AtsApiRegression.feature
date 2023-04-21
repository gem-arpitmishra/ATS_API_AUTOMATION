@apiReg
Feature: ATS scenario

  Scenario Outline: ATS , Job using wrong method---><name>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                        | method | expectedStatus | name                             |
      | postNewJob                      | get    | 405            | Create a job                     |
      | interviewsForAParticularJob     | post   | 405            | get Interviews for a job         |
      | updateJob                       | get    | 405            | Update a job                     |
      | updateJobUsingJobID             | get    | 405            | Update a job using job ID        |
      | updateJobStatus                 | get    | 405            | Update Job Status                |
      | updateJobStatusUsingOrderId     | get    | 405            | Update Job Status Using Order ID |
      | fetchJobUsingSearchKeyword      | post   | 405            | FetchJobUsingSearchKeyword       |
      | getConstants                    | post   | 405            | GetConstants                     |
      | getAllJobDetails                | post   | 405            | GetAllJobDetails                 |
      | fetchJobUsingJobID              | post   | 405            | FetchJobUsingJobID               |
      | fetchJobDetails                 | post   | 405            | FetchJobDetails                  |
      | fetchRecruiterDetailsUsingJobID | post   | 405            | FetchRecruiterDetailsUsingJobID  |

  Scenario Outline: ATS, Applicant using wrong method - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                | endpoint                            | method | expectedStatus |
      | Create                              | saveApplicantDetails                | delete | 405            |
      | Update                              | updateApplicantDetails              | delete | 405            |
      | AlignToNewJob                       | alignToNewJob                       | delete | 405            |
      | FetchApplicantUsingFilters          | fetchApplicantUsingFilters          | post   | 405            |
      | FetchApplicantWithId                | fetchApplicantWithId                | post   | 405            |
      | FetchCurrentStageOfApplicant        | fetchCurrentStageOfApplicant        | post   | 405            |
      | FetchApplicantOnSearchUsingPagesize | fetchApplicantOnSearchUsingPagesize | post   | 405            |
      | FetchApplicantOnSearch              | fetchApplicantOnSearch              | post   | 405            |
      | FetchResumeUsingApplicantId         | fetchResumeUsingApplicantId         | post   | 405            |
      | FetchApplicantPersonalDetails       | fetchApplicantPersonalDetails       | post   | 405            |
      | FetchJobOfApplicant                 | fetchJobOfApplicant                 | post   | 405            |
      | FetchListOfHR                       | fetchListOfHR                       | post   | 405            |
      | FetchApplicantConstants             | fetchApplicantConstants             | post   | 405            |
      | FetchAllApplicantWithPaging         | fetchAllApplicantWithPaging         | post   | 405            |

  Scenario Outline:ATS, Negative Testing of API to get list of all interviews using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus |
      | getAllInterviews | delete | 405            |

#  Scenario Outline: ATS, Negative Testing of API to get interviews for a particular job using wrong Method
#    Given Set the Interview endpoint <endpoint> and method <method>
#    Then Verify Interview status code <expectedStatus>
#    Examples:
#      | endpoint                    | method | expectedStatus |
#      | interviewsForAParticularJob | post   | 405            |


  Scenario Outline: ATS, Negative Testing of API to fetch all the employees who can be attendee or interviewer for an interview using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                                   | method | expectedStatus |
      | getAllEmployeesWhoCanBeAttendeeOrInterviewerForAnInterview | patch  | 405            |

  Scenario Outline: ATS, Negative Testing of API to fetch interview by interview ID by using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                       | method | expectedStatus |
      | apiToGetInterviewByInterviewId | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to fetch interview on a particular date using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                       | method | expectedStatus |
      | getInterviewsOnAParticularDate | patch  | 405            |

  Scenario Outline: ATS, Negative Testing of API to get all interviews of an applicant on basis of applicant ID using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                          | method | expectedStatus |
      | getAllInterviewsOfAnApplicantOnBasisOfApplicantId | patch  | 405            |


  Scenario Outline: ATS, Negative testing of API to get list of all interviews on the basis of days using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfDays | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get list of all interviews using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus |
      | getListOfAllInterviews | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get list of all interviews on the basis of the applied search filter using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                       | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfSearchedText | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get list of all interviews on the basis of applied search filter and without days using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                                         | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfAppliedSearchFilterWithoutDays | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get list of all interviews on the basis of applied search filter and with days using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                                | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfAppliedFilterWithDays | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get feedback list using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus |
      | getFeedbackList | delete | 405            |

  Scenario Outline: ATS, Negative testing of API to get feedback for all interviews for a Job using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                           | method | expectedStatus |
      | getFeedbackForAllInterviewsForAJob | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get feedback of an interview on the basis of interview id using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus |
      | getFeedbackOfAnInterview | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get feedback list of all interviews of an applicant using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                    | method | expectedStatus |
      | getFeedbackListOfAllInterviewsOfAnApplicant | patch  | 405            |

  Scenario Outline: ATS, Negative testing of API to get feedback list on the basis of days using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                     | method | expectedStatus |
      | getFeedbackListOnBasisOfDays | patch  | 405            |

  Scenario Outline:ATS, Negative testing of API to delete an interview using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus |
      | deleteAnInterview | get    | 405            |

#  Scenario Outline:ATS, Negative testing of API to delete an interview using wrong Header
#    Given Set the Interview endpoint <endpoint> , wrong objectId <objectId> and  method <method>
#    Then Verify Interview status code <expectedStatus>
#    Examples:
#      | endpoint          | method | expectedStatus | objectId |
#      | deleteAnInterview | delete | 500            |          |


  Scenario Outline:ATS , Negative Testing of API to set the applicant stage to "Approved" using wrong Method
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                              | method | expectedStatus | stage |
      | negativeTestingToUpdateApplicantStage | delete | 405            | 2     |


  Scenario Outline:ATS, Negative Testing of API to schedule interview for the same job and same applicant using wrong Method
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    |
      | addNewInterview | delete | 405            | interview1 |

  Scenario Outline:ATS, Negative Testing of API to send feedback reminder to all using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                  | method | expectedStatus |
      | sendFeedbackReminderToAll | get    | 405            |

  Scenario Outline:ATS, Negative testing of API to send feedback reminder on the basis of interview ID using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | sendFeedbackReminderBasedOnInterviewId | delete | 405            |

  Scenario Outline:ATS, Negative testing of API to post a new feedback using wrong Method
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   |
      | addNewFeedback | delete | 405            | feedback1 |

  Scenario Outline:ATS, Negative testing of API to update a feedback using wrong Method
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   |
      | addNewFeedback | delete | 405            | feedback2 |


  Scenario Outline:ATS,Negative testing of  API to send management approval email without CC recipient using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                             | method | expectedStatus |
      | sendManagementApprovalEmailWithoutCC | delete | 405            |

  Scenario Outline:ATS, Negative testing of API to send management approval email with CC recipient using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus |
      | sendManagementApprovalEmailWithCC | delete | 405            |

  Scenario Outline:ATS, Negative Testing of API to send  email without CC recipient usimg wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus |
      | sendEmails | delete | 405            |

  Scenario Outline:ATS, Negative testing of API to send  email with CC recipient using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus |
      | sendEmailsWithCC | delete | 405            |

  Scenario Outline:ATS, Negative testing of API to delete a feedback using wrong Method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus |
      | deleteFeedback | put    | 405            |

  Scenario Outline: ATS,Negative testing of API to delete the applicant using wrong Method
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus |
      | deleteAnApplicant | put    | 405            |

  Scenario Outline: ATS,Negative testing of API to delete the job using wrong Method
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus |
      | deleteAJob | put    | 405            |

  Scenario Outline: ATS, Negative testing of API to get List Of Jobs Along With The Applicant Mapped To Each Jobs And The Interview Aligned For Them using wrong Method
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                             | method | expectedStatus |
      | getListOfJobsAlongWithTheApplicantMappedAndInterview | post   | 405            |

  Scenario Outline:ATS, Negative testing of API to get Yearly Report Of DashboardCount / Applicant Count/ Offered Candidate Count using wrong Method
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                                                       | method | expectedStatus |
      | getYearlyReportOfJobCount/ApplicantCount/OfferedCandidateCount | post   | 405            |

  Scenario Outline:ATS, Negative testing of API to get Number Of Applicants Based On Stage using wrong Method
    Given Set the Dashboard endpoint <endpoint> and method <method>
    Then Verify Dashboard status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus |
      | getNumberOfApplicantsBasedOnStage | post   | 405            |

  Scenario Outline: ATS <name1>,Jobs API using invalid <field>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus | payload_key | payload_value              | name1        | field       |
      | postNewJob | post   | 400            | job,jdFile  | jobCheck1.json,sample1.txt | Create a job | MinExp      |
      | postNewJob | post   | 400            | job,jdFile  | jobCheck2.json,sample1.txt | Create a job | JobStatus   |
      | postNewJob | post   | 400            | job,jdFile  | jobCheck3.json,sample1.txt | Create a job | MaxExp      |
      | postNewJob | post   | 400            | job,jdFile  | jobCheck4.json,sample1.txt | Create a job | reqQuantity |
      | postNewJob | post   | 400            | job,jdFile  | jobCheck5.json,sample1.txt | Create a job | orderId     |
      | updateJob  | put    | 400            | job,jdFile  | jobCheck1.json,sample1.txt | Update a job | MinExp      |
      | updateJob  | put    | 400            | job,jdFile  | jobCheck2.json,sample1.txt | Update a job | JobStatus   |
      | updateJob  | put    | 400            | job,jdFile  | jobCheck3.json,sample1.txt | Update a job | MaxExp      |
      | updateJob  | put    | 400            | job,jdFile  | jobCheck4.json,sample1.txt | Update a job | reqQuantity |
      | updateJob  | put    | 400            | job,jdFile  | jobCheck5.json,sample1.txt | Update a job | orderId     |

  Scenario Outline: ATS <name1>,Jobs API removing <field>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint  | method | expectedStatus | payload_key | payload_value              | name1        | field     |
      | updateJob | put    | 500            | job,jdFile  | jobCheck7.json,sample1.txt | Update a job | JobId     |
      | updateJob | put    | 500            | job,jdFile  | jobCheck6.json,test.pdf    | Update a job | JobStatus |

  Scenario Outline: ATS <name1>,Applicants API removing <field>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                                 | name1            | field            |
      | saveApplicantDetails   | post   | 500            | applicantData,resume,image | applicantTest1.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | Email            |
      | saveApplicantDetails   | post   | 500            | applicantData,resume,image | applicantTest2.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | Phone no         |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicant.json,Skribbl.pptx,Skribbl.pptx      | Update Applicant | ApplicantId      |

  Scenario Outline: ATS <name1>,Applicant API using invalid <field>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                                 | name1            | field                 |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest4.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | TotalYearOfExperience |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest5.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | RelevantExperience    |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest6.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | Percentage            |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest8.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | FromDate              |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest9.json,Skribbl.pptx,Skribbl.pptx | Create Applicant | ToDate                |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest3.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | ApplicantId           |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest4.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | TotalYearOfExperience |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest5.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | RelevantExperience    |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest6.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | Percentage            |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest7.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | Phone no              |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest8.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | FromDate              |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest9.json,Skribbl.pptx,Skribbl.pptx | Update Applicant | ToDate                |

  Scenario Outline: ATS ,Job--> <name1>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint            | method | expectedStatus | payload_key | payload_value                 | name1                     |
      | postNewJob          | post   | 201            | job,jdFile  | apiCheckJob1.json,sample1.txt | Create a job              |
      | updateJob           | put    | 200            | job,jdFile  | apiJobUpdate.json,sample1.txt | Update a job              |
      | updateJobUsingJobID | put    | 200            | job,jdFile  | apiJobUpdate.json,sample1.txt | Update a job using job ID |

  Scenario Outline: ATS , Job---><name1>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | name1             |
      | updateJobStatus | put    | 200            | Update Job Status |
#      | updateJobStatusUsingOrderId | put    | 200            | Update Job Status Using Order ID |


#  Scenario Outline: ATS, HealthCheck of Jobs API - <name>
#    Given Set the Job endpoint <endpoint> and method <method>
#    Then Verify Job status code <expectedStatus>
#    Examples:
#      | name                            | endpoint                        | method | expectedStatus |
#      | FetchJobUsingSearchKeyword      | FetchJobUsingSearchKeyword      | get    | 200            |
#      | GetConstants                    | GetConstants                    | get    | 200            |
#      | GetAllJobDetails                | GetAllJobDetails                | get    | 200            |
#      | FetchJobUsingJobID              | FetchJobUsingJobID              | get    | 200            |
#      | FetchJobDetails                 | FetchJobDetails                 | get    | 200            |
#      | FetchRecruiterDetailsUsingJobID | FetchRecruiterDetailsUsingJobID | get    | 200            |

  Scenario Outline: ATS, <name> an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                            | name   |
      | saveApplicantDetails   | post   | 201            | applicantData,resume,image | applicant.json,Skribbl.pptx,Skribbl.pptx | Create |
      | updateApplicantDetails | put    | 201            | applicantData,resume,image | applicant.json,Skribbl.pptx,Skribbl.pptx | Update |

  Scenario Outline: ATS, Align the applicant to that job

    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint      | method | expectedStatus | stage |
      | alignToNewJob | post   | 201            |       |

#  Scenario Outline: ATS, HealthCheck of Applicants API - <name>
#    Given Set the Applicant endpoint <endpoint> and method <method>
#    Then Verify Applicant status code <expectedStatus>
#    Examples:
#      | name                                | endpoint                            | method | expectedStatus |
#      | FetchApplicantUsingFilters          | FetchApplicantUsingFilters          | get    | 200            |
#      | FetchApplicantWithId                | FetchApplicantWithId                | get    | 200            |
#      | FetchCurrentStageOfApplicant        | FetchCurrentStageOfApplicant        | get    | 200            |
#      | FetchApplicantOnSearchUsingPagesize | FetchApplicantOnSearchUsingPagesize | get    | 200            |
#      | FetchApplicantOnSearch              | FetchApplicantOnSearch              | get    | 200            |
#      | FetchResumeUsingApplicantId         | FetchResumeUsingApplicantId         | get    | 200            |
#      | FetchApplicantPersonalDetails       | FetchApplicantPersonalDetails       | get    | 200            |
#      | FetchJobOfApplicant                 | FetchJobOfApplicant                 | get    | 200            |
#      | FetchListOfHR                       | FetchListOfHR                       | get    | 200            |
#      | FetchApplicantConstants             | FetchApplicantConstants             | get    | 200            |
#      | FetchAllApplicantWithPaging         | FetchAllApplicantWithPaging         | get    | 200            |


  Scenario Outline:ATS , Set the applicant stage to "Approved"
    Given Set the Applicant endpoint <endpoint> and method <method> with header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 201            | 2     |


  Scenario Outline:ATS, API to schedule interview for the same job and same applicant using wrong <key> field in the payload
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload     | key       |
      | addNewInterview | post   | 400            | interview3  | startTime |
#      | addNewInterview | post   | 400            | interview4 |startTime |
#      | addNewInterview | post   | 400            | interview6 |title |
#      | addNewInterview | post   | 400            | interview7 |interviewType |
#      | addNewInterview | post   | 400            | interview8 |interviewType |
      | addNewInterview | post   | 400            | interview9  | attendees |
      | addNewInterview | post   | 400            | interview10 | attendees |
#      | addNewInterview | post   | 400            | interview6 |startTime |
      | addNewInterview | post   | 400            | interview11 | endTime   |
#      | addNewInterview | post   | 500            | interview12 |endTime  |

  Scenario Outline:ATS, API to schedule interview for the same job and same applicant without using <key> field in the payload
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    | key              |
      | addNewInterview | post   | 500            | interview4 | startTime        |
#      | addNewInterview | post   | 400            | interview4 |startTime |
#      | addNewInterview | post   | 400            | interview6 |title |
#      | addNewInterview | post   | 400            | interview7 |interviewType |
#      | addNewInterview | post   | 400            | interview8 |interviewType |
      | addNewInterview | post   | 500            | interview6 | interviewerEmail |
      | addNewInterview | post   | 500            | interview7 | endTime          |
#      | addNewInterview | post   | 400            | interview6 |startTime |
#      | addNewInterview | post   | 500            | interview12 |endTime  |

  Scenario Outline:ATS, API to schedule interview for the same job and same applicant without using header
    Given Set the Interview endpoint <endpoint> , method <method> , payload <payload> without using header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    | header   |
      | addNewInterview | post   | 400            | interview1 | ObjectID |


  Scenario Outline:ATS, API to schedule interview for the same job and same applicant  using wrong header
    Given Set the Interview endpoint <endpoint> , method <method> , payload <payload>  using wrong header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    | header   |
      | addNewInterview | post   | 500            | interview1 | ObjectID |


  Scenario Outline:ATS, API to schedule interview for the same job and same applicant
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    |
      | addNewInterview | post   | 201            | interview1 |

  Scenario Outline:ATS, API to send feedback reminder to all without using header
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                  | method | expectedStatus | header   |
      | sendFeedbackReminderToAll | post   | 400            | ObjectID |

  Scenario Outline:ATS, API to send feedback reminder on the basis of interview ID without using header
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus | header   |
      | sendFeedbackReminderBasedOnInterviewId | post   | 400            | ObjectID |

  Scenario Outline:ATS, API to send feedback reminder to all using wrong header ObjectID
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                  | method | expectedStatus | header   |
      | sendFeedbackReminderToAll | post   | 500            | ObjectID |

  Scenario Outline:ATS, API to send feedback reminder based on Interview ID using wrong header ObjectID
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus | header   |
      | sendFeedbackReminderBasedOnInterviewId | post   | 500            | ObjectID |

  Scenario Outline:ATS, API to update interview for the same job and same applicant using wrong <key>  field value in the payload
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus | payload          | key       |
      | updateAnInterview | put    | 400            | updateInterview1 | startTime |
      | updateAnInterview | put    | 400            | updateInterview2 | attendees |
      | updateAnInterview | put    | 400            | updateInterview3 | attendees |
      | updateAnInterview | put    | 400            | updateInterview4 | endTime   |


  Scenario Outline:ATS, API to update an interview for the same job and same applicant without using <key> field in the payload
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus | payload          | key              |
      | updateAnInterview | put    | 500            | updateInterview5 | startTime        |
      | updateAnInterview | put    | 500            | updateInterview6 | interviewerEmail |
      | updateAnInterview | put    | 500            | updateInterview7 | endTime          |

  Scenario Outline:ATS, API to update interview for the same job and same applicant without using header
    Given Set the Interview endpoint <endpoint> , method <method> , payload <payload> without using header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus | payload    | header   |
      | updateAnInterview | put    | 400            | interview2 | objectId |


  Scenario Outline:ATS, API to post a new feedback using wrong  <name> field value in payload
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   | name          |
      | addNewFeedback | post   | 400            | feedback3 | selectionType |

  Scenario Outline:ATS, API to update a feedback using wrong <name>field value in payload
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   | name          |
      | addNewFeedback | put    | 400            | feedback4 | selectionType |

  Scenario Outline:ATS, API to post a new feedback without using <name> field  in payload
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   | name          |
      | addNewFeedback | post   | 500            | feedback5 | selectionType |


  Scenario Outline:ATS, API to post a new feedback
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   |
      | addNewFeedback | post   | 200            | feedback1 |

  Scenario Outline:ATS, API to send management approval email without CC recipient without using header OBJECT ID
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                             | method | expectedStatus | header   |
      | sendManagementApprovalEmailWithoutCC | post   | 400            | ObjectID |

  Scenario Outline:ATS, API to send management approval email without CC recipient without using header EMAIL
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                             | method | expectedStatus | header |
      | sendManagementApprovalEmailWithoutCC | post   | 400            | Emaill |

  Scenario Outline:ATS, API to send management approval email with CC recipient without using header Email
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus | header |
      | sendManagementApprovalEmailWithCC | post   | 400            | Email  |

  Scenario Outline:ATS, API to send management approval email with CC recipient without using header Object ID
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus | header   |
      | sendManagementApprovalEmailWithCC | post   | 400            | ObjectID |

  Scenario Outline:ATS, API to send  management approval email without CC recipient using wrong header OBJECT ID
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                             | method | expectedStatus | header   |
      | sendManagementApprovalEmailWithoutCC | post   | 500            | ObjectID |

  Scenario Outline:ATS, API to send  management approval email without CC recipient using wrong header Email
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                             | method | expectedStatus | header |
      | sendManagementApprovalEmailWithoutCC | post   | 500            | Email  |

  Scenario Outline:ATS, API to send management approval email with CC recipient  using wrong header OBJECT ID
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus | header   |
      | sendManagementApprovalEmailWithCC | post   | 500            | ObjectID |

  Scenario Outline:ATS, API to send management approval email with CC recipient  using wrong header Email
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                          | method | expectedStatus | header |
      | sendManagementApprovalEmailWithCC | post   | 500            | Email  |


  Scenario Outline:ATS, API to send  email without CC recipient without using header ObjectID
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus | header   |
      | sendEmails | post   | 400            | ObjectID |

  Scenario Outline:ATS, API to send  email without CC recipient without using header Object ID
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus | header   |
      | sendEmailsWithCC | post   | 400            | ObjectID |

  Scenario Outline:ATS, API to send email without CC recipient  using wrong header ObjectId
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint   | method | expectedStatus | header   |
      | sendEmails | post   | 500            | ObjectID |

  Scenario Outline:ATS, API to send email with CC recipient using wrong header ObjectID
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus | header   |
      | sendEmailsWithCC | post   | 500            | ObjectID |

  Scenario Outline:ATS, API to update a feedback using wrong <name>field value in payload
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload   | name          |
      | addNewFeedback | put    | 500            | feedback6 | selectionType |

  Scenario Outline: ATS , Job---><name1> for wrong header
    Given Set the endpoint <endpoint> and method <method> for wrong header
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | name1             |
      | updateJobStatus | put    | 400            | Update Job Status |


  Scenario Outline: ATS , Job---><name1> using wrong header
    Given Set the endpoint <endpoint> and method <method> using wrong header
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | name1             |
      | updateJobStatus | put    | 400            | Update Job Status |

  Scenario Outline: ATS, <name> an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                            | name   |
      | saveApplicantDetails   | post   | 201            | applicantData,resume,image | applicant.json,Skribbl.pptx,Skribbl.pptx | Create |

  Scenario Outline: ATS, HealthCheck of Applicants API - <name> with wrong header
    Given Set the Applicant endpoint <endpoint> and method <method> with wrong header
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                | endpoint                            | method | expectedStatus |
      | FetchApplicantWithId                | fetchApplicantWithId                | get    | 400            |
      | FetchCurrentStageOfApplicant        | fetchCurrentStageOfApplicant        | get    | 400            |
      | FetchResumeUsingApplicantId         | fetchResumeUsingApplicantId         | get    | 400            |
      | FetchApplicantPersonalDetails       | fetchApplicantPersonalDetails       | get    | 400            |

  Scenario Outline: ATS, HealthCheck of Applicants API - <name> using wrong header
    Given Set the Applicant endpoint <endpoint> and method <method> using wrong header
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                | endpoint                            | method | expectedStatus |
      | FetchApplicantWithId                | fetchApplicantWithId                | get    | 400            |
      | FetchCurrentStageOfApplicant        | fetchCurrentStageOfApplicant        | get    | 400            |
      | FetchResumeUsingApplicantId         | fetchResumeUsingApplicantId         | get    | 400            |
      | FetchApplicantPersonalDetails       | fetchApplicantPersonalDetails       | get    | 400            |

  Scenario Outline:ATS , Set the applicant stage to "Approved" with wrong header
    Given Set the Applicant endpoint <endpoint> and method <method> with wrong header and stage <stage>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | stage |
      | updateStageOfApplicant | put    | 400            | 2     |

  Scenario Outline:ATS, API to delete a feedback
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus |
      | deleteFeedback | delete | 200            |

  Scenario Outline:ATS, API to delete an interview without using header Object ID
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus | header   |
      | deleteAnInterview | delete | 400            | ObjectID |


  Scenario Outline:ATS, API to delete an interview using wrong header ObjectID
    Given Set the Interview endpoint <endpoint> , method <method> with wrong <header> header
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint          | method | expectedStatus | header   |
      | deleteAnInterview | delete | 500            | ObjectID |

