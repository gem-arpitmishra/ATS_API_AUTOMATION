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

