module ProfilesHelper
	def get_current_user_profile_path
		@profile = Profile.find_by(user_id: current_user.id, active: true)
		@path = "/profiles/#{@profile.id}"
		@path
	end
end
