require 'observer/base'
class Observer < ActiveRecord::Base
  include ActiveRecord::Observator
  belongs_to :user
end
