defmodule Test.Schemas.Friends do
  use Ecto.Schema
  import Ecto.Changeset

  schema "friends" do
    field :first_name, :string
    field :surname, :string

    belongs_to :user, Test.Schemas.User

    timestamps()
  end

def changeset(friends, attrs)do
    friends
  |>cast(attrs,
      [
        :first_name,
        :surname,
        :user_id
      ])
  |>validate_required(
      [
        :first_name,
        :surname
      ])
  end
end
