defmodule XyInc.Repo.Migrations.CreateXyInc.Base.PointOfInterest do
  use Ecto.Migration

  def change do
    create table(:base_points) do
      add :name, :string
      add :x, :integer
      add :y, :integer

      timestamps()
    end

  end
end
