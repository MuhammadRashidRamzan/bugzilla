class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:update,:destroy, :edit ,:show, :saveAssigns ,:assign]
  before_action :authorize_project, only: [:index, :new, :show, :destroy]

  def index
    if current_user.role == 'project_manager' || current_user.role == 'admin'
      @projects = Project.order("created_at DESC")
    else
      @projects= current_user.projects.order("created_at DESC")
    end
  end


  def new 
    @project = Project.new
  end


  def show 
      @team = @project.devsAndQas
      @pm = @project.projectManager.first

  end

  def create
    @project =  Project.new(project_params)

    if @project.save
       current_user.projects << @project
       flash[:success]="Project save successfully"
       redirect_to root_path
    else
      render 'new'
    end

  end

  def edit 
    

  end


  def update 
      
    if(current_user.role == 'admin' )
      if(@project.projectManager.count >0)
        pmFound = ProjectsUser.where(project_id:@project.id, user_id:@project.projectManager.first.id )
        if  pmFound.count>0
            pmFound.delete_all
        end
      end
      ProjectsUser.create(project_id:@project.id, user_id:params[:project][:user_id] ) 
    end


     user_ids = @project.users.pluck(:id)
     projectUsers = params[:project][:user_ids]

     pUsers = User.where(id: projectUsers)

     projectManager = @project.projectManager.first
     projectAdmin= @project.projectAdmin.first
     @project.users = pUsers

     @project.users << projectManager
     ProjectsUser.create(project_id:@project.id, user_id:current_user.id ) 

  
    if @project.update(project_params)
      flash[:info]="Developers Assign successfully"
      redirect_to root_path

    else
      
      flash[:warning]= @project.errors.full_messages.join(", ")
      render 'edit'
    end

  end


  def assign 
    @users=  User.all;
     
  end

  def destroy 
    @project.delete
    flash[:danger]="Project Deleted successfully"
    redirect_to root_path
  end

  def managerProfile

    @manager = User.find(params[:id])

  end

  def projectTeam
    @projects = Project.order("created_at DESC")
  end



  def set_project 
    @project = Project.find(params[:id]);
  end


  private 
  def project_params
    params.require(:project).permit(:title, :description)
  end


  def assign_project_params
    params.require(:assigns).permit(:user_id, :project_id)
  end

  def authorize_project
    authorize @project || Project.new
  end

end



