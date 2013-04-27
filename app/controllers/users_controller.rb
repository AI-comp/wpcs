class UsersController < ApplicationController
  before_filter :login_filter, :except=>['login', 'register', 'authorize', 'create']

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new_with_password(params[:user], params[:password])

    respond_to do |format|
      if @user.save
        login_user(@user)
        format.html { redirect_to :root, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "register" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  # GET /users/login
  def login
    redirect_to contests_path and return if @authorized
  end

  # GET /users/register
  def register
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  # POST /users/authorize
  def authorize
    uid = params[:uid]
    raw_password = params[:password]

    user = User.authenticate(uid, raw_password)
    redirect_to :back, :alert=>'invalid name or password' and return if user.nil?

    login_user(user)
    redirect_to :root, :notice=>'Login successfully'
  end

  # POST /users/logout
  def logout
    logout_user
    redirect_to :root, :notice=>'Logout successfully' and return
  end

end
