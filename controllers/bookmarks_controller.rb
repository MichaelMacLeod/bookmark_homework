get '/bookmarks' do

@bookmarks = Bookmarks.all
erb :index

get '/bookmarks/new' do 
  @bookmark = Bookmark.new
  erb :new
end

post '/bookmarks/:id' do
  @bookmarks = Bookmark.find(params[:id])
  @bookmark.update_attributes(params[:bookmark])
  redirect to('/bookmarks')
end

get '/bookmarks/:id/edit' do 
  @bookmark = Bookmark.find(params[:id])
  erb :edit
end

post '/bookmarks/:id/delete' do 
  bookmark = Bookmark.find(params[:id])
  bookmark.destroy
  redirect to('/bookmarks')
end 

# When we call save, it creates a new line in the DB. 
post '/bookmarks' do
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmark.save
    redirect to('bookmarks')
end
end