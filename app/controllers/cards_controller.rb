class CardsController < ApplicationController

  # TODO:
  # - grab all cards
  # - cards where race_date is today should be first
  # - card that are not for today should appear after in descending order
  def index
    @cards = []
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

  # TODO: grab card by id and include pools
  # grab all unique pool codes associated with the card pools
  def show
  end

  # TODO: delete card and all child records within an all or nothing transaction
  def destroy
  end

  private

  def card_params
    params.require(:card).permit(:name, :race_date, :course)
  end
end
