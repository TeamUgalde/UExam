Feature: User can manually add exam
  
Scenario: Add a movie
	Given I am on the UExam home page
	When I follow "Crear Examen Nuevo"
	Then I should be on the Create New Exam page
	#When I fill in "Title" with "Star Wars"
	And I press "Crear Examen"
	Then I should be on the UExam home page
	And I should see "Examen Parcial I"


