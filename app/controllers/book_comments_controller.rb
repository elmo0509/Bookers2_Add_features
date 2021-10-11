class BookCommentsController < ApplicationController

  # 保存したらindex.js.erbを表示するように設定
  def create
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    render :index
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id]).destroy
    render :index
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
