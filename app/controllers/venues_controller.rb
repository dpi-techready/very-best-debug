class VenuesController < ApplicationController
  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/index.html.erb" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/show.html.erb" })
  end

  def create
    insert_venue_record = params.fetch("query_address")
    a_new_venue = Venue.new
    a_new_venue.address = params.fetch("query_address")
    a_new_venue.name = params.fetch("query_name")
    a_new_venue.neighborhood = params.fetch("query_neighborhood")
    a_new_venue.save

    redirect_to("/venues/#{a_new_venue.id}")
  end

  def update
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    the_venue = matching_venues.at(0)

    update_address = params.fetch("query_address")
    the_venue.address = update_address
    update_name = params.fetch("query_name")
    the_venue.name = update_name
    update_neighborhood = params.fetch("query_neighborhood")
    the_venue.neighborhood = update_neighborhood
    the_venue.save

    redirect_to("/venues/#{the_venue.id}")
  end

  def destroy
        # Parameters: {"path_id" => "785"}
        # the_id = params.fetch("path_id")
        # matching_photos = Photo.where({ :id => the_id })
        # the_photo = matching_photos.at(0)
        # the_photo.destroy

    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    the_venue = matching_venues.at(0)
    the_venue.destroy

    redirect_to("/venues")
  end
end
