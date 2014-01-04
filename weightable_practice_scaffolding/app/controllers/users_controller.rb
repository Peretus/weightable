class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] 


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    if current_user
      @user = current_user
    else 
      @user= User.new(name:"Guest")
    end

    @weigh_in = @user.weigh_ins.new
    @weigh_ins = @user.weigh_ins
    
  end

  def feed
    @users = User.all
    if current_user
      @user = current_user
    else 
      @user= User.new(name:"Guest")
    end

    @weigh_in = @user.weigh_ins.new
    @weigh_ins = @user.weigh_ins
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @users = User.all
    @weigh_in = WeighIn.new
    @comment = Comment.new
    @weights = []
    @dates = []
    @goal = []
    recent_weight = @user.weigh_ins.first.weight

    original_weight = @user.weigh_ins.last.weight
    @progress = (recent_weight - @user.goal)/(original_weight - @user.goal).to_f*100
    if @progress < 0
       @progress = 100 
    elsif @progress > 100
      @progress = 0
    else
      @progress
    end

    # BMI is calculated by dividing weight in pounds (lbs) by height in inches (in) squared and multiplying by a conversion factor of 703.
    @bmi = ((@user.weigh_ins.last.weight/(((@user.height_in_feet*12)+@user.height_in_inches)**2))*703).round(2)

    #Calculate lowest weigh in, aka record weight
    @record_weight = @user.weigh_ins.minimum("weight").round(2).to_i

    #Compare BMI to Underweight, Normal Weight, Overweight or Obese categories
    case @bmi
    when 0.0..18.4
      @record_weight_status = "Underweight"
    when 18.5..24.9
      @record_weight_status = "Normal Weight"
    when 25.0..29.9
      @record_weight_status = "Overweight"
    when 30.0..100
      @record_weight_status = "Obese"
    else 
      @record_weight_status = "Not Valid"
    end      
  
    # if @record_weight <= 18.49
    #   @record_weight_status = "Underweight"
    # elsif @record_weight >= 18.5 && @record_weight <= 24.99
    #   @record_weight_status = "Normal Weight"
    # elsif @record_weight >= 25 && @record_weight <= 29.99
    #   @record_weight_status = "Normal Weight"
    # else
    #   @record_weight_status = "Obese"
    # end

  end

  def search
    @users = User.all
    @results = @users.search(params[:search])
  end

  # GET /users/new
  def new
    @user = User.new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
        redirect_to :back
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def friends
    @user = current_user
  end

  def all_users
    @users = User.all
    @user = current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

  def user_params
    params.require(:user).permit(:name, :provider, :uid, :profile_pic, :goal, :goal_date,  :height_in_feet, :height_in_inches, weigh_ins_attributes: [:id, :weight, :status])
  end

 
end
