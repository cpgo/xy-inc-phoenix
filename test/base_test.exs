defmodule XyInc.BaseTest do
  use XyInc.DataCase

  alias XyInc.Base
  alias XyInc.Base.PointOfInterest

  @create_attrs %{name: "some name", x: 42, y: 42}
  @update_attrs %{name: "some updated name", x: 43, y: 43}
  @invalid_attrs %{name: nil, x: nil, y: nil}

  def fixture(:point_of_interest, attrs \\ @create_attrs) do
    {:ok, point_of_interest} = Base.create_point_of_interest(attrs)
    point_of_interest
  end

  test "list_points/1 returns all points" do
    point_of_interest = fixture(:point_of_interest)
    assert Base.list_points() == [point_of_interest]
  end

  test "get_point_of_interest! returns the point_of_interest with given id" do
    point_of_interest = fixture(:point_of_interest)
    assert Base.get_point_of_interest!(point_of_interest.id) == point_of_interest
  end

  test "create_point_of_interest/1 with valid data creates a point_of_interest" do
    assert {:ok, %PointOfInterest{} = point_of_interest} = Base.create_point_of_interest(@create_attrs)
    assert point_of_interest.name == "some name"
    assert point_of_interest.x == 42
    assert point_of_interest.y == 42
  end

  test "create_point_of_interest/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Base.create_point_of_interest(@invalid_attrs)
  end

  test "update_point_of_interest/2 with valid data updates the point_of_interest" do
    point_of_interest = fixture(:point_of_interest)
    assert {:ok, point_of_interest} = Base.update_point_of_interest(point_of_interest, @update_attrs)
    assert %PointOfInterest{} = point_of_interest
    assert point_of_interest.name == "some updated name"
    assert point_of_interest.x == 43
    assert point_of_interest.y == 43
  end

  test "update_point_of_interest/2 with invalid data returns error changeset" do
    point_of_interest = fixture(:point_of_interest)
    assert {:error, %Ecto.Changeset{}} = Base.update_point_of_interest(point_of_interest, @invalid_attrs)
    assert point_of_interest == Base.get_point_of_interest!(point_of_interest.id)
  end

  test "delete_point_of_interest/1 deletes the point_of_interest" do
    point_of_interest = fixture(:point_of_interest)
    assert {:ok, %PointOfInterest{}} = Base.delete_point_of_interest(point_of_interest)
    assert_raise Ecto.NoResultsError, fn -> Base.get_point_of_interest!(point_of_interest.id) end
  end

  test "change_point_of_interest/1 returns a point_of_interest changeset" do
    point_of_interest = fixture(:point_of_interest)
    assert %Ecto.Changeset{} = Base.change_point_of_interest(point_of_interest)
  end
end
