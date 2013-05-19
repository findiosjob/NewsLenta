#coding:utf-8

class AuthController < ApplicationController
	def sign_in
	end

	def login
		begin
			valid_user_params params
			@user = find_user params[:user], params[:pass]
			session[:user_id] = @user.id
		rescue =>ex
			flash[:error] = ex.message
			render :action => "sign_in"
			return
		end
		redirect_to  root_path
	end

	def sign_out
		session.delete(:user_id)
		redirect_to root_path
	end

	private
	def valid_user_params(param)
		if param[:user].empty?
			raise 'Заполните логин'
		end
		if param[:pass].empty?
			raise 'Заполните пароль'
		end
	end

	def find_user(login, pass)
		users = User.where("users.login='#{login}' and users.paswd='#{pass}'")
		if users.empty?
			raise "Нет пользователя с такими значениями"
		end
		users.first!

	end
end
