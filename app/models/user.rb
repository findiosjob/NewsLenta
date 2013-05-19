class User < ActiveRecord::Base
  attr_accessible :is_admin, :login, :name, :paswd

  has_many :news
end
