defmodule UrvogelWeb.InstanceController do
  use UrvogelWeb, :controller

  alias Urvogel.UrvogelWeb
  alias Urvogel.UrvogelWeb.Instance

  def index(conn, _params) do
    instances = UrvogelWeb.list_instances()
    render(conn, "index.html", instances: instances)
  end

  def new(conn, _params) do
    changeset = UrvogelWeb.change_instance(%Instance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"instance" => instance_params}) do
    case UrvogelWeb.create_instance(instance_params) do
      {:ok, instance} ->
        conn
        |> put_flash(:info, "Instance created successfully.")
        |> redirect(to: instance_path(conn, :show, instance))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    instance = UrvogelWeb.get_instance!(id)
    render(conn, "show.html", instance: instance)
  end

  def edit(conn, %{"id" => id}) do
    instance = UrvogelWeb.get_instance!(id)
    changeset = UrvogelWeb.change_instance(instance)
    render(conn, "edit.html", instance: instance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "instance" => instance_params}) do
    instance = UrvogelWeb.get_instance!(id)

    case UrvogelWeb.update_instance(instance, instance_params) do
      {:ok, instance} ->
        conn
        |> put_flash(:info, "Instance updated successfully.")
        |> redirect(to: instance_path(conn, :show, instance))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", instance: instance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    instance = UrvogelWeb.get_instance!(id)
    {:ok, _instance} = UrvogelWeb.delete_instance(instance)

    conn
    |> put_flash(:info, "Instance deleted successfully.")
    |> redirect(to: instance_path(conn, :index))
  end
end
