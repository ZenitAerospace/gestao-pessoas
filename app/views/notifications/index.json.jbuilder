json.array!(@notifications) do |notification|
  json.extract! notification, :id, :message, :user, :viewed, :title
  json.url notification_url(notification, format: :json)
end
