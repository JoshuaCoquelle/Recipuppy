class ProfilesController < ApplicationController
  before_action :find_profile, except: [:create, :new]
  before_action :authenticate_user!

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile      = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile), notice: "Welcome to DogTreat #{@profile.f_name}"
    else
      redirect_to posts_path, notice: "Profile Couldn't be created."
    end
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:f_name, :l_name, :address, :city, :treat_name, :breeds_owned)
  end

end
