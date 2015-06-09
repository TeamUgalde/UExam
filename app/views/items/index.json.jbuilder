json.array!(@items) do |item|
  json.extract! item, :id, :question, :option_1, :option_2, :option_3, :option_4, :option_5, :correct_option, :item_number
  json.url item_url(item, format: :json)
end
