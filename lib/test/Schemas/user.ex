defmodule Test.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :city, :string
    field :mobile, :string

    has_many :friends, Test.Schemas.Friends

    timestamps()
  end

  def changeset(user, attrs)do
    user
    |> cast(attrs,
         [ :name,
           :email,
           :city,
           :mobile
         ])
    |> validate_required(
         [
           :name,
           :email,
           :city,
           :mobile
         ])
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:friends, [Test.Schemas.Friends.changeset(%Test.Schemas.Friends{}, attrs.friends)])
  end
end
