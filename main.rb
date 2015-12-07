require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

require_relative 'controllers/bookmarks_controller'

require_relative 'models/bookmark'

get '/' do
  erb :home
end

get '/bookmarks' do
  sql = "SELECT * FROM bookmarks"
  @bookmarks = run_sql(sql)

  erb :index
end

get '/bookmarks/new' do 

  erb :new 
end

post '/bookmarks' do 
  # Persist new task to DB
  name = params[:name]
  URL = params[:url]
  genre = params[:genre]
  sql = "INSERT INTO tasks (name, url, genre) VALUES ('#{name}', '#{url}', #{genre})"
  run_sql(sql)
  redirect to('/bookmarks')
end

#BELOW IS PASTED FROM TODO NOTES AND I DON'T UNDERSTAND IT.
#ABOVE IS THE LIMIT OF MY UNDERSTANDING!


get '/bookmarks/:id' do 
  # Grab bookmark from DB where id = :id
  sql = "SELECT * FROM bookmarks WHERE id = #{params[:id]}"
  @bookmark = run_sql(sql).first
  erb :show
end
#NEED TO CHANGE SHOW TO DIFFERENT ROUTE

get '/bookmarks/:id/edit' do
  # Grab bookmark from DB and render form
  sql = "SELECT * FROM bookmarks WHERE id = #{params[:id]}"
  @bookmark = run_sql(sql).first
  erb :edit
end

post '/bookmarks/:id' do 
  # Grab params and update in DB
  name = params[:name]
  genre = params[:genre]
  sql = "UPDATE tasks SET name='#{name}', genre='#{genre}' WHERE id=#{params[:id]}"
  run_sql(sql)
  redirect to("/bookmarks/#{params[:id]}")
end

post '/bookmarks/:id/delete' do 
  # Destroy in DB
  sql = "DELETE FROM bookmarks WHERE id = #{params[:id]}"
  run_sql(sql)
  redirect to('/bookmarks')
end

def run_sql(sql)
  conn = PG.connect(dbname: 'bookmarks', host: 'localhost')

  result = conn.exec(sql)
  conn.close
  result
end
