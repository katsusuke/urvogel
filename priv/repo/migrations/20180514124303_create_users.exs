defmodule Urvogel.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :domain, :string
      add :access_token, :string
      add :access_token_secret, :string

      timestamps()
    end

  end
end
