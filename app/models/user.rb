class User < ActiveRecord::Base

	enum role: [ :admin, :project_manager,:developer, :quality_assurance]

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :bugs
	has_many :projects_users
	has_many :projects , through: :projects_users


	scope :developers, -> {
		where(:role => 2)
	}

	scope :qas, -> {
		where(:role => 3) 
	}

	scope :devsAndQas, -> {
		where(:role => [2,3]) 
	}

	scope :projectManager, -> {
		where(:role => 1 )
	}

	scope :projectManagers, -> {
		where(:role => 1 )
	}

	scope :projectAdmin, -> {
		where(:role => 0 ) 
	}

	scope :devPmQa, -> {
		where(:role => [1,2,3])
	}

end

 