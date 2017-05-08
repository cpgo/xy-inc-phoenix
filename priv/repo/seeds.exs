# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     XyInc.Repo.insert!(%XyInc.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


XyInc.Repo.insert!(%XyInc.Base.PointOfInterest{name: "Lanchonete", x: 27, y: 12})
XyInc.Repo.insert!(%XyInc.Base.PointOfInterest{name: "Posto", x: 31, y: 18})
XyInc.Repo.insert!(%XyInc.Base.PointOfInterest{name: "Joalheria", x: 15, y: 12})
XyInc.Repo.insert!(%XyInc.Base.PointOfInterest{name: "Pub", x: 12, y: 8})
XyInc.Repo.insert!(%XyInc.Base.PointOfInterest{name: "Supermercado", x: 23, y: 6})
XyInc.Repo.insert!(%XyInc.Base.PointOfInterest{name: "Churrascaria", x: 28, y: 2})