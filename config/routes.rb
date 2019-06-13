Rails.application.routes.draw do
  # Routes for the Meal resource:

  # CREATE
  get("/meals/new", { :controller => "meals", :action => "new_form" })
  post("/create_meal", { :controller => "meals", :action => "create_row" })

  # READ
  get("/meals", { :controller => "meals", :action => "index" })
  get("/meals/:id_to_display", { :controller => "meals", :action => "show" })

  # UPDATE
  get("/meals/:prefill_with_id/edit", { :controller => "meals", :action => "edit_form" })
  post("/update_meal/:id_to_modify", { :controller => "meals", :action => "update_row" })

  # DELETE
  get("/delete_meal/:id_to_remove", { :controller => "meals", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
