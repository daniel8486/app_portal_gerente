class Pages::UserController < ApplicationController
  before_action :set_user , only: [:show, :edit, :update, :destroy]
  def index 
    @users = User.all
    #@q = User.ransack(params[:q])
    #@users = @q.result(distinct: true)
  end

  def show
  end

  def edit
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save()
      redirect_to pages_user_index_path, notice: "Usuário Criado com Sucesso !"
    else
      render :new
    end
   
  end


  def update

    if @user.update(params_user)
    redirect_to pages_user_index_path, notice: "Usuário Atualizado com Sucesso !"
    else
    render :edit
    end
 
  end


 private

 def set_user
  @user = User.find(params[:id])
 end
 
 def params_user
   params.require(:user).permit(:chapa,:acesso)
 end

end
