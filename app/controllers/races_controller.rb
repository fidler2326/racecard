class RacesController < ApplicationController

  # TODO: complete the order method, it should:
  # - get all races for today
  # - order races by number in ascending order
  # - if no races today, redirect to root_path with an alert
  def index
    @races = []
  end

  # TODO: complete the new method, it should:
  # - get the card from the params
  # - initialise a new race object
  def new
    @race = Race.new
  end

  # TODO: complete the create method, it should:
  # - get card from database using card_id in request params
  # - check if card has any pools, if it does, redirect to card_path with an alert
  # - create a new race object using the race params
  # - save the race object to the database
  # - redirect to card_path with a notice
  def create
  end

  # TODO: get race by id
  def edit
  end

  # TODO: update race by id
  # - get race from database using race_id in request params
  # - update race with race params
  # - save race to database
  # - redirect to card_path with a notice
  def update
  end

  # TODO: delete race by id
  # - get race from database using race_id in request params
  # - delete race from database
  # - redirect to card_path with a notice
  # - deleting a race should be restricted by:
  #   a. race must not be associated to a past card or current card
  #   b. deletion of a race should also delete all associated runners
  def destroy
  end

  private

  # TODO: define a filter method that grabs the associated card from the database, this method should be called
  # before the request method implementations using before_action
end
