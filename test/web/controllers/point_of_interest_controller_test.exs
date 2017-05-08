defmodule XyInc.Web.PointOfInterestControllerTest do
  use XyInc.Web.ConnCase

  alias XyInc.Base
  alias XyInc.Base.PointOfInterest

  @create_attrs %{name: "some name", x: 42, y: 42}
  @update_attrs %{name: "some updated name", x: 43, y: 43}
  @invalid_attrs %{name: nil, x: nil, y: nil}

  def fixture(:point_of_interest) do
    {:ok, point_of_interest} = Base.create_point_of_interest(@create_attrs)
    point_of_interest
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, point_of_interest_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates point_of_interest and renders point_of_interest when data is valid", %{conn: conn} do
    conn = post conn, point_of_interest_path(conn, :create), poi: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, point_of_interest_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "name" => "some name",
      "x" => 42,
      "y" => 42}
  end

  test "does not create point_of_interest and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, point_of_interest_path(conn, :create), poi: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen point_of_interest and renders point_of_interest when data is valid", %{conn: conn} do
    %PointOfInterest{id: id} = point_of_interest = fixture(:point_of_interest)
    conn = put conn, point_of_interest_path(conn, :update, point_of_interest), poi: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, point_of_interest_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "name" => "some updated name",
      "x" => 43,
      "y" => 43}
  end

  test "does not update chosen point_of_interest and renders errors when data is invalid", %{conn: conn} do
    point_of_interest = fixture(:point_of_interest)
    conn = put conn, point_of_interest_path(conn, :update, point_of_interest), poi: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen point_of_interest", %{conn: conn} do
    point_of_interest = fixture(:point_of_interest)
    conn = delete conn, point_of_interest_path(conn, :delete, point_of_interest)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, point_of_interest_path(conn, :show, point_of_interest)
    end
  end
end
