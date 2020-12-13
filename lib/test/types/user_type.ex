defmodule Test.Types.UserType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias TestWeb.Resolvers
  alias TestWeb.Resolvers

  use Absinthe.Ecto, repo: Test.Repo
  object :userlist do

    field :users, list_of(:users) do
      arg :page, :integer
      resolve (&Resolvers.UserResolver.all/3)
      {:ok, Repo.all(User)}
    end

    field :user, type: :users do
      arg :id, non_null(:id)
      resolve(&Resolvers.UserResolver.find/3)
    end
  end

  object :userinput do

    field :create_user, type: :users do

      arg :name, non_null(:string)
      arg :email, :string
      arg :mobile, :string
      arg :city, :string
      arg :surname, :string
      arg :first_name, :string
      resolve &Resolvers.UserResolver.insert/3
    end
  end

  @desc "single party object"
  object :users do
    @desc "id of user"
    field(:id, :id)

    @desc "type of party"
    field(:name, :string)

    @desc "email of user"
    field(:email, :string)

    @desc "mobile of user"
    field(:mobile, :string)

    @desc "city of user"
    field(:city, :string)

    @desc "inserted_at of user"
    field(:inserted_at, :string)

    @desc "updated_at of user"
    field(:updated_at, :string)

    field :friends, list_of(:friend), resolve: assoc(:friends)
  end


end
