class UpdatesController < ApplicationController
  before_action :find_update, only: [:show, :edit, :update, :destroy]
  def index
  	@update = Update.new
  end

  def new
  	@update = Update.new
  end

  def create
  	@update = Update.new update_params

  	if @update.save
  		redirect_to @update, notice: "Update successfully saved"
  	else
  		render 'new', notice: "Update not saved."
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @update.update update_params
  		redirect_to @update, notice: "Update successfully saved."
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@update.destroy
  	redirect_to updates_path
  end

  private

  def update_params
  	params.require(:update).permit(:content)
  end

  def find_update
  	@update = Update.find(params[:id])
  end
end
