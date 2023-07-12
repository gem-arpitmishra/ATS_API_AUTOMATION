@resumeParser
Feature: Resume Parser

  Scenario Outline: Resume Parser check for <name>
    Given Setting the Resume Parser endpoint <endpoint> method <method> payload <payload_key> <payload_value> and form data
    Then Verify scenario status code <expectedStatus>
    Examples:
      | endpoint     | method | expectedStatus | payload_key | payload_value              | name  |

      | resumeParser | post   | 200            | resume_file | resume.pdf                 | pdf   |
      | resumeParser | post   | 200            | resume_file | resume.docx                | docx  |
      | resumeParser | post   | 200            | resume_file | resume.doc                 | doc 1 |
      | resumeParser | post   | 200            | resume_file | resume.zip                 | zip 1 |
      | resumeParser | post   | 200            | resume_file | File-G6Ngm.zip             | zip 2 |
      | resumeParser | post   | 200            | resume_file | Sample-doc-file-5000kb.doc | doc 2 |
      | resumeParser | post   | 200            | resume_file | file.zip                   | zip 2 |