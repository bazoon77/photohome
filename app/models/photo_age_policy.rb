module PhotoAgePolicy


	def image_url_for_main_carousel(user, agreed, image_kind)

		ability = Ability.new(user) 

		if ability.can?(:view, self) || age_policy_age <= 12 || agreed
			image_url(image_kind)
		else 
			""
		end
		
	end


	def image_url_for_others(user, agreed, image_kind)
		ability = Ability.new(user) 

		if ability.can?(:view, self) || age_policy_age <= 16 || agreed
			image_url(image_kind)
		else 
			 "/assets/eighteen.jpg"
		end
	end


end