class DressTypesController < ApplicationController
  before_action :set_dress_type, only: [:show, :edit, :update, :destroy]

  # GET /dress_types
  # GET /dress_types.json
  def index
    @dress_types = DressType.all
  end

  # GET /dress_types/1
  # GET /dress_types/1.json
  def show
  end

  # GET /dress_types/new
  def new
    @dress_type = DressType.new
  end

  # GET /dress_types/1/edit
  def edit
  end

  # POST /dress_types
  # POST /dress_types.json
  def create
    @dress_type = DressType.new(dress_type_params)

    respond_to do |format|
      if @dress_type.save
        format.html { redirect_to @dress_type, notice: 'Dress type was successfully created.' }
        format.json { render :show, status: :created, location: @dress_type }
      else
        format.html { render :new }
        format.json { render json: @dress_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dress_types/1
  # PATCH/PUT /dress_types/1.json
  def update
    respond_to do |format|
      if @dress_type.update(dress_type_params)
        format.html { redirect_to @dress_type, notice: 'Dress type was successfully updated.' }
        format.json { render :show, status: :ok, location: @dress_type }
      else
        format.html { render :edit }
        format.json { render json: @dress_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dress_types/1
  # DELETE /dress_types/1.json
  def destroy
    @dress_type.destroy
    respond_to do |format|
      format.html { redirect_to dress_types_url, notice: 'Dress type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dress_type
      @dress_type = DressType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dress_type_params
      params.require(:dress_type).permit(:name, :dress_id)
    end
end
