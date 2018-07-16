class QuestionsController < ApplicationController

  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @questions }
      format.json  { render :json => @questions }
    end
  end

  def new
    @question = Question.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @question }
      format.json  { render :json => @question }
    end
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @question }
      format.json  { render :json => @question }
    end
  end

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

  def edit
    @question = Question.find(params[:id])
  end

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

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_path) }
      format.xml  { head :ok }
    end
  end

end
