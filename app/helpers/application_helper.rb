module ApplicationHelper
	def active_nav ctl_name, action_name
		'active' if ctl_name == params[:controller] && (action_name == params[:action])
	end
end
