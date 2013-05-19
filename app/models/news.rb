class News < ActiveRecord::Base
  attr_accessible :full_text, :news_date, :short_text, :title, :categories_id, :user_id

  belongs_to :user
  belongs_to :category

  default_scope order("news_date DESC")
end
