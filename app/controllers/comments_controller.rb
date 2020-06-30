class CommentsController < ApplicationController
	@message = Message.find(params[:message_id])
	@comment = @message.comments.create(comment_params)
	@comment.user_id = current_user.user_id

	if @comment.save
		redirect_to message_path(@message)
	else
		render :new
	end

	private 

	def comment_params
		params.require(:comment).permit(:content)
	end
end
