class ActivityObserver < Observer
  belongs_to :activity
  def notify(message)
    Notification.create(message: message, user: self.user, viewed: false,
                        title: "Activity")
  end
end
