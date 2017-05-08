defmodule XyInc.Base.PointOfInterest do
  use Ecto.Schema

  schema "base_points" do
    field :name, :string
    field :x, :integer
    field :y, :integer

    timestamps()
  end
end
