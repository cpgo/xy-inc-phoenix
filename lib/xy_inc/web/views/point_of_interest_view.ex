defmodule XyInc.Web.PointOfInterestView do
  use XyInc.Web, :view
  alias XyInc.Web.PointOfInterestView

  def render("index.json", %{points: points}) do
    %{data: render_many(points, PointOfInterestView, "point_of_interest.json")}
  end

  def render("show.json", %{point_of_interest: point_of_interest}) do
    %{data: render_one(point_of_interest, PointOfInterestView, "point_of_interest.json")}
  end

  def render("point_of_interest.json", %{point_of_interest: point_of_interest}) do
    %{id: point_of_interest.id,
      name: point_of_interest.name,
      x: point_of_interest.x,
      y: point_of_interest.y}
  end
end
