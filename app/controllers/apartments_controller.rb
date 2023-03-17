class ApartmentsController < ApplicationController
  def index
    matching_apartments = Apartment.all

    @list_of_apartments = matching_apartments.order({ :created_at => :desc })

    render({ :template => "apartments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_apartments = Apartment.where({ :id => the_id })

    @the_apartment = matching_apartments.at(0)

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "apartments/show.html.erb" })
  end

  def new_apartment

    #my_city = params.fetch("query_city_name")
    @list_of_cities = City.all.order({ :name => :asc })
    render({ :template => "apartments/new_apartment.html.erb" })

  end

  def choose_city

    my_city = params.fetch("city")

    @list_of_cities = City.all.order({ :name => :asc })

    render({ :template => "apartments/new_apartment_details.html.erb" })

    if my_city == nil 
      #render({ :template => "apartments/new_apartment.html.erb" })
      #redirect_to("/apartments/new_apartment", { :alert => "No city selected" })
    else
      #redirect_to("/apartments/new_apartment_details", { :alert => "No city selected" })
    end
    #render({ :template => "apartments/test.html.erb" })

  end

  def details
    
    my_city = params.fetch("city")

  end


  def create
    the_apartment = Apartment.new
    the_apartment.city_id = params.fetch("query_city_id")
    the_apartment.city_name = params.fetch("query_city_name")
    the_apartment.address = params.fetch("query_address")
    the_apartment.from_date = params.fetch("query_from_date")
    the_apartment.to_date = params.fetch("query_to_date")
    the_apartment.price = params.fetch("query_price")
    the_apartment.utilities_included = params.fetch("query_utilities_included", false)
    the_apartment.bedrooms = params.fetch("query_bedrooms")
    the_apartment.bathrooms = params.fetch("query_bathrooms")
    the_apartment.pet_friendly = params.fetch("query_pet_friendly", false)
    the_apartment.description = params.fetch("query_description")
    the_apartment.owner_id = params.fetch("query_owner_id")
    the_apartment.owner_name = params.fetch("query_owner_name")
    the_apartment.owner_email = params.fetch("query_owner_email")

    if the_apartment.valid?
      the_apartment.save
      redirect_to("/apartments", { :notice => "Apartment created successfully." })
    else
      redirect_to("/apartments", { :alert => the_apartment.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_apartment = Apartment.where({ :id => the_id }).at(0)

    the_apartment.city_id = params.fetch("query_city_id")
    the_apartment.city_name = params.fetch("query_city_name")
    the_apartment.address = params.fetch("query_address")
    the_apartment.from_date = params.fetch("query_from_date")
    the_apartment.to_date = params.fetch("query_to_date")
    the_apartment.price = params.fetch("query_price")
    the_apartment.utilities_included = params.fetch("query_utilities_included", false)
    the_apartment.bedrooms = params.fetch("query_bedrooms")
    the_apartment.bathrooms = params.fetch("query_bathrooms")
    the_apartment.pet_friendly = params.fetch("query_pet_friendly", false)
    the_apartment.description = params.fetch("query_description")
    the_apartment.owner_id = params.fetch("query_owner_id")
    the_apartment.owner_name = params.fetch("query_owner_name")
    the_apartment.owner_email = params.fetch("query_owner_email")

    if the_apartment.valid?
      the_apartment.save
      redirect_to("/apartments/#{the_apartment.id}", { :notice => "Apartment updated successfully."} )
    else
      redirect_to("/apartments/#{the_apartment.id}", { :alert => the_apartment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_apartment = Apartment.where({ :id => the_id }).at(0)

    the_apartment.destroy

    redirect_to("/apartments", { :notice => "Apartment deleted successfully."} )
  end
end
