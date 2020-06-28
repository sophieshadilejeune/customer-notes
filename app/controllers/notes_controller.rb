class NotesController < ApplicationController

  def index
    @user = current_user
    @my_notes = @user.notes
    @notes = @my_notes.order(:position)
    @note = Note.new
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params_note)
    @note.user = current_user
    if @note.save
      redirect_to notes_path
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

  def sort
    @user = current_user
    @my_notes = @user.notes
    params[:note].each_with_index do |id, index|
      @my_notes.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  private

  def params_note
    params.require(:note).permit(:title, :user_id, :content, :date, :position)
  end
end
