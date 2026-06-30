class PoolsController < ApplicationController

  # TODO: complete the index method, it should:
  # - get all pools (done)
  # - order pools by those associated with today's cards first, then in descending order by race_date, status, first_race_number and total (done)
  # - if no pools today, redirect to root_path with an alert (done)
  def index
    @pools = Pool.joins(:card).where(card: {race_date: Date.today}).order(:race_date, :status, :first_race_number, total: :desc)
    if @pools.empty?
      redirect_to root_path, notice: "No pools found"
    end
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
    if @pool.can_delete?
      @pool.destroy
      redirect_to card_path(@card), notice: "Pool successfully deleted."
    end
  end

  # TODO: complete the update method and redirect the user to the card_path after a successful update
  def update
  end

  private
end
