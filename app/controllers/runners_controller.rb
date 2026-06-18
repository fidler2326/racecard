class RunnersController < ApplicationController
  def index
    @runners = Runner.joins(:card).where(card: { race_date: Date.today }).order(:card_id, :number)
    if @runners.empty?
      redirect_to root_path, alert: "No cards for today."
    end
  end

  def show
    @race = Race.find(params[:race_id])
    @runner = @race.runners.find(params[:id])
  end

  def new
    @race = Race.find(params[:race_id])
    @race_runners = @race.runners.order(:number)
    @runners = [Runner.new(race: @race, card: @race.card)]
  end

  def create
    @race = Race.find(params[:race_id])

    ActiveRecord::Base.transaction do
      runners_params.each do |runner_attributes|
        next if runner_attributes.values.all?(&:blank?)

        @race.runners.create!(
          runner_attributes.merge(card_id: @race.card_id)
        )
      end
    end

    redirect_to new_race_runner_path(@race), notice: "Runners were successfully created."
  rescue ActiveRecord::RecordInvalid => error
    flash.now[:alert] = error.record.errors.full_messages
    @race_runners = @race.runners.order(:number)
    @runners = runners_params.map { |attrs| Runner.new(attrs.merge(race: @race, card: @race.card)) }
    render :new, status: :unprocessable_entity
  end

  def edit
    @race = Race.find(params[:race_id])
    @runner = @race.runners.find(params[:id])
  end

  def update
    @runner = Runner.find(params[:id])
    @runner.program_number = params[:runner][:program_number] if params[:runner][:program_number].present?
    @runner.trainer = params[:runner][:trainer] if params[:runner][:trainer].present?
    @runner.jockey = params[:runner][:jockey] if params[:runner][:jockey].present?
    @runner.scratched = params[:runner][:scratched] == "1" if params[:runner][:scratched].present?
    @runner.finish_position = params[:runner][:finish_position].to_i if params[:runner][:finish_position].present?
    @runner.finished = params[:runner][:finished] == "1" if params[:runner][:finished].present?
    @runner.odds = params[:runner][:odds] if params[:runner][:odds].present?
    @runner.form = params[:runner][:form] if params[:runner].key?(:form)
    @runner.additional_data = params[:runner][:additional_data] if params[:runner].key?(:additional_data)
    @runner.past_performances = params[:runner][:past_performances] if params[:runner].key?(:past_performances)

    if @runner.save
      redirect_to new_race_runner_path(@runner.race), notice: "Runner was successfully updated."
    else
      flash.now[:alert] = @runner.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @race = Race.find(params[:race_id])
    @runner = @race.runners.find(params[:id])
    @runner.destroy
    redirect_to new_race_runner_path(@race), notice: "Runner was successfully deleted."
  end

  private

  def runners_params
    params.fetch(:runners, []).map do |runner_params|
      runner_params.permit(:name, :program_number, :number, :trainer, :jockey)
    end
  end

  def single_runner_params
    params.require(:runner).permit(:name, :program_number, :number, :trainer, :jockey)
  end
end