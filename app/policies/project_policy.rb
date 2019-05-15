class ProjectPolicy < ApplicationPolicy


 attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    true
  end

  def show?
    user.role == 'admin'  || user.role == 'project_manager'
  end

  def create?
    user.role == 'admin'  || user.role == 'project_manager'
  end

  def new?
    create?
  end

  def update?
    user.role == 'admin'  || user.role == 'project_manager'
  end

  def edit?
    update? 
  end

  def destroy?
     user.role == 'admin'  || user.role == 'project_manager'
  end

  def manageProject
    user.projects.pluck('id').include?(project.id)
  end


end