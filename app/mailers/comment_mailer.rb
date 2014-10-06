class CommentMailer < ActionMailer::Base
  default from: "from@example.com"

  def notify_idea_owner(comment)


      @comment= comment
    @idea = comment.idea
    @receiver = comment.idea.user
    mail(to:"nour@khatib.ca" ,subject:"Someone comenteded ur idea: #{@idea.title}")



  end
end
