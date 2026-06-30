class RunnersController < ApplicationController

  # TODO: complete the index method, it should:
  # - get all runners for today (done)
  # - order runners by card_id and number in ascending order (done)
  # - if no runners today, redirect to root_path with an alert (done)
  def index
    @runners = Runner.joins(:card).where(cards: { race_date: Date.today }).order(:card_id, :number)

    if @runners.empty?
      redirect_to root_path, alert: "No runners scheduled for today."
    end
  end

  # TODO: complete the show method, it should:
  # - get runner from database using id in request params
  # - get race from database using race_id in request params
  def show
    @race = Race.find(params[:race_id])
    @runner = Runner.find(params[:id])
  end

  # TODO: complete the new method, it should:
  # - get race from database using race_id in request params
  # - initialise a new runner object
  # - get all runners for the race and order them by number
  def new
    @race = Race.find(params[:race_id])
    @runner = Runner.new
    @runners = Runner.where(race_id: @race.id).order(number: :asc)
  end

  # TODO: complete the create method, it should:
  # - get race from database using race_id in request params
  # - create N new runners using the runner params from the request. Runners should be created via a transaction block
  #   as an all or nothing operation.
  # - redirect to new_race_runner_path with a notice
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
  rescue ActiveRecord::RecordInvalid => e
    @runner = Runner.new
    @runners = Runner.where(race_id: @race.id).order(number: :asc)
    flash.now[:alert] = "Failed to create runners: #{e.message}"
    render :new, status: :unprocessable_entity
  end

  # TODO: complete the edit method, it should:
  # - get runner from database using id in request params
  # - get race from database using race_id in request params
  def edit
    @race = Race.find(params[:race_id])
    @runner = Runner.find(params[:id])
  end

  # TODO: complete the update method, it should:
  # - get runner from database using id in request params
  # - apply changes to the runner and commit to the database
  # - redirect to new_race_runner_path with a notice or failure alert
  def update
    @race = Race.find(params[:race_id])
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
      redirect_to new_race_runner_path(@race), notice: "Runner was successfully updated."
    else
      flash.now[:alert] = "Failed to update runner."
      render :edit, status: :unprocessable_entity
    end
  end

  # TODO: complete the destroy method, it should:
  # - get runner from database using id in request params (done)
  # - delete runner from database (done)
  # - redirect to new_race_runner_path with a notice (done)
  def destroy
    @race = Race.find(params[:race_id])
    @runner = Runner.find(params[:id])
    @runner.destroy

    redirect_to new_race_runner_path(@race), notice: "Runner was successfully deleted."
  end

  private

  # TODO: define a helper method for extracting runner params from the request (done)
  def runners_params
    params.fetch(:runners, []).map do |runner_params|
      ActionController::Parameters.new(runner_params).permit(:name, :program_number, :number, :trainer, :jockey)
    end
  end

  # TODO: define a helper method for extracting a single runner's params from the request (done)
  def single_runner_params
    params.require(:runner).permit(:number, :name, :card_id)
  end
end
