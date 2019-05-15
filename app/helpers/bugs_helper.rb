module BugsHelper

	def bugStatuses
		 Bug.statuses.keys
	end

	def projectDevsAndQAs(project)
		user = project.devsAndQas
	end

end
