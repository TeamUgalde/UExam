json.array!(@item_answers) do |item_answer|
  json.extract! item_answer, :id, :option_number, :user_answer, :correct
  json.url item_answer_url(item_answer, format: :json)
end
