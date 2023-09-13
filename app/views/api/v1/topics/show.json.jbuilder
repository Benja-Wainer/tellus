json.extract! @topic, :id, :name
json.articles @topic.articles do |article|
  json.extract! article, :title, :content, :url, :image_url
end
