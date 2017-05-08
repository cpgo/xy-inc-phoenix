defmodule XyInc.Web.ProximityListView do
  use XyInc.Web, :view
  alias XyInc.Web.ProximityListView

  def render("index.json", %{near_points: points}) do
    %{data: render_many(points, ProximityListView, "near_points.json")}
  end

  def render("show.json", %{near_points: point}) do
    %{data: render_one(point, ProximityListView, "near_points.json")}
  end

  def render("near_points.json", %{proximity_list: point}) do
    %{
      id: point.id,
      name: point.name,
    }
  end
end