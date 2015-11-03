Feature: Service Aggregator Template Download feature

  In order to download the service aggregator template as service aggregator
  I want to have a download functionality on dashboard page
  So that we perform tasks like download zip template and unzip downloaded template

#This feature file includes options of downloading the service aggergator template

 Scenario: Validate Zipped Download Template Functionality
    Given I am logged in as Service Aggregator
    And  I view Dashboard Page
    When I click on Download Template Button
    Then I verify zipped template is downloaded on my system

 Scenario: Verify File format of zipped template(.zip)
    Given I am logged in as Service Aggregator
    And  I view Dashboard Page
    When I click on Download Template Button
    Then I verify file format of downlaoded zip file should be ".zip"

 Scenario: Validate Unzip Functionality
    Given I am logged in on local machine
    And  I on the download folder
    When I unzip the downloaded template
    Then I verify all the directory structure available on template folder

 Scenario: Validate Download Functionality of Files with very long names
    Given I am logged in on local machine
    And  I on the download folder
    When I click on Download Template Button
    Then I verify the Files names with very long file names
