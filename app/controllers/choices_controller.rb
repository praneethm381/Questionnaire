class ChoicesController < ApplicationController
  before_action :set_question, only: %i[create destroy]

  def create
    text = params[:text]
    correct = 'test' # params[:correct] == '1'
    Choice.create!(text: text, correct: correct, question_id: @question.id)
    redirect_to question_path(@question)
  end

  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy
    redirect_to question_path(@question)
   end

   private

   def set_question
    @question = Question.find(params[:question_id])
  end
end
