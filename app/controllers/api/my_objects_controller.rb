class Api::MyObjectsController < ApplicationController
	#http_basic_authenticate_with :name => "platform9", :password => "abcd123"
  #skip_before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token
	before_action :set_my_object, only: [:show, :edit, :update, :destroy]
	def index
		render json: MyObject.all
	end

	# GET /my_objects/1
  # GET /my_objects/1.json
  def show
  	render json: @my_object
  end

  # GET /my_objects/new
  def new
    @my_object = MyObject.new
  end

  # GET /my_objects/1/edit
  def edit
  end

  # POST /my_objects
  # POST /my_objects.json
  def create
    @my_object = MyObject.new(my_object_params)

      if @my_object.save
      	render status: :created, json:{
      		message: "My object was successfully created.",
      		my_object: @my_object
      	}.to_json
        # format.html { redirect_to @my_object, notice: 'My object was successfully created.' }
        # format.json { render :show, status: :created, location: @my_object }
      else
      	render status: :unprocessable_entity, json:{
      		errors: @my_object.errors
      	}.to_json
        # format.html { render :new }
        # format.json { render json: @my_object.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /my_objects/1
  # PATCH/PUT /my_objects/1.json
  def update
     respond_to do |format|

      if @my_object.update(my_object_params)
        format.json { head :no_content, status: :ok }
        format.xml { head :no_content, status: :ok }
      else
        format.json { render json: @my_object.errors, status: :unprocessable_entity }
        format.xml { render xml: @my_object.errors, status: :unprocessable_entity }
      end
      # if @my_object.update(my_object_params)
      # 	render status: :ok, json:{
      # 		message: "My object was successfully updated.",
      # 		my_object: @my_object
      # 	}.to_json
        # format.html { redirect_to @my_object, notice: 'My object was successfully updated.' }
        # format.json { render :show, status: :ok, location: @my_object }
      # else
      # 	render status: :unprocessable_entity, json:{
      # 		message: "My object was could not be updated.",
      # 		my_object: @my_object
      # 	}.to_json
        # format.html { render :edit }
        # format.json { render json: @my_object.errors, status: :unprocessable_entity }
      # end
     end
  end

  # DELETE /my_objects/1
  # DELETE /my_objects/1.json
  def destroy
    @my_object.destroy
    render status: :ok, json:{
      		message: 'My object was successfully destroyed.'
      	}.to_json
    # respond_to do |format|
      # format.html { redirect_to my_objects_url, notice: 'My object was successfully destroyed.' }
      # format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_object
      @my_object = MyObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_object_params
      params.require(:my_object).permit(:color)
    end
end
