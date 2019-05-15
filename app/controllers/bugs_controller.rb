class BugsController < ApplicationController
before_action :authenticate_user!
before_action :set_bug, only: [:show, :update, :destroy, :edit ,:assign]


  def index 
    @bugs =  Project.find(params[:project_id]).bugs;
    @project =  Project.find(params[:project_id]);


  end

  def new 
    @bug = Bug.new
    authorize  @bug

    @project = Project.find(params[:project_id])
    @user = @project.developers
  end 

  def create
  	#render text: params[:bug].inspect	
    #abort params[:bug].inspect
  	@bug =  Bug.new(bug_params)
    authorize  @bug
  	if @bug.save
      flash[:success] = "Bug added successfully"
      redirect_to root_path
    else
      @project = Project.find(params[:project_id])
      @user = @project.developers
      render 'new'
      #redirect_to  bug_new_path 
    end
  end

	def edit 
    @project = Bug.find(params[:id]).project;
    @user=@project.users.devsAndQas
    #abort @user.inspect
	end

	
  def destroy 
    authorize  @bug
    @bug.delete();
    flash[:danger] = "Bug Updated successfully"

    redirect_to(:back) 
  end

  def update 
    if @bug.update(bug_params)
      flash[:info] = "Bug Updated successfully"
      redirect_to root_path
    else 
      @project = Bug.find(params[:id]).project;
      @user=@project.users.devsAndQas
      render 'edit'
    end


  end

  # def assign 
  #   @project = Project.find(@bug.project_id)
  #   @user = @project.developers
  # end

  def set_bug 
    @bug = Bug.find(params[:id]);
  end


  private 
    def bug_params
      params.require(:bug).permit(:title, :description,:status, :project_id, :user_id, :image)
    end
end
