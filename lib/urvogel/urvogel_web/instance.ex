defmodule Urvogel.UrvogelWeb.Instance do
  use Ecto.Schema
  import Ecto.Changeset


  schema "instances" do
    field :client_id, :string
    field :client_secret, :string
    field :host, :string

    timestamps()
  end

  @doc false
  def changeset(instance, attrs) do
    instance
    |> cast(attrs, [:host, :client_id, :client_secret])
    |> validate_required([:host, :client_id, :client_secret])
  end
end
