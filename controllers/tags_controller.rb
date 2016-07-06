require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

get '/tags/new' do
  erb(:'tags/new')
end

post '/tags' do 
  @tag = Tag.new(params)
  @tag.save
  erb(:'tags/create')
end

get "/tags/:id" do
  @tag = Tag.find(params[:id])
  erb(:'tags/show')
end

get "/tags/:id/edit" do
  @tag = Tag.find(params[:id])
  erb(:'tags/edit')
end

post "/tags/:id" do
  @tag = Tag.update(params)
  redirect to("/tags/#{params[:id]}")
end

post "/tags/:id/delete" do
  Tag.delete(params[:id])
  redirect to('/tags')
end