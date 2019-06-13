class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    render("restaurant_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @meal = Meal.new
    @restaurant = Restaurant.find(params.fetch("id_to_display"))

    render("restaurant_templates/show.html.erb")
  end

  def new_form
    @restaurant = Restaurant.new

    render("restaurant_templates/new_form.html.erb")
  end

  def create_row
    @restaurant = Restaurant.new

    @restaurant.name = params.fetch("name")
    @restaurant.address = params.fetch("address")
    @restaurant.image_url = params.fetch("image_url")
    @restaurant.description = params.fetch("description")
    @restaurant.creator_id = params.fetch("creator_id")
    @restaurant.rating = params.fetch("rating")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid?
      @restaurant.save

      redirect_back(:fallback_location => "/restaurants", :notice => "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_user
    @restaurant = Restaurant.new

    @restaurant.name = params.fetch("name")
    @restaurant.address = params.fetch("address")
    @restaurant.image_url = params.fetch("image_url")
    @restaurant.description = params.fetch("description")
    @restaurant.creator_id = params.fetch("creator_id")
    @restaurant.rating = params.fetch("rating")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/users/#{@restaurant.creator_id}", notice: "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant = Restaurant.find(params.fetch("prefill_with_id"))

    render("restaurant_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant = Restaurant.find(params.fetch("id_to_modify"))

    @restaurant.name = params.fetch("name")
    @restaurant.address = params.fetch("address")
    @restaurant.image_url = params.fetch("image_url")
    @restaurant.description = params.fetch("description")
    @restaurant.creator_id = params.fetch("creator_id")
    @restaurant.rating = params.fetch("rating")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_creator
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/users/#{@restaurant.creator_id}", notice: "Restaurant deleted successfully.")
  end

  def destroy_row
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/restaurants", :notice => "Restaurant deleted successfully.")
  end
end
