defmodule XyInc.Web.Router do
  use XyInc.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", XyInc.Web do
    pipe_through :api
  end
end
