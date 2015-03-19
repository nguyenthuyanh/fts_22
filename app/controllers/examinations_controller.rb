class ExaminationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @exam = Examination.find params[:id]
    @subject = @exam.subject
  end

  def index
    @exam = Examination.new
    @examinations = Examination.in_order(current_user) 
  end

  def create
    @subject = Subject.find params[:subject_id]
    @exam = @subject.examinations.new exam_params
    ids = Question.create_questions(@subject).pluck(:id)
    @exam.question_ids = ids
    if @exam.save
      redirect_to edit_examination_path @exam
    else
      render 'new'
    end
  end

  def edit
    @exam = Examination.find params[:id]
    @subject = @exam.subject
    @end = @exam.created_at + 20*60
  end

  def update
    @exam = Examination.find params[:id]
    @answer_sheets = @exam.answer_sheets
    if @exam.update_attributes answer_sheet_params
      redirect_to examination_path @exam
    else
      flash.now[:danger] = "Cannot submit"
    end
  end

  private
    def exam_params
      params.require(:examination).permit :user_id
    end

    def answer_sheet_params
      params.require(:examination).permit answer_sheets_attributes: [:id, :answer_id, :correct]
    end
end
