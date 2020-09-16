
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
#READ ALL
  get '/articles' do
    @articles = Article.all
    erb :index
  end

#CREATE GET
  get '/articles/new' do

    erb :new
  end

#CREATE POST
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{Article.last.id}"
  end

#READ POST SINGLE
  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

#UPDATE GET
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

#UPDATE PATCH
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    erb :show
  end


#DELETE
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    
    @article.destroy
    @articles = Article.all

    redirect to "/articles"

    erb :index
  end


end
