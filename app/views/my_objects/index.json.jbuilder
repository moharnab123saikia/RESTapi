json.array!(@my_objects) do |my_object|
  json.extract! my_object, :id, :color
  json.url my_object_url(my_object, format: :json)
end
