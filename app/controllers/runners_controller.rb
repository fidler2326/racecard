class RunnersController < ApplicationController

  # TODO: complete the index method, it should:
  # - get all runners for today (done)
  # - order runners by card_id and number in ascending order (done)
  # - if no runners today, redirect to root_path with an alert (done)
  def index
    @runners = Runner.joins(:card).where(card: {race_date: Date.today}).order(:card_id, :number)
    if @runners.empty?
      redirect_to root_path
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
    @runner = new Runner()
    @runners = Runner.all().order(number: :asc)
  end

  # TODO: complete the create method, it should:
  # - get race from database using race_id in request params
  # - create N new runners using the runner params from the request. Runners should be created via a transaction block
  #   as an all or nothing operation.
  # - redirect to new_race_runner_path with a notice
  def create
    @race = Race.find(params[:race_id])

  end

  # TODO: complete the edit method, it should:
  # - get runner from database using id in request params
  # - get race from database using race_id in request params
  def edit
  end

  # TODO: complete the update method, it should:
  # - get runner from database using id in request params
  # - apply changes to the runner and commit to the database
  # - redirect to new_race_runner_path with a notice or failure alert
  def update
  end

  # TODO: complete the destroy method, it should:
  # - get runner from database using id in request params
  # - delete runner from database
  # - redirect to new_race_runner_path with a notice
  def destroy
  end

  private

  # TODO: define a helper method for extracting runner params from the request
  def runners_params
  end

  # TODO: define a helper method for extracting a single runner's params from the request
  def single_runner_params
  end
end