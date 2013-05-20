class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :news, :dependent => :restrict, :foreign_key => "categories_id"
end
