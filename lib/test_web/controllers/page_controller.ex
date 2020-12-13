defmodule TestWeb.PageController do
  use TestWeb, :controller

  def index(conn, _params) do  end
    render(conn, "index.html")
  end
end
