defmodule XyInc.Base do
  @moduledoc """
  The boundary for the Base system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias XyInc.Repo

  alias XyInc.Base.PointOfInterest

  @doc """
  Returns the list of points.

  ## Examples

      iex> list_points()
      [%PointOfInterest{}, ...]

  """
  def list_points do
    Repo.all(PointOfInterest)
  end

  @doc """
  Gets a single point_of_interest.

  Raises `Ecto.NoResultsError` if the Point of interest does not exist.

  ## Examples

      iex> get_point_of_interest!(123)
      %PointOfInterest{}

      iex> get_point_of_interest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_point_of_interest!(id), do: Repo.get!(PointOfInterest, id)

  @doc """
  Creates a point_of_interest.

  ## Examples

      iex> create_point_of_interest(%{field: value})
      {:ok, %PointOfInterest{}}

      iex> create_point_of_interest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_point_of_interest(attrs \\ %{}) do
    %PointOfInterest{}
    |> point_of_interest_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a point_of_interest.

  ## Examples

      iex> update_point_of_interest(point_of_interest, %{field: new_value})
      {:ok, %PointOfInterest{}}

      iex> update_point_of_interest(point_of_interest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_point_of_interest(%PointOfInterest{} = point_of_interest, attrs) do
    point_of_interest
    |> point_of_interest_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PointOfInterest.

  ## Examples

      iex> delete_point_of_interest(point_of_interest)
      {:ok, %PointOfInterest{}}

      iex> delete_point_of_interest(point_of_interest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_point_of_interest(%PointOfInterest{} = point_of_interest) do
    Repo.delete(point_of_interest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking point_of_interest changes.

  ## Examples

      iex> change_point_of_interest(point_of_interest)
      %Ecto.Changeset{source: %PointOfInterest{}}

  """
  def change_point_of_interest(%PointOfInterest{} = point_of_interest) do
    point_of_interest_changeset(point_of_interest, %{})
  end

  defp point_of_interest_changeset(%PointOfInterest{} = point_of_interest, attrs) do
    point_of_interest
    |> cast(attrs, [:name, :x, :y])
    |> validate_required([:name, :x, :y])
    # |> validate_number(:x, greater_than: 0)
    # |> validate_number(:y, greater_than: 0)
  end
end
