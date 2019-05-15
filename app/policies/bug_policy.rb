class BugPolicy < ApplicationPolicy


   attr_reader :user, :bug

    def initialize(user, bug)
      @user = user
      @bug = bug
    end

 

  

  def index?
    true
  end

  def show?
    false
  end

  def create?
    user.role == 'admin'  || user.role == 'project_manager'
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
     user.role == 'admin'  || user.role == 'project_manager'
  end

  def manageBug
    user.projects.pluck('id').include?(bug.project_id)
  end
  
end
