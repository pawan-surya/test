defmodule TestWeb.Schema do
  use Absinthe.Schema

  import_types Test.Types.UserType
  import_types Test.Types.FriendsType


  query do
    import_fields :userlist
    import_fields :friendslist

  end

  mutation  do
    import_fields :userinput
  end
end

