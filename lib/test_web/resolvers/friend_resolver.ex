defmodule TestWeb.Resolvers.FriendResolver do
  alias Test.Schemas.User
  alias Test.Schemas.Friends
  alias Test.Repo
  import Ecto.Query


  def all(_, filters, info) do
    IO.inspect(filters.name)
    IO.inspect("friend")
    user = (from a in Friends,
                 where: like(a.name, ^"%#{filters.name}%"),
                 select: %{
                   id: a.id,
                   name: a.name,
                   surname: a.email,
                   inserted_at: a.inserted_at,
                   updated_at: a.updated_at
                 })
           |> Repo.all
    {:ok, user}
  end

  def find(_, %{user_id: user_id}, _) do
    case Repo.get_by(Friends, user_id:  user_id) do
      nil -> {:error, "friend id #{user_id} not found"}
      address -> {:ok, address}
    end
  end


  def friendview(_,%{id: id}, _info)do
     case Repo.get(Friends,id) do
       nil -> {:error, "friend id #{id} not found"}
       friend -> {:ok, friend}
     end
  end

end
