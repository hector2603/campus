class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
before_action :user_activo? , only: [:create]

  # GET /resource/sign_in
  def new
    super
    if flash[:notice] == "Su cuenta todavía no ha sido activada, por favor espere a que el administrador la valide y active, gracias" 
      flash[:notice] = "Su cuenta todavía no ha sido activada, por favor espere a que el administrador la valide y active, gracias" 
    end
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def user_activo?
    @user = User.where("email =? ", params[:user][:email]).limit(1)[0]
    unless @user.active
      flash[:notice] = "Su cuenta todavía no ha sido activada, por favor espere a que el administrador la valide y active, gracias" 
      redirect_to new_user_session_path
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
