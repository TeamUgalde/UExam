# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
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

items = Item.create([
                        {question: 'Que edad tiene melcuecha?', option_1: '21 años', option_2: '35 años',
                         option_3: '17 años', option_4: '2 años', option_5: 'Ninguna de las anteriores',
                         correct_option: 1, item_number: 1, exam_id: 1},
                        {question: 'Cuantos juegos de steam tiene SD?', option_1: '0 juegos', option_2: '4 juegos',
                         option_3: '10 juegos', option_4: '22 juegos', option_5: 'Mas de 100 juegos', correct_option: 2,
                         item_number: 2, exam_id: 1},
                        {question: 'Cuantas horas ha jugado League of Legends Danielon?', option_1: '2 horas',
                         option_2: '300 horas', option_3: '~2000 horas', option_4: 'Mas de 2000 horas',
                         option_5: 'Danielon no juega League of Legends', correct_option: 3, item_number: 3, exam_id: 1},
                        {question: 'En que año nacio Tavex?', option_1: '1890', option_2: '1902', option_3: '1956',
                         option_4: '1989', option_5: 'Ninguna de las anteriores', correct_option: 4, item_number: 4,
                         exam_id: 1},
                        {question: 'Cuantos creditos llevo SD en el primer semestre del 2015?', option_1: '3 creditos',
                         option_2: '8 creditos', option_3: '12 creditos', option_4: '15 creditos',
                         option_5: 'Mas de 20 creditos', correct_option: 5, item_number: 5, exam_id: 1},
                        {question: 'Cual ingrediente no le gusta a Dieg8?', option_1: 'Queso', option_2: 'Tomate',
                         option_3: 'Jamon', option_4: 'Chocolate', option_5: 'Arroz', correct_option: 1, item_number: 6,
                         exam_id: 1},
                        {question: 'De que color es el loro de Marvel?', option_1: 'Marvel no tiene loro',
                         option_2: 'No se sabe', option_3: 'Amarillo', option_4: 'Verde', option_5: 'Blanco',
                         correct_option: 2, item_number: 7, exam_id: 1},
                        {question: 'Cuanto tiempo duro "Brucce" en el baño?', option_1: '5 minutos',
                         option_2: '30 minutos', option_3: 'Infinito', option_4: 'MonoDB',
                         option_5: 'Ninguna de las anteriores', correct_option: 3, item_number: 8, exam_id: 1},
                        {question: 'Cual de los siguientes no es hijo de Tony Kong?', option_1: 'Mariocha',
                         option_2: 'Pata', option_3: 'Rin', option_4: 'Tony Jr.', option_5: 'Bal',
                         correct_option: 4, item_number: 9, exam_id: 1},
                        {question: 'Cual de los siguientes apodos NO pertenece a Mel?', option_1: 'Melcuecha',
                         option_2: 'Perro de traba', option_3: 'Perro con estilo', option_4: 'Melcochon',
                         option_5: 'Todos los apodos pertenecen a Mel', correct_option: 5, item_number: 10, exam_id: 1},
                    ])

items_2 = Item.create([
                          {question: 'Que edad tiene melcuecha?', option_1: '21 años', option_2: '35 años',
                           option_3: '17 años', option_4: '2 años', option_5: 'Ninguna de las anteriores',
                           correct_option: 1, item_number: 1, exam_id: 3},
                          {question: 'Cuantos juegos de steam tiene SD?', option_1: '0 juegos', option_2: '4 juegos',
                           option_3: '10 juegos', option_4: '22 juegos', option_5: 'Mas de 100 juegos', correct_option: 2,
                           item_number: 2, exam_id: 3},
                          {question: 'Cuantas horas ha jugado League of Legends Danielon?', option_1: '2 horas',
                           option_2: '300 horas', option_3: '~2000 horas', option_4: 'Mas de 2000 horas',
                           option_5: 'Danielon no juega League of Legends', correct_option: 3, item_number: 3, exam_id: 3},
                          {question: 'En que año nacio Tavex?', option_1: '1890', option_2: '1902', option_3: '1956',
                           option_4: '1989', option_5: 'Ninguna de las anteriores', correct_option: 4, item_number: 4,
                           exam_id: 3},
                          {question: 'Cuantos creditos llevo SD en el primer semestre del 2015?', option_1: '3 creditos',
                           option_2: '8 creditos', option_3: '12 creditos', option_4: '15 creditos',
                           option_5: 'Mas de 20 creditos', correct_option: 5, item_number: 5, exam_id: 3},
                          {question: 'Cual ingrediente no le gusta a Dieg8?', option_1: 'Queso', option_2: 'Tomate',
                           option_3: 'Jamon', option_4: 'Chocolate', option_5: 'Arroz', correct_option: 1, item_number: 6,
                           exam_id: 3},
                          {question: 'De que color es el loro de Marvel?', option_1: 'Marvel no tiene loro',
                           option_2: 'No se sabe', option_3: 'Amarillo', option_4: 'Verde', option_5: 'Blanco',
                           correct_option: 2, item_number: 7, exam_id: 3},
                          {question: 'Cuanto tiempo duro "Brucce" en el baño?', option_1: '5 minutos',
                           option_2: '30 minutos', option_3: 'Infinito', option_4: 'MonoDB',
                           option_5: 'Ninguna de las anteriores', correct_option: 3, item_number: 8, exam_id: 3},
                          {question: 'Cual de los siguientes no es hijo de Tony Kong?', option_1: 'Mariocha',
                           option_2: 'Pata', option_3: 'Rin', option_4: 'Tony Jr.', option_5: 'Bal',
                           correct_option: 4, item_number: 9, exam_id: 3},
                          {question: 'Cual de los siguientes apodos NO pertenece a Mel?', option_1: 'Melcuecha',
                           option_2: 'Perro de traba', option_3: 'Perro con estilo', option_4: 'Melcochon',
                           option_5: 'Todos los apodos pertenecen a Mel', correct_option: 5, item_number: 10, exam_id: 3}
                      ])

=end

exams2 = Exam.create([
                        {title: 'Examen Parcial IV', expires_on: '2015-07-22', time_limit: 120,
                         item_quantity: 10, user_id: 1}
                     ])