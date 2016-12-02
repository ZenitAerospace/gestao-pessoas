class SearchesController < ApplicationController
  before_filter :authenticate_user!

  def index
    order = params[:order]
    @results = {}
    search = params[:search]
    if search
      @results = find_user_all(search, order)
    end
    @users = initialize_grid(User)
    authorize Searches
  end

  def find_user_all(keyword, order)
    personal_information = search_user(PersonalInformation, :personal_information_id, keyword)
    subject = search_user(Subject, :subject_id, keyword)
    user_personal_information = find_user(personal_information, order)
    user_subject = find_user(subject, order)
    user = { information: user_personal_information, subject: user_subject }
    return user
  end

  def find_user(entities, order)
    users = []
    entities.each do |entity|
      if User.where(id: entity.user_id).count > 0
        users << User.find(entity.user_id)
      end
    end
    return sort_by_email(users,order)
    # return users
  end

  def sort_by_email(users,order)
    if order
      if params[:order] == "crescente"
        users_ordened = SortEmailAsc.instance
      end
      if params[:order] == "decrescente"
        users_ordened = SortEmailDesc.instance
      end
      return users_ordened.sort_email(users)
    else
      return users
    end
  end

  def search_user(class_entity, name_field, keyword)
    user = class_entity.select(:name, :id, :user_id).where('name LIKE ?', "%#{keyword}%")
  end



end
