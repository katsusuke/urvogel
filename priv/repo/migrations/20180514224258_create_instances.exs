defmodule Urvogel.Repo.Migrations.CreateInstances do
  use Ecto.Migration

  def change do
    create table(:instances) do
      add :host, :string
      add :client_id, :string
      add :client_secret, :string

      timestamps()
    end

  end
end
