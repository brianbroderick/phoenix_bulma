defmodule PhoenixBulmaWeb.PageController do
  use PhoenixBulmaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
