class SortEmailAsc < SortStrategy

  def sort_email(users)
    users.sort! { |a,b| a.email <==> b.email }
  end

end
