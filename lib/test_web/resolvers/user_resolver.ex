defmodule TestWeb.Resolvers.UserResolver do


  alias Test.Schemas.User
  alias Test.Schemas.Friends
  alias Test.Repo
  alias Test.Library.CommanLib
  import Ecto.Query


  def all(_, data, _) do
    IO.inspect(data)
    size = Application.get_env(:test, :page_size)
    IO.inspect(size)

    offset = ((data.page - 1) * size)
    user = User
             |> limit([_], ^size)
             |> offset([_], ^offset)
             |> order_by(desc: :id)
             |> Repo.all
    {:ok, user}
  end

  def find(_, %{id: id}, _) do
    case Repo.get(User, id) do
      nil -> {:error, "user id #{id} not found"}
      user -> {:ok, user}
    end
  end


  def insert(_,data,_)do
    IO.inspect(data)
      user_data = %{
           name:  data.name,
           email: data.email,
           mobile: data.mobile,
           city: data.city,
             friends: %{
               first_name: data.first_name,
                surname: data.surname
         }
      }

       changeset = User.changeset(%User{},user_data)
        case Repo.insert(changeset) do
          {:ok, data} -> {:ok, data}
          {:error, changeset} ->
            {
              :error,
              message: "Could not create user.",
              details: CommanLib.error_details(changeset),
            }
        end

  end

end
