# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

exams = Exam.create([
                         {title: 'Examen Parcial I', expires_on: '2015-07-03', time_limit: 120,
                          item_quantity: 40, user_id: 1},
                         {title: 'Quiz #1', expires_on: '2015-07-10', time_limit: 30,
                          item_quantity: 10, user_id: 2},
                         {title: 'Examen Parcial II', expires_on: '2015-08-05', time_limit: 120,
                          item_quantity: 50, user_id: 1},
                         {title: 'Quiz #2', expires_on: '2015-08-12', time_limit: 30,
                          item_quantity: 20, user_id: 2},
                         {title: 'Examen Parcial III', expires_on: '2015-10-02', time_limit: 150,
                          item_quantity: 80, user_id: 1}
                     ])

solved_exams = SolvedExam.create([
                                     {finished: true, score: 80, correct_answers: 32, user_id: 2, exam_id: 1},
                                     {finished: true, score: 70, correct_answers: 7, user_id: 1, exam_id: 2},
                                     {finished: false, score: 0, correct_answers: 0, user_id: 2, exam_id: 3},
                                     {finished: false, score: 0, correct_answers: 0, user_id: 1, exam_id: 4},
                                     {finished: false, score: 0, correct_answers: 0, user_id: 2, exam_id: 5}
                                 ])

