defmodule Test.Types.FriendsType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  use Absinthe.Ecto, repo: Test.Repo
  alias TestWeb.Resolvers


  object :friendslist do
    field :friends, list_of(:friend) do
      arg :type, non_null(:string)
      arg :page, non_null(:integer)
      resolve &Resolvers.FriendResolver.all/3
    end
      field :friend,  type: :friends  do
        arg :user_id, non_null(:integer)
        resolve(&Resolvers.FriendResolver.find/3)
      end

    field :friendview,  type: :friend do
      arg :id, non_null(:integer)
      resolve(&Resolvers.FriendResolver.friendview/3)
    end
  end
  @desc "single party object"
  object :friends  do
    @desc "id of user"
    field(:id, :id)
    @desc "user_id of user"
    field(:user_id, :integer)
    @desc "type of party"
    field(:first_name, :string)
    @desc "surname of user"
    field(:surname, :string)
  end


  @desc "list of  friend"
  object :friend do
    @desc "id of user"
    field(:id, :id)

    @desc "user_id of user"
    field(:user_id, :integer)

    @desc "type of party"
    field(:first_name, :string)

    @desc "surname of user"
    field(:surname, :string)

#    field :users, list_of(:users), resolve: assoc(:users)
  end
#

end
