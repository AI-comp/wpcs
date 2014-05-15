class Admin::ImagesController < AdminController

  # GET /images
  def index
    @images = Image.all
  end

  # GET /images/1
  def show
    @image = Image.find(params[:id])
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html { redirect_to admin_image_path(@image), notice: 'Image was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /images/1
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to admin_image_path(@image), notice: 'Image was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /images/1
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end
end
