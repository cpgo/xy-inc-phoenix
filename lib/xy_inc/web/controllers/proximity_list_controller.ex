defmodule XyInc.Web.ProximityListController do
  use XyInc.Web, :controller

  alias XyInc.Base.Calculator

  action_fallback XyInc.Web.FallbackController

  def index(conn, %{"x" => x, "y" => y}) do
    pois = XyInc.Base.list_points()
    near_points = Calculator.by_proximity(%{x: x, y: y, max: 10, list: pois})
    render(conn, "index.json", near_points: near_points)
  end

end