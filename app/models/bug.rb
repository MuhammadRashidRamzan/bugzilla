class Bug < ActiveRecord::Base


	validates :title, presence:true
    validates :description, presence: true

	validates_uniqueness_of :title

	has_attached_file :image, styles: { thumb: "100x100#" }
  	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


	belongs_to :project
	belongs_to :user
	enum status: [ :pending, :inprogress,:completed, :testing]

	scope :pendingBugs, -> {
		where(:status => 0)
	}

	scope :inProgressBugs, -> {
		where(:status => 1)
	}

	scope :completedBugs, -> {
		where(:status => 2)
	}

	scope :testingBugs, -> {
		where(:status => 3)
	}



	

end
