Before do
  # Truncates the DB before each Scenario,
  # make sure you've added database_cleaner to your Gemfile.
  DatabaseCleaner.clean

  Exam.create([{ title: 'Examen Parcial I' }])
  # More factories here etc
end