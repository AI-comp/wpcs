class Admin::UsersController < AdminController

  # GET /admin/users
  def index
    @user = current_user
    @users = User.all

    respond_to do |format|
      format.html
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    raise Error.new
    @user = User.new(params[:user])
    raw_password = params[:password]
    salt = generate_random_token(10)
    encrypted_password = User.encrypt_password(raw_password, salt)

    @user.salt = salt
    @user.encrypted_password = encrypted_password

    @user.provider = "WPCS"

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
    end
  end

end
