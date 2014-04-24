json.array!(@miniprojects) do |miniproject|
  json.extract! miniproject, :id, :name, :participants
end
