# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Installation

* Download the repo.
* Do `bundle install`
* Run `rails server`
* open `http://localhost:3000`

Things I want to cover in this:

* How Rest URL's work in Rails.

```sh
For resources :questions

Http method   Rest url           rails controller method   rails helper paths
GET         "/questions"                index                 questions_path
GET         "/questions/:id"            show                  question
GET         "/questions/new"            new                   new_question_path
POST        "/questions"                create                
GET         "/questions/:id/edit"       edit                  edit_question_path
PUT         "/questions/:id"            Update                question
DELETE      "/questions/:id"            destroy               question

For resources :choices, only:[:create, :destroy]

Http method   Rest url           rails controller method   rails helper paths
POST         "/choices"                create                   
DELETE       "/choices/:id"            destroy                  choice
```
