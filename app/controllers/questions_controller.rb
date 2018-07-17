class QuestionsController < ApplicationController

  # Called for a GET /questions request.
  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @questions }
      format.json  { render :json => @questions }
    end
  end

  # Called for GET /questions/new request.
  def new
    @question = Question.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @question }
      format.json  { render :json => @question }
    end
  end

  # Called for GET /questions/1 request.
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @question }
      format.json  { render :json => @question }
    end
  end

  # Called for a POST /questions request.
  def create
    @question = Question.new(params.require(:question).permit(:text))

    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question, :notice => 'Question is created successfully.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
        format.json  { render :json => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Called for a GET /questions/1/edit request.
  def edit
    @question = Question.find(params[:id])
  end

  # Called for a PUT /questions/1 request.
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params.require(:question).permit(:text))
        format.html { redirect_to(@question, :notice => 'Question is updated successfully.') }
        format.xml  { head :ok }
        format.json  { render :json => @question }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Called for a DELETE /questions/1 request.
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_path) }
      format.xml  { head :ok }
    end
  end

end
