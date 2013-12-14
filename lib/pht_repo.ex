defmodule Pht.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  @doc "The URL to reach the database."
  def url, do: "ecto://postgres:postgres@localhost/pht"

  @doc "The priv directory to load migrations and metadata."
  def priv do
    app_dir(:pht_dynamo, "priv/pht_repo")
  end
end
