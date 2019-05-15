class Project < ActiveRecord::Base

	validates :title, presence: true
	#validates :description, presence: true
	validates_uniqueness_of :title

	has_many :bugs
	has_many :projects_users
	has_many :users, through: :projects_users


	def developers
		self.users.developers
	end

	def qas
		self.users.qas
	end

	def devsAndQas
		self.users.devsAndQas
	end

	def projectManager
		self.users.projectManager
	end

	def projectAdmin
		self.users.projectAdmin
	end

	def projectManagers
		self.users.projectManagers
	end


	def pendingBugs 
		self.bugs.pendingBugs
	end

	def inProgressBugs 
		self.bugs.inProgressBugs
	end

	def completedBugs 
		self.bugs.inProgressBugs
	end

	def testingBugs 
		self.bugs.testingBugs
	end
end
