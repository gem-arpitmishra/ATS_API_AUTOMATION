@hc
Feature: Interview

  Scenario Outline: ATS, Run the API to generate access token
    Given Set the url to generate access token <method> method and url <url>
    Then Verify scenario status code <expectedStatus>
    Examples:
      | method | url         | expectedStatus |
      | post   | accessToken | 200            |


  Scenario Outline:ATS, API to get list of all interviews
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint         | method | expectedStatus |
      | getAllInterviews | get    | 200            |

  Scenario Outline: ATS, API to fetch interview on a particular date
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                       | method | expectedStatus |
      | getInterviewsOnAParticularDate | get    | 200            |

  Scenario Outline: ATS, API to get list of all interviews
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                               | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfDays | get    | 200            |

  Scenario Outline: ATS, API to get list of all interviews
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint               | method | expectedStatus |
      | getListOfAllInterviews | get    | 200            |


  Scenario Outline: ATS, API to get list of all interviews
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                        | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfDateAndSearch | get    | 200            |


  Scenario Outline: ATS, API to get list of all interviews on the basis of the applied search filter
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                       | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfSearchedText | get    | 200            |

  Scenario Outline: ATS, API to get list of all interviews on the basis of applied search filter and without days
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                                         | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfAppliedSearchFilterWithoutDays | get    | 200            |

  Scenario Outline: ATS, API to get list of all interviews on the basis of applied search filter and with days
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                                                | method | expectedStatus |
      | getListOfAllInterviewsOnTheBasisOfAppliedFilterWithDays | get    | 200            |

  Scenario Outline: ATS, API to get feedback list
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint        | method | expectedStatus |
      | getFeedbackList | get    | 200            |

  Scenario Outline: ATS, API to get feedback list on the basis of days
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                     | method | expectedStatus |
      | getFeedbackListOnBasisOfDays | get    | 200            |

  Scenario Outline: ATS, API to get feedback list on the basis of days
    Given Set the Interview endpoint <endpoint> and method <method>
    Then Verify Interview status code <expectedStatus>
    Examples:
      | endpoint                    | method | expectedStatus |
      | getFeedbackTemplateEcDcName | get    | 200            |



