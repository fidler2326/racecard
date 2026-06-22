class PoolsController < ApplicationController
  def index
    @pools = Pool
               .joins(:card)
               .order(
                 Arel.sql("CASE WHEN cards.race_date = CURRENT_DATE THEN 0 ELSE 1 END"),
                 Arel.sql("cards.race_date DESC"),
                 Arel.sql("pools.status DESC"),
                 Arel.sql("pools.first_race_number ASC"),
                 Arel.sql("pools.total DESC")
               )
    if @pools.empty?
      redirect_to root_path, alert: "No cards for today."
    end
  end

  def new
  end

  def create
    bet_types = params[:bet_types]
    @card = Card.find(params[:card_id])

    ActiveRecord::Base.transaction do
      @card.races.each do |race|
        bet_types.each do |bet_type|
          pool = Pool.new
          pool.pool_code = bet_type
          pool.currency = "GBP"
          pool.card_id = @card.id
          pool.total = 0.to_d
          pool.first_race_number = race.number
          pool.save!

          leg = Leg.new
          leg.pool_id = pool.id
          leg.race_id = race.id
          leg.card_id = @card.id
          leg.save!
        end
      end
    end

    redirect_to card_path(@card), notice: "Pools successfully created."
  end

  def edit
    @pool = Pool.find(params[:id])
    @card = @pool.card
  end

  def destroy
    @pool = Pool.find(params[:id])
    @card = @pool.card
    @pool.destroy
    redirect_to card_path(@card), notice: "Pool successfully deleted."
  end

  def update
    @pool = Pool.find(params[:id])
    @card = @pool.card

    if @pool.total != params[:pool][:total].to_d
      @pool.total = params[:pool][:total].to_d
    end

    if @pool.carryover != params[:pool][:carryover].to_d
      @pool.carryover = params[:pool][:carryover].to_d
    end

    if @pool.guarantee != params[:pool][:guarantee].to_d
      @pool.guarantee = params[:pool][:guarantee].to_d
    end

    if params[:pool][:open] == "1"
      @pool.status = "active"
    end

    if params[:pool][:close] == "1"
      @pool.status = "closed"
    end

    if params[:pool][:suspend] == "1"
      @pool.status = "suspended"
    end

    @pool.save!

    redirect_to card_path(@pool.card), notice: "Pool successfully updated."
  end

  private
end
