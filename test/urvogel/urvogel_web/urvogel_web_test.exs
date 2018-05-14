defmodule Urvogel.UrvogelWebTest do
  use Urvogel.DataCase

  alias Urvogel.UrvogelWeb

  describe "users" do
    alias Urvogel.UrvogelWeb.User

    @valid_attrs %{access_token: "some access_token", access_token_secret: "some access_token_secret", domain: "some domain", username: "some username"}
    @update_attrs %{access_token: "some updated access_token", access_token_secret: "some updated access_token_secret", domain: "some updated domain", username: "some updated username"}
    @invalid_attrs %{access_token: nil, access_token_secret: nil, domain: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UrvogelWeb.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert UrvogelWeb.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert UrvogelWeb.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = UrvogelWeb.create_user(@valid_attrs)
      assert user.access_token == "some access_token"
      assert user.access_token_secret == "some access_token_secret"
      assert user.domain == "some domain"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UrvogelWeb.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = UrvogelWeb.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.access_token == "some updated access_token"
      assert user.access_token_secret == "some updated access_token_secret"
      assert user.domain == "some updated domain"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = UrvogelWeb.update_user(user, @invalid_attrs)
      assert user == UrvogelWeb.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = UrvogelWeb.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> UrvogelWeb.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = UrvogelWeb.change_user(user)
    end
  end

  describe "instances" do
    alias Urvogel.UrvogelWeb.Instance

    @valid_attrs %{client_id: "some client_id", client_secret: "some client_secret", host: "some host"}
    @update_attrs %{client_id: "some updated client_id", client_secret: "some updated client_secret", host: "some updated host"}
    @invalid_attrs %{client_id: nil, client_secret: nil, host: nil}

    def instance_fixture(attrs \\ %{}) do
      {:ok, instance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UrvogelWeb.create_instance()

      instance
    end

    test "list_instances/0 returns all instances" do
      instance = instance_fixture()
      assert UrvogelWeb.list_instances() == [instance]
    end

    test "get_instance!/1 returns the instance with given id" do
      instance = instance_fixture()
      assert UrvogelWeb.get_instance!(instance.id) == instance
    end

    test "create_instance/1 with valid data creates a instance" do
      assert {:ok, %Instance{} = instance} = UrvogelWeb.create_instance(@valid_attrs)
      assert instance.client_id == "some client_id"
      assert instance.client_secret == "some client_secret"
      assert instance.host == "some host"
    end

    test "create_instance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UrvogelWeb.create_instance(@invalid_attrs)
    end

    test "update_instance/2 with valid data updates the instance" do
      instance = instance_fixture()
      assert {:ok, instance} = UrvogelWeb.update_instance(instance, @update_attrs)
      assert %Instance{} = instance
      assert instance.client_id == "some updated client_id"
      assert instance.client_secret == "some updated client_secret"
      assert instance.host == "some updated host"
    end

    test "update_instance/2 with invalid data returns error changeset" do
      instance = instance_fixture()
      assert {:error, %Ecto.Changeset{}} = UrvogelWeb.update_instance(instance, @invalid_attrs)
      assert instance == UrvogelWeb.get_instance!(instance.id)
    end

    test "delete_instance/1 deletes the instance" do
      instance = instance_fixture()
      assert {:ok, %Instance{}} = UrvogelWeb.delete_instance(instance)
      assert_raise Ecto.NoResultsError, fn -> UrvogelWeb.get_instance!(instance.id) end
    end

    test "change_instance/1 returns a instance changeset" do
      instance = instance_fixture()
      assert %Ecto.Changeset{} = UrvogelWeb.change_instance(instance)
    end
  end
end
