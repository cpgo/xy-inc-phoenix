defmodule XyInc.Web.Router do
  use XyInc.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", XyInc.Web do
    pipe_through :api
    resources "/points", PointOfInterestController, except: [:new, :edit]
    get "/near", ProximityListController, :index
  end
end
