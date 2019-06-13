class MealsController < ApplicationController
  def index
    @q = Meal.ransack(params[:q])
    @meals = @q.result(:distinct => true).includes(:restaurant).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@meals.where.not(:image_url_latitude => nil)) do |meal, marker|
      marker.lat meal.image_url_latitude
      marker.lng meal.image_url_longitude
      marker.infowindow "<h5><a href='/meals/#{meal.id}'>#{meal.name}</a></h5><small>#{meal.image_url_formatted_address}</small>"
    end

    render("meal_templates/index.html.erb")
  end

  def show
    @meal = Meal.find(params.fetch("id_to_display"))

    render("meal_templates/show.html.erb")
  end

  def new_form
    @meal = Meal.new

    render("meal_templates/new_form.html.erb")
  end

  def create_row
    @meal = Meal.new

    @meal.name = params.fetch("name")
    @meal.restaurant_id = params.fetch("restaurant_id")
    @meal.image_url = params.fetch("image_url")

    if @meal.valid?
      @meal.save

      redirect_back(:fallback_location => "/meals", :notice => "Meal created successfully.")
    else
      render("meal_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_restaurant
    @meal = Meal.new

    @meal.name = params.fetch("name")
    @meal.restaurant_id = params.fetch("restaurant_id")
    @meal.image_url = params.fetch("image_url")

    if @meal.valid?
      @meal.save

      redirect_to("/restaurants/#{@meal.restaurant_id}", notice: "Meal created successfully.")
    else
      render("meal_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @meal = Meal.find(params.fetch("prefill_with_id"))

    render("meal_templates/edit_form.html.erb")
  end

  def update_row
    @meal = Meal.find(params.fetch("id_to_modify"))

    @meal.name = params.fetch("name")
    @meal.restaurant_id = params.fetch("restaurant_id")
    @meal.image_url = params.fetch("image_url")

    if @meal.valid?
      @meal.save

      redirect_to("/meals/#{@meal.id}", :notice => "Meal updated successfully.")
    else
      render("meal_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_restaurant
    @meal = Meal.find(params.fetch("id_to_remove"))

    @meal.destroy

    redirect_to("/restaurants/#{@meal.restaurant_id}", notice: "Meal deleted successfully.")
  end

  def destroy_row
    @meal = Meal.find(params.fetch("id_to_remove"))

    @meal.destroy

    redirect_to("/meals", :notice => "Meal deleted successfully.")
  end
end
