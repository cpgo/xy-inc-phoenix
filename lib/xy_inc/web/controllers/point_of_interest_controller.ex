defmodule XyInc.Web.PointOfInterestController do
  use XyInc.Web, :controller

  alias XyInc.Base
  alias XyInc.Base.PointOfInterest

  action_fallback XyInc.Web.FallbackController

  def index(conn, _params) do
    points = Base.list_points()
    render(conn, "index.json", points: points)
  end

  def create(conn, %{"poi" => point_of_interest_params}) do
    with {:ok, %PointOfInterest{} = point_of_interest} <- Base.create_point_of_interest(point_of_interest_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", point_of_interest_path(conn, :show, point_of_interest))
      |> render("show.json", point_of_interest: point_of_interest)
    end
  end

  def show(conn, %{"id" => id}) do
    point_of_interest = Base.get_point_of_interest!(id)
    render(conn, "show.json", point_of_interest: point_of_interest)
  end

  def update(conn, %{"id" => id, "poi" => point_of_interest_params}) do
    point_of_interest = Base.get_point_of_interest!(id)

    with {:ok, %PointOfInterest{} = point_of_interest} <- Base.update_point_of_interest(point_of_interest, point_of_interest_params) do
      render(conn, "show.json", point_of_interest: point_of_interest)
    end
  end

  def delete(conn, %{"id" => id}) do
    point_of_interest = Base.get_point_of_interest!(id)
    with {:ok, %PointOfInterest{}} <- Base.delete_point_of_interest(point_of_interest) do
      send_resp(conn, :no_content, "")
    end
  end
end
