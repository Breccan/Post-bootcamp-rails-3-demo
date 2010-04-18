class RegistrationsController < ApplicationController

  def index
    @registrations = Registration.all
  end  

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])
    if @registration.save
      redirect_to :action => :index
    else
      render :action => :new
    end    
  end
  
  def edit
    @registration = Registration.find_by_id(params[:id])
  end

  def update
    @registration = Registration.find_by_id(params[:id])
    @registration.update_attributes(params[:registration])
    if @registration.save
      redirect_to :action => :index
    else
      render :action => :edit
    end  
  end

  def destroy
    Registration.find_by_id(params[:id]).destroy 
    redirect_to :action => :index
  end

end
