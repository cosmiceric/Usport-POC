json.array!(@comments) do |comment|
  json.extract! comment, :comment, :feed_entry_id
  json.url comment_url(comment, format: :json)
end
