module NewsHelper

	def self.filter_news
    sql_text = "select c.id as id,c.name as name, count(c.id) as count
				from news n
				inner join categories c on n.categories_id = c.id
				group by c.id";

    begin
    	connection = ActiveRecord::Base.connection()
    	result = connection.execute(sql_text)
    rescue=>ex
    	ex.message
    end

  end

end
