defmodule TestWeb.Router do
  use TestWeb, :router

#  pipeline :api do
#    plug :accepts, ["json"]
#  end
#
#  scope "/api", TestWeb do
#    pipe_through :api
#  end
  pipeline :api do
    plug :accepts, ["json"]

  end


  scope "/" do
    pipe_through [:api]
    forward "/api", Absinthe.Plug,
            schema: TestWeb.Schema
  end

  forward "/graphiql",
          Absinthe.Plug.GraphiQL,
          schema: TestWeb.Schema

end
