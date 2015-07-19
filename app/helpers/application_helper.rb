module ApplicationHelper
	def get_user_email user
		User.find(user).email
	end
end
