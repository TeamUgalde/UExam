Feature: User can see an specific exam

  Scenario: User sees a exam
    Given I am on the UExam home page
    When I click the "Realizar examen" link of the first exam
    Then I should be on the Show Exam page
    And I should see "Examen Parcial I"
