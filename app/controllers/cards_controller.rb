class CardsController < ApplicationController
  def index
    @cards = Card.order(
      Arel.sql("CASE WHEN race_date = CURRENT_DATE THEN 0 ELSE 1 END"),
      race_date: :desc
    )
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        flash.now[:alert] = @card.errors.full_messages
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @card = Card.includes(:pools).find(params[:id])
    @races = @card.races
    @pools = @card.pools
  end

  def update
    @card = Card.find(params[:id])
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        flash.now[:alert] = @card.errors.full_messages
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @card = Card.includes(:pools).find(params[:id])
    @races = @card.races
    @pools = @card.pools
    @unique_pool_codes = @pools.map(&:pool_code).uniq
  end

  # properly delete card to all child records
  def destroy
    @card = Card.find(params[:id])

    ActiveRecord::Base.transaction do
      @card.races.destroy_all
      @card.pools.destroy_all
      @card.runners.destroy_all
      @card.legs.destroy_all
      @card.destroy!
    end

    respond_to do |format|
      format.html { redirect_to cards_path, notice: "Card was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def card_params
    params.require(:card).permit(:name, :race_date, :course)
  end
end
