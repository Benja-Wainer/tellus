# app/views/api/v1/topics/index.json.jbuilder
json.array! @topics do |topic|
  json.extract! topic, :id, :name
end
