Feature: Build and Test Android App
  As a developer
  I want to build and test an Android App in docker
  So I can develop locally without dealing with dependencies

Scenario: Java installed
  Given the services are running
  And I run "java -version" on "android"
  Then I should see "1.7"

Scenario: Build the app
  Given the services are running
  And I run "/opt/gradle-2.2.1/bin/gradle clean assembleRelease" on "android"
  Then I should see "BUILD SUCCESSFUL"

Scenario: Run the tests
  Given the services are running
  And I run "/opt/gradle-2.2.1/bin/gradle clean test" on "android"
  Then I should see "BUILD SUCCESSFUL"
  And the Gradle test report should show some passing tests
