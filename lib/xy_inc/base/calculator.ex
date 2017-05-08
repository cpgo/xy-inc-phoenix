defmodule XyInc.Base.Calculator do
  def distance(%{x: x, y: y}, %{x: x2, y: y2}) do
    :math.sqrt( :math.pow(x - x2, 2)  + :math.pow(y - y2, 2))
    |> Float.ceil(5)
  end

  def by_proximity(%{x: x, y: y, max: max, list: list}) do
    list
      |> Enum.map(fn e -> 
          %{id: e.id, name: e.name, distance: distance(%{x: e.x, y: e.y}, %{x: x, y: y})}
        end)
      |> Enum.reject(fn(e) -> e.distance >= max end)
      |> Enum.map(fn(e) -> %{id: e.id, name: e.name} end)
  end
end
