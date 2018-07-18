require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe "GET #index" do
    it "populates all questions" do
      create(:question)
      get '/questions.json'
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.class).to eq(Array)
      expect(json.count).to eq(1)
      expect(json[0]['text']).to eq('This is a test question?')
    end

    it "renders correct template" do
      create(:question)
      get '/questions'
      expect(response.body).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "shows a question" do
      question = create(:question)
      get "/questions/#{question.id}.json"
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.class).to eq(Hash)
      expect(json['text']).to eq('This is a test question?')
    end
  end

  describe "NEW #new" do
    it "new question" do
      question = create(:question)
      get "/questions/new.json"
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.class).to eq(Hash)
      expect(json['text']).to eq(nil)
    end
  end

  describe "POST #create" do
    it "saves given text" do
      post '/questions.json', params: {question: {text: 'sample question'}}
      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json.class).to eq(Hash)
      expect(json['text']).to eq('sample question')
    end
  end

  describe "PUT #update" do
    it "updates given text" do
      question = create(:question)
      put "/questions/#{question.id}.json", params: {question: {text: 'new question'}}
      json = JSON.parse(response.body)

      expect(json['text']).to eq('new question')
    end
  end

  describe "get #edit" do
    it "edit question" do
      question = create(:question)
      get "/questions/#{question.id}/edit"

      expect(response.body).to include('This is a test question?')
    end
  end

  describe "DELETE #destroy" do
    it "deletes given text" do
      question = create(:question)
      delete "/questions/#{question.id}"

      expect {Question.find(question.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
