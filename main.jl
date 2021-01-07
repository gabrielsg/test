using DataFrames, VegaDatasets, VegaLite, Query

cars = dataset("cars")

cars |> @select(:Acceleration, :Name) |> collect

function foo(data, orgin)
   df = data |> @filter(_.Origin==orgin) |> DataFrame 

   return df |> @vlplot(:point, :Acceleration, :Miles_per_Gallon)
end

p = foo(cars, "USA")

p |> save("foo.png")