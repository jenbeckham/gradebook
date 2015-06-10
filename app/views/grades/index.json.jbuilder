json.array!(@grades) do |grade|
  json.extract! grade, :id, :assignment_name, :score, :student_in
  json.url grade_url(grade, format: :json)
end
