class ApplicationController < Sinatra::Base

  before do
    content_type :json
  end

  # add routes
  get '/bakeries' do
    bake = Bakery.all
    bake.to_json
  end

  get '/bakeries/:id' do
    good = Bakery.find(params[:id])
    good.to_json(include: :baked_goods)
  end
get '/baked_goods/by_price' do
  price = BakedGood.all.order(price: :desc)
  price.to_json
end
get '/baked_goods/most_expensive' do
 price =  BakedGood.all.order(price: :desc).first
 price.to_json
end
end
