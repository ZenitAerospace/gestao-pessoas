class SortStrategy < ActiveRecord::Base

  def sort_email(users)
    raise NotImplementedError
  end

end
