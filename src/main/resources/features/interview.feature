Feature: Interview

  Scenario Outline: API to get list of all interviews
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getAllInterviews | get | 200 |

  Scenario Outline: API to get interviews for a particular job
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | interviewsForAParticularJob | get | 200 |

  Scenario Outline: API to fetch all the employees who can be attendee or interviewer for an interview
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getAllEmployeesWhoCanBeAttendeeOrInterviewerForAnInterview | get | 200 |

  Scenario Outline: API to fetch interview by interview ID
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | apiToGetInterviewByInterviewId | get | 200 |

  Scenario Outline: API to fetch interview on a particular date
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getInterviewsOnAParticularDate | get | 200 |

  Scenario Outline: API to get all interviews of an applicant on basis of applicant ID
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getAllInterviewsOfAnApplicantOnBasisOfApplicantId | get | 200 |


  Scenario Outline: API to get list of al interviews
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfDays | get | 200 |

  Scenario Outline: API to get list of al interviews
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getListOfAllInterviews | get | 200 |

  Scenario Outline: API to get list of al interviews
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfSearchedText | get | 200 |


  Scenario Outline: API to get feedback list
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getFeedbackList | get | 200 |

  Scenario Outline: API to get feedback for all interviews for a Job
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getFeedbackForAllInterviewsForAJob | get | 200 |

  Scenario Outline: API to get feedback of an interview on the basis of interview id
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getFeedbackOfAnInterview | get | 200 |

  Scenario Outline: API to get feedback list of all interviews of an applicant
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getFeedbackListOfAllInterviewsOfAnApplicant| get | 200 |

  Scenario Outline: API to get feedback list on the basis of days
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | getFeedbackListOnBasisOfDays | get | 200 |

  Scenario Outline:API to delete an interview
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | deleteAnInterview| delete | 200 |

  Scenario Outline:API to add a new interview
    Given Set the Interview endpoint "<endpoint>" , method "<method>" and payload "<payload>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus | payload |
      | addNewInterview | post | 201 | interview1  |

  Scenario Outline:API to send feedback reminder to all
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | sendFeedbackReminderToAll| post | 200 |

  Scenario Outline:API to send feedback reminder on the basis of interview ID
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | sendFeedbackReminderBasedOnInterviewId| post | 200 |

  Scenario Outline:API to send management approval email without CC recipient
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | sendManagementApprovalEmailWithoutCC | post | 200 |

  Scenario Outline:API to send management approval email with CC recipient
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | sendManagementApprovalEmailWithCC | post | 200 |

  Scenario Outline:API to update an interview
    Given Set the Interview endpoint "<endpoint>" , method "<method>" and payload "<payload>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus | payload |
      | updateAnInterview| put | 200 |  interview2 |

  Scenario Outline:API to post a new feedback
    Given Set the Interview endpoint "<endpoint>" , method "<method>" and payload "<payload>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus | payload |
      | addNewFeedback| post | 200 |  feedback1 |

  Scenario Outline:API to update a feedback
    Given Set the Interview endpoint "<endpoint>" , method "<method>" and payload "<payload>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus | payload |
      | addNewFeedback| put | 200 |  feedback2 |

  Scenario Outline:API to delete a feedback
    Given Set the Interview endpoint "<endpoint>" and method "<method>"
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus |
      | deleteFeedback| delete | 200 |