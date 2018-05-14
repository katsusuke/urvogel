defmodule Urvogel.UrvogelWeb.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :access_token, :string
    field :access_token_secret, :string
    field :domain, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :domain, :access_token, :access_token_secret])
    |> validate_required([:username, :domain, :access_token, :access_token_secret])
  end
end
