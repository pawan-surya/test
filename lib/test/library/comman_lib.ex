defmodule Test.Library.CommanLib do
  alias Schx.Repo
  import Ecto.Query

  def error_details(changeset) do
    IO.inspect("nkdikdkij")
    IO.inspect changeset
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end

end
