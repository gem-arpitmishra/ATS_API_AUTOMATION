@apiReg
Feature: ATS scenario

  Scenario Outline: ATS, Run the API to generate access token
    Given Set the url to generate access token <method> method and url <url>
    Then Verify scenario status code <expectedStatus>
    Examples:
      | method | url         | expectedStatus |
      | post   | accessToken | 200            |

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
      | endpoint               | method | expectedStatus | payload_key                | payload_value                         | name1            | field       |
#      | saveApplicantDetails   | post   | 500            | applicantData,resume,image | applicantTest1.json,test.pdf,test.pdf | Create Applicant | Email       |
      | saveApplicantDetails   | post   | 409            | applicantData,resume,image | applicantTest2.json,test.pdf,test.pdf | Create Applicant | Phone no    |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicant.json,test.pdf,test.pdf      | Update Applicant | ApplicantId |

  Scenario Outline: ATS <name1>,Applicant API using invalid <field>
    Given Set the Job endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                         | name1            | field                 |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest4.json,test.pdf,test.pdf | Create Applicant | TotalYearOfExperience |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest5.json,test.pdf,test.pdf | Create Applicant | RelevantExperience    |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest6.json,test.pdf,test.pdf | Create Applicant | Percentage            |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest8.json,test.pdf,test.pdf | Create Applicant | FromDate              |
      | saveApplicantDetails   | post   | 400            | applicantData,resume,image | applicantTest9.json,test.pdf,test.pdf | Create Applicant | ToDate                |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest3.json,test.pdf,test.pdf | Update Applicant | ApplicantId           |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest4.json,test.pdf,test.pdf | Update Applicant | TotalYearOfExperience |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest5.json,test.pdf,test.pdf | Update Applicant | RelevantExperience    |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest6.json,test.pdf,test.pdf | Update Applicant | Percentage            |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest7.json,test.pdf,test.pdf | Update Applicant | Phone no              |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest8.json,test.pdf,test.pdf | Update Applicant | FromDate              |
      | updateApplicantDetails | put    | 400            | applicantData,resume,image | applicantTest9.json,test.pdf,test.pdf | Update Applicant | ToDate                |

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

  Scenario Outline: ATS, <name> an applicant
    Given Set the Applicant endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus | payload_key                | payload_value                    | name   |
      | saveApplicantDetails   | post   | 201            | applicantData,resume,image | applicant.json,test.pdf,test.pdf | Create |
      | updateApplicantDetails | put    | 201            | applicantData,resume,image | applicant.json,test.pdf,test.pdf | Update |

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

  Scenario Outline: ATS, send applicant for vetting using wrong method put
    Given Setting the Applicant endpoint <endpoint> method <method> payload <payload> for vetting
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus | payload               |
      | sendApplicantsForVetting | put    | 405            | applicantVetting.json |


  Scenario Outline: ATS, <name> an applicant and send him for vetting
    Given Setting the Applicant endpoint <endpoint> method <method> payload <payload> for vetting
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus | payload               | name   |
      | sendApplicantsForVetting | post   | 200            | applicantVetting.json | Create |

  Scenario Outline: ATS, Get the Vetter Names for Applicants using wrong method Get
    Given Set the Interview endpoint <endpoint> method <method> payload <payload> for getting vetter names
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload     |
      | getVetterNames | get    | 405            | Vetter.json |

  Scenario Outline: ATS, Get the Vetter Names for Applicants using wrong method Put
    Given Set the Interview endpoint <endpoint> method <method> payload <payload> for getting vetter names
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload     |
      | getVetterNames | put    | 405            | Vetter.json |

  Scenario Outline: ATS, Get the Vetter Names for Applicants using wrong payload
    Given Set the Interview endpoint <endpoint> method <method> payload <payload> for getting vetter names using wrong payload
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint       | method | expectedStatus | payload      |
      | getVetterNames | post   | 400            | Vetter1.json |


  Scenario Outline: ATS, API to fetch interviews for Vetting for a particular email ID using wrong method
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                        | method | expectedStatus |
      | apiToGetInterviewsForVettingForAParticularEmail | delete | 405            |

  Scenario Outline:ATS, Negative testing of API to post a new feedback using wrong method for vetting
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload   |
      | addFeedbackForVetting | delete | 405            | feedback1 |

  Scenario Outline:ATS, API to post a new feedback using wrong  <name> field value in payload for vetting
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload   | name          |
      | addFeedbackForVetting | post   | 400            | feedback3 | selectionType |

  Scenario Outline:ATS, API to post a new feedback without using <name> field  in payload for vetting
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload   | name          |
      | addFeedbackForVetting | post   | 400            | feedback5 | selectionType |

  Scenario Outline:ATS, API to post a new feedback for vetting
    Given Set the Feedback endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload   |
      | addFeedbackForVetting | post   | 200            | feedback1 |

  Scenario Outline:ATS, API to schedule interview for the same job and same applicant using wrong <key> field in the payload
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload     | key       |
      | addNewInterview | post   | 400            | interview3  | startTime |
      | addNewInterview | post   | 400            | interview9  | attendees |
      | addNewInterview | post   | 400            | interview10 | attendees |
      | addNewInterview | post   | 400            | interview11 | endTime   |

  Scenario Outline:ATS, API to schedule interview for the same job and same applicant without using <key> field in the payload
    Given Set the Interview endpoint <endpoint> , method <method> and payload <payload>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus | payload    | key       |
      | addNewInterview | post   | 500            | interview4 | startTime |
      | addNewInterview | post   | 500            | interview7 | endTime   |

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

  Scenario Outline:ATS, API to send feedback reminder on the basis of interview ID without using header
    Given Set the Interview endpoint <endpoint> , method <method> without header <header>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus | header   |
      | sendFeedbackReminderBasedOnInterviewId | post   | 400            | ObjectID |

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
      | endpoint          | method | expectedStatus | payload          | key       |
      | updateAnInterview | put    | 500            | updateInterview5 | startTime |
      | updateAnInterview | put    | 500            | updateInterview7 | endTime   |

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

  Scenario Outline:ATS, API to GetApplicantsInVetting for wrong Header
    Given Setting the Interview endpoint <endpoint> and method <method> , for getting applicants in Vetting
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | apiToGetApplicantsInVetting | post   | 405            |

  Scenario Outline:ATS, API to GetApplicantsInVetting for wrong Header
    Given Setting the Interview endpoint <endpoint> and method <method> , for getting applicants in Vetting
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | apiToGetApplicantsInVetting | put    | 405            |

  Scenario Outline: API to add multiple Applicants using wrong method put
    Given Set the Applicant endpoint <endpoint> and method <method> and keys <payload_keys> , values <payload_values> to add multiple applicants
    Then  Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload_keys                  | payload_values                       |
      | addMultipleApplicants | put    | 405            | applicantList,resumes,resumes | applicantList.json,test.pdf,test.pdf |

  Scenario Outline: API to add multiple Applicants using wrong method delete
    Given Set the Applicant endpoint <endpoint> and method <method> and keys <payload_keys> , values <payload_values> to add multiple applicants
    Then  Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload_keys                  | payload_values                       |
      | addMultipleApplicants | delete | 405            | applicantList,resumes,resumes | applicantList.json,test.pdf,test.pdf |

  Scenario Outline: API to add multiple Applicants using wrong JobId
    Given Set the Applicant endpoint <endpoint> and method <method> and keys <payload_keys> , values <payload_values> to add multiple applicants
    Then  Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint              | method | expectedStatus | payload_keys                  | payload_values                        |
      | addMultipleApplicants | post   | 400            | applicantList,resumes,resumes | applicantList3.json,test.pdf,test.pdf |

  Scenario Outline: ATS , Job using wrong method---><name>
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus | name         |
      | getJobAllDetails | post   | 405            | Create a job |
      | getJobAllDetails | put    | 405            | Create a job |
      | getJobAllDetails | delete | 405            | Create a job |

  Scenario Outline: ATS, Applicant WithPaging using wrong method - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                                 | endpoint                             | method | expectedStatus |
      | GetApplicantWithPagingWithDaysFilter | getApplicantWithPagingWithDaysFilter | post   | 405            |
      | GetApplicantWithPagingWithDaysFilter | getApplicantWithPagingWithDaysFilter | put    | 405            |
      | GetApplicantWithPagingWithDaysFilter | getApplicantWithPagingWithDaysFilter | delete | 405            |


  Scenario Outline: ATS, Applicant WithPagingWithPageSize using wrong method - <name>
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | name                               | endpoint                           | method | expectedStatus |
      | GetApplicantWithPagingWithPageSize | getApplicantWithPagingWithPageSize | post   | 405            |
      | GetApplicantWithPagingWithPageSize | getApplicantWithPagingWithPageSize | put    | 405            |
      | GetApplicantWithPagingWithPageSize | getApplicantWithPagingWithPageSize | delete | 405            |

  Scenario Outline: ATS,Negative testing of API to getListOfApplicantsMonthWiseForASpecificYear using wrong Method
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                                     | method | expectedStatus |
      | getListOfApplicantsMonthWiseForASpecificYear | put    | 405            |

  Scenario Outline: ATS,Negative testing of API to getListOfApplicantsMonthWiseForASpecificYear using wrong Method
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                                     | method | expectedStatus |
      | getListOfApplicantsMonthWiseForASpecificYear | post   | 405            |

  Scenario Outline: ATS,Negative testing of API of getListOfOfferedApplicantsMonthWiseForASpecificYear using wrong Method
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                                            | method | expectedStatus |
      | getListOfOfferedApplicantsMonthWiseForASpecificYear | put    | 405            |

  Scenario Outline: ATS,Negative testing of API of getListOfOfferedApplicantsMonthWiseForASpecificYear using wrong Method
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                                            | method | expectedStatus |
      | getListOfOfferedApplicantsMonthWiseForASpecificYear | post   | 405            |

  Scenario Outline: ATS,Negative testing of API to getListOfJobsMonthWiseForASpecificYearJob using wrong Method
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | getListOfJobsMonthWiseForASpecificYear | put    | 405            |

  Scenario Outline: ATS,Negative testing of API to o getListOfJobsMonthWiseForASpecificYearJob using wrong Method
    Given Set the Job endpoint <endpoint> and method <method>
    Then Verify Job status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | getListOfJobsMonthWiseForASpecificYear | post   | 405            |


  Scenario Outline: ATS,Negative testing of API to execute data masking for interview service using wrong Method Put
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                | method | expectedStatus |
      | dataMaskingForInterview | put    | 405            |

  Scenario Outline: ATS,Negative testing of API to execute data masking for applicants service using wrong method Delete
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus |
      | dataMaskingForApplicants | delete | 405            |

  Scenario Outline: ATS,Negative testing of API to execute data masking for applicants service using wrong method Put
    Given Set the Applicant endpoint <endpoint> and method <method>
    Then Verify Applicant status code <expectedStatus>
    Examples:
      | endpoint                 | method | expectedStatus |
      | dataMaskingForApplicants | put    | 405            |