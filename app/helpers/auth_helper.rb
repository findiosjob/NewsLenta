#coding:utf-8

module AuthHelper
	def self.admin_title is_admin
		if is_admin
			"(Администратор) "
		else
			"(Пользователь) "
		end
	end
end
