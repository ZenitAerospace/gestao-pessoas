class SortEmailDesc < SortStrategy

  def sort_email(users)
    users.sort! { |a,b| b.email <==> a.email }
  end

end
