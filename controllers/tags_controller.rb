require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end

get '/tags/new' do
  erb(:'tags/new')
end