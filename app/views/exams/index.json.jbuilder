json.array!(@exams) do |exam|
  json.extract! exam, :id, :title, :expires_on, :time_limit, :item_quantity
  json.url exam_url(exam, format: :json)
end
