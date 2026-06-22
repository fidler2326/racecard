class RunnersController < ApplicationControllerRace

  # TODO: complete the index method, it should:
  # - get all runners for today
  # - order runners by card_id and number in ascending order
  # - if no runners today, redirect to root_path with an alert
  def index
  end

  # TODO: complete the show method, it should:
  # - get runner from database using id in request params
  # - get race from database using race_id in request params
  def show
  end

  # TODO: complete the new method, it should:
  # - get race from database using race_id in request params
  # - initialise a new runner object
  # - get all runners for the race and order them by number
  def new
  end

  # TODO: complete the create method, it should:
  # - get race from database using race_id in request params
  # - create N new runners using the runner params from the request. Runners should be created via a transaction block
  #   as an all or nothing operation.
  # - redirect to new_race_runner_path with a notice
  def create
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