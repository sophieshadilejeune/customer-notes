class FoldersController < ApplicationController

  def index
  end
  def show
  end
  def new
    @folder = Folder.new
  end
  def create
    @folder = Folder.new(params_folder)
    if @folder.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
  end
  def update
  end
  def destroy
  end

private

def params_folder
  params.require(:folder).permit(:name)
  end
end
