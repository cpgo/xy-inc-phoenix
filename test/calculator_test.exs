defmodule XyInc.CalculatorTest do
  alias XyInc.Base.Calculator
  use XyInc.DataCase

  test "should get the right distance between two coords" do
    coord1 = %{x: 9, y: 4}
    coord2 = %{x: 4, y: 3}
    distance = Calculator.distance(coord1, coord2)
    assert distance == 5.09902
  end

  test "list pois by proximity" do
    data = [
      %{id: 1, name: "Lanchonete", x: 27, y: 12},
      %{id: 2, name: "Posto", x: 31, y: 18},
      %{id: 3, name: "Joalheria", x: 15, y: 12},
      %{id: 4, name: "Pub", x: 12, y: 8},
      %{id: 5, name: "Supermercado", x: 23, y: 6},
      %{id: 6, name: "Churrascaria", x: 28, y: 2}
    ]
    near_pois = Calculator.by_proximity(%{x: 20, y: 10, max: 10, list: data})
    assert near_pois == [
      %{id: 1, name: "Lanchonete"}, 
      %{id: 3, name: "Joalheria"}, 
      %{id: 4, name: "Pub"}, 
      %{id: 5, name: "Supermercado"}
    ]
  end
end