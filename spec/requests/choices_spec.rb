require 'rails_helper'

RSpec.describe 'choices', type: :request do
  
  describe "POST #create" do
    it "saves given choice" do
      question = create(:question)
      post '/choices', params: {question: question.id, text: 'option1', correct: '0', question_id: question.id}
      
      expect(response.body).to include('<a href="http://www.example.com/questions/1">')
      expect(response.body).to redirect_to("http://www.example.com/questions/1")
    end
  end

  describe "DELETE #destroy" do
    it "deletes given choice" do
      question = create(:question)
      choice = create(:choice)
      delete "/choices/#{choice.id}", params: {question: '1',choice: '1'}

      expect {Choice.find(choice.id)}.to raise_error(ActiveRecord::RecordNotFound)
      expect(response.body).to redirect_to("http://www.example.com/questions/1")
    end
  end

end