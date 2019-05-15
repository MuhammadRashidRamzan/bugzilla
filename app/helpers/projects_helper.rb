module ProjectsHelper


	def devsAndQAs
		user = User.devsAndQas
	end

	def projectManagers
		pms = User.projectManagers
	end

	def projectManager(project)
		if !project.projectManager.blank?
			pm = project.projectManager.pluck('id')
		else
			['']
		end

	end

	def manager(project)
		if !project.projectManager.blank?
			manager = project.projectManager.first
		else
			''
		end

	end

	def devs(project)
		project.developers
	end

	def qas(project)
		project.qas
	end


	def assignDevelopers(project)
		project.users.pluck('id')
	end

end
