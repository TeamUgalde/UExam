json.array!(@solved_exams) do |solved_exam|
  json.extract! solved_exam, :id, :finished, :score, :correct_answers
  json.url solved_exam_url(solved_exam, format: :json)
end
