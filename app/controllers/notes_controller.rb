class NotesController < ApplicationController
  before_action :set_book, only:[:create, :destroy]

  def create
    @note = @book.notes.new(note_param)
    if @note.save
      redirect_to @book, notice: "Note successfully adde!"
    else
      redirect_to @book, alert: "Unable to add note!"
    end
  end

  def destroy
    @note = @book.notes.find(params[:id])
    @note.destroy
    redirect_to @book, notice: "Note deleted!"
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
  def note_param
    params.require(:note).permit(:title, :note)
  end
end
