class SubmissionsController < ApplicationController

  

  before_filter :authenticate_user

  def start
    @assignment = Assignment.find(params[:assignment_id])
    if current_user.submissions.where(:assignment_id => @assignment.id).any? 
      submission = current_user.submissions.where(:assignment_id => @assignment.id).first
      redirect_to submission_path(submission), notice: "You already had applied for this challenge, Go to the Edit Page, to add your Source Code"
    else
      @submission = Submission.new
      @submission.user = current_user
      @submission.assignment = @assignment
      
      if @submission.save
        redirect_to submission_path(@submission), notice: "회원님의 Assignment 목록에 추가되었습니다. 수정을 누르시고 사진이나 소스코드 올려주세요. 올려주신 소스파일을 확인하고나서 곧 답변 드리겠습니다. Best of luck!!!"
      else
        redirect_to assignment_path(@assignment), alert: "An Error Occurred"
      end
    end
  end
 
  def index
    @submissions = current_user.submissions
  end

  def show
    @submission = Submission.find(params[:id])
  end
  
  def edit
    @submission = Submission.find(params[:id])
    @assignment = @submission.assignment
    @attachment = Attachment.new

  end
 


end
