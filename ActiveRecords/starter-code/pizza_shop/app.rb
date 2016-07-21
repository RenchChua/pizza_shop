class PizzaShop < Sinatra::Base
  get "/" do
    erb "Get sumz Pizzazz furz Nomz herez"
  end

  # get all pizzas
  get "/pizzas" do
    @pizzas = Pizza.all
    erb "get all pizzas"
  end

  #get form view to create new pizza
  get "/pizzas/new" do
    @pizza = Pizza.new
    erb :"./pizzas/new"
  end

  # creating a pizza, where the new form POSTs to, it does the actual creation

  post "/pizzas" do
    @pizza = Pizza.new(params[:pizza])
    if @pizza.save
      redirect("/pizzas/#{@pizza.id}")
    else
      erb(:"pizza/new")
    end
  end

  #   Pizza.create(
  #   name: "Something",
  #   sauce: "curry",
  #   cheese: true, mushrooms: false,
  #   extra_toppings: "shitake mushrooms")
  # end

  # get form view to edit an existing pizza
  get "/pizzas/:id/edit" do
    erb "get form to edit one pizza with id #{params[:id]}"
  end

  # show details of just one pizza with id #{params[:id]}

  get "/pizzas/:id" do
    @pizza = Pizza.find(params[:id])
    erb "This pizza is #{@pizza[:name]}"
  end

  #updating a pizza, like CREATE, this does the actual updating

  put "/pizzas/:id" do
    @the_pizza = Pizza.find(params[:id])
    @the_pizza.update_attributes(
      name: "Anything Pizza", #hardcoded... not good
      sauce: "indecisivesauceness" #hardcoded... not good
    )

    erb "update one pizza with id #{params[:id]}"
  end

  # deleting a pizza

  delete "pizza/:id" do
    @delete_pizza = Pizza.find(params[:id])
    @delete_pizza.destroy
    erb "delete one piazza with id #{params[:id]}"
  end

end
