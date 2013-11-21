class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :new]

  layout "user_profile_layout", except: :view

  load_and_authorize_resource except: [:create]  #bug with create


  # GET /photos
  # GET /photos.json
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.all.paginate(:page => params[:page])
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    # @comments = @photo.comments

  end

  def view
    @photo = Photo.find(params[:photo_id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new()
  end

  # GET /photos/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /photos
  # POST /photos.json
  def create

    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.published = true

    authorize! :create, @photo #manualy authorize

    respond_to do |format|
    

      if @photo.save
        format.html { redirect_to user_photo_path(current_user,@photo), notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new',notice: "Hmm" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    
    end
  
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to user_photo_path(current_user,@photo), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    
    respond_to do |format|
      if @photo.destroy
        format.html { redirect_to user_photos_path(current_user),notice: I18n.t(:photo_was_deleted) }
      else
        format.html { redirect_to user_photos_path(current_user),:flash => { :error => I18n.t(:paricipate_in_competition) }   }
      end


    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :user_id, :image,:image_cache,:theme_tokens,:topic_id,:destination_id)
    end
end
