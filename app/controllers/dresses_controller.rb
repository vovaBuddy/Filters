class DressesController < ApplicationController
  before_action :set_dress, only: [:show, :edit, :update, :destroy]

  # GET /dresses
  # GET /dresses.json
  def index
    @dresses = Dress.all
  end

  # GET /dresses/1
  # GET /dresses/1.json
  def show
  end

  # GET /dresses/new
  def new
    @dress = Dress.new
  end

  # GET /dresses/1/edit
  def edit
  end

  # POST /dresses
  # POST /dresses.json
  def create
    @dress = Dress.new(dress_params)

    respond_to do |format|
      if @dress.save
        format.html { redirect_to @dress, notice: 'Dress was successfully created.' }
        format.json { render :show, status: :created, location: @dress }
      else
        format.html { render :new }
        format.json { render json: @dress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dresses/1
  # PATCH/PUT /dresses/1.json
  def update
    respond_to do |format|
      if @dress.update(dress_params)
        format.html { redirect_to @dress, notice: 'Dress was successfully updated.' }
        format.json { render :show, status: :ok, location: @dress }
      else
        format.html { render :edit }
        format.json { render json: @dress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dresses/1
  # DELETE /dresses/1.json
  def destroy
    @dress.destroy
    respond_to do |format|
      format.html { redirect_to dresses_url, notice: 'Dress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def load_content

    p "*" * 100
    p params

    left_br = params[:left].to_i
    right_br = left_br + 27
    sql_query = 'select dresses.name, dresses.price, dresses.image from dresses '
    sql_query += 'left outer join colors on colors.dress_id = dresses.id ' unless params[:color].nil?
    sql_query += 'left outer join dress_types on dress_types.dress_id = dresses.id ' unless params[:type].nil?

    sql_query += get_filter_sql_querry("type", "dress_types", sql_query)
    sql_query += get_filter_sql_querry("color", "colors", sql_query)
    sql_query += get_filter_sql_querry("brand", nil, sql_query)


    unless params[:price].nil?
      if sql_query.include?("where")
        sql_query += " and ("
      else
        sql_query += " where ("
      end
      sql_query += "price >= #{params[:price][0]} and price <= #{params[:price][1]}"
      sql_query += " ) "
    end

    sql_query += get_filter_sql_querry("length", nil, sql_query)
    p sql_query

    @dresses = Dress.find_by_sql(sql_query)[left_br..right_br]

    render layout: false
  end

  private
    
    def get_filter_sql_querry(filter, database=nil, cur_sql)
      sql = ""
      unless params[filter.to_s].nil?
        if cur_sql.include?("where")
          sql += " and ("
        else
          sql += " where ("
        end

        Array(params[filter.to_s]).each do |i|
          sql += " or " if i != Array(params[filter.to_s]).first
          unless database.nil?
            sql += " #{database}.name = '#{i}' "
          else
            sql += " #{filter} = '#{i}' "
          end
        end 

        sql += " ) "
      end
      sql
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_dress
      @dress = Dress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dress_params
      params.require(:dress).permit(:name, :brand, :image, :price, :type, :color, :length)
    end
end
