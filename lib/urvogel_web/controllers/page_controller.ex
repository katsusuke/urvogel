defmodule UrvogelWeb.PageController do
  use UrvogelWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
