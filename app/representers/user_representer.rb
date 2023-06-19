# frozen_string_literal: true

# UserRepresenter is responsible for representing a User object as JSON.
class UserRepresenter
  # Initializes a new instance of UserRepresenter.
  def initialize(user)
    @user = user
  end

  # Converts the User object to a JSON hash representation.
  def as_json
    {
      id: @user.id,
      email: @user.email
    }
  end

  private

  attr_reader :users
end
