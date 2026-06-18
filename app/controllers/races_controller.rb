class RacesController < ApplicationController

  # order races by number in ascending order
  def index
    @races = Race.joins(:card).where(card: { race_date: Date.today }).order(:card_id, :number)
    if @races.empty?
      redirect_to root_path, alert: "No cards for today."
    end
  end

  def new
    @card = Card.find(params[:card_id])
    @race = Race.new
  end

  def create
    params.require(:race).permit(:name, :number, :time)
    @card = Card.find(params[:card_id])

    if @card.pools.any?
      redirect_to card_path(@card), alert: "Cannot add race to card with pools."
      return
    end

    @race = Race.create(name: params[:race][:name], number: params[:race][:number],
                        time: params[:race][:time], card: @card)
    if @race.save
      @card.races
      redirect_to card_path(@card), notice: "Race was successfully created."
    else
      flash.now[:alert] = @race.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    params.require(:race).permit(:name, :number, :time)

    @race.update(name: params[:race][:name], number: params[:race][:number], time: params[:race][:time])
    if @race.save
      redirect_to card_path(@race.card), notice: "Race was successfully updated."
    else
      flash.now[:alert] = @race.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @race = Race.find(params[:id])
    @card = @race.card
    if @race.delete
      redirect_to card_path(@card), notice: "Race was successfully deleted."
    else
      flash.now[:alert] = @race.errors.full_messages
    end
  end

  private
end
