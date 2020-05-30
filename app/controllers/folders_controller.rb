class FoldersController < ApplicationController

  before_action :set_folder, only: %i[edit update destroy]

  def index
    @folders = Folder.all
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(params_folder)
    if @folder.save
      redirect_to folders_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @folder.update(params_folder)
    redirect_to folders_path
  end

  def destroy
    @folder.destroy
    redirect_to folders_path
  end

    private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def params_folder
    params.require(:folder).permit(:name)
  end
end
