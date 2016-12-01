require 'singleton'

class SortEmailDesc < SortStrategy

  include Singleton

  def sort_email(users)
    users.sort! { |a,b| b.email <=> a.email }
  end

end
