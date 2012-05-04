class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def index
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end

  def show
  end
end 