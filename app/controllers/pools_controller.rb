class PoolsController < ApplicationController

  # TODO: complete the index method, it should:
  # - get all pools
  # - order pools by those associated with today's cards first, then in descending order by race_date, status, first_race_number and total
  # - if no pools today, redirect to root_path with an alert
  def index
    @pools = Pool.all()
  end

  def new
    @card = Card.new
  end

  # TODO: create pools for each race associated with the requested card. Only pools for supplied bet_types in request
  # Create in an all or nothing transaction block and return an alert to the front-end.
  # A leg entry should also be created for each pool, linking the pool to a race and card.
  def create
  end

  def edit
    @pool = Pool.find(params[:id])
    @card = @pool.card
  end

  # TODO: add a validation that only permits the deletion of a pool as per the can_delete? method in the Pool model.
  # Successful deletion should also delete the leg record.
  def destroy
    @pool = Pool.find(params[:id])
    @card = @pool.card
    @pool.destroy
    redirect_to card_path(@card), notice: "Pool successfully deleted."
  end

  # TODO: complete the update method and redirect the user to the card_path after a successful update
  def update
  end

  private
end
