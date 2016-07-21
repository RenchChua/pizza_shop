class PizzaShop < Sinatra::Base
  # get all pizzas
  get '/pizzas' do
    @pizzas = Pizza
  end

  # get one pizza

  get '/pizzas/:id' do
    @pizza = Pizza.find(params[:id])
  end

  #updating a pizza

  put '/pizzas/:id' do
    @the_pizza = Pizza.find(params[:id])
    @the_pizza.update_attributes(
      name: 'Anything Pizza', #hardcoded... not good
      sauce: 'indecisivesauceness' #hardcoded... not good
    )
  end

  # creating a pizza

  post '/pizza' do
    Pizza.create(
    name: "Something"
    sauce: "curry",
    cheese: true, mushrooms: false,
    extra_toppings: "shitake mushrooms")
  end


  # deleting a pizza

  delete 'pizza/:id' do
    @delete_pizza = Pizza.find(params[:id])
    @delete_pizza.destroy
  end

end
