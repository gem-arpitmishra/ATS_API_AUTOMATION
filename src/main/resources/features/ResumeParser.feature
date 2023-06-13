@resumeParser
Feature: Resume Parser

  Scenario Outline: Resume Parser check
    Given Set the Resume Parser endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint     | method | expectedStatus | payload_key | payload_value |
      | resumeParser | post   | 200            | resume_file | resume.pdf    |

