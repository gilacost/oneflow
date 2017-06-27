# Oneflow

## Installation

The package can be installed
by adding `oneflow` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:oneflow, git: "https://github.com/gilacost/oneflow.git"}]
end
```


## Configuration

```elixir
config :oneflow,
  token: "TOKEN",
  secret: "SECRET",
  log: true,
  endpoint: "https://API-URL/api",
  http: [] # these will be passed to hackney
```


## Usage


### Basic examples

```elixir
{:ok, order} = Onefelow.get("/order/ORDER-ID")
{:ok, result} = Onefelow.search("query", "shipments", ["status:shipped])
```

## Safety net

To be sure that the required fields are set before placing an order,
Surround any structs creation that you implement with a try catch like this:


```elixir
try do
   %Oneflow.Destination{ name: "awesomePrinter" }
 ....
rescue
   e in ArgumentError -> IO.inspect e
   e in KeyError -> IO.inspect e
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/oneflow](https://hexdocs.pm/oneflow).
