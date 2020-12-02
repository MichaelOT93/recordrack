class RecordsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]
  before_action :correct_user, only: [:update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = Record.all

  end

  def search
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @records = Record.all.where("lower(title) LIKE :search OR lower(artist) LIKE :search" , search: "%#{@parameter}%")
    end  
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = current_user.records.build(record_params)
      if @record.save 
        flash[:success] = "Record was successfully created"
        redirect_to root_url

      else 
        render 'static_pages/home'
      end

  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    @record = Record.find(params[:id])
    @record.album_cover.attach(params[:album_cover])
    if @record.update_attributes(record_params)
        flash[:success] = "Record updated"
        redirect_to @record
    else
        render 'edit'
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    flash[:success] = "Record deleted"
    redirect_to request.referrer || root_url
    end
  end

  private
    
  def correct_user
    @record = current_user.records.find_by(id: params[:id])
        redirect_to root_url if @record.nil?
  end

    # Only allow a list of trusted parameters through.
    def record_params
      params.require(:record).permit(:title, :artist, :genre, :description, :year, :price, :album_cover)
    end

