require 'singleton'

class SortEmailAsc < SortStrategy

  include Singleton

  def sort_email(users)
    users.sort! { |a,b| a.email <=> b.email }
  end

end
