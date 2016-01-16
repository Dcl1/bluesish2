json.array!(@links) do |link|
  json.extract! link, :id, :source, :img_source, :title
  json.url link_url(link, format: :json)
end
