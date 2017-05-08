defmodule XyInc.Web.ProximityListController do
  use XyInc.Web, :controller

  alias XyInc.Base.Calculator

  action_fallback XyInc.Web.FallbackController

  def index(conn, %{"coords" => %{"x" => x, "y" => y, "max" => max}}) do
    pois = XyInc.Base.list_points()
    near_points = Calculator.by_proximity(%{x: String.to_integer(x), y: String.to_integer(y), max: String.to_integer(max), list: pois})
    render(conn, "index.json", near_points: near_points)
  end

end
