# Oneflow

[![Build Status](https://travis-ci.org/gilacost/oneflow.svg?branch=master)](https://travis-ci.org/sticksnleaves/oneflow)
<!-- [![Coverage Status](https://coveralls.io/repos/github/gilacost/oneflow/badge.svg?branch=master)](https://coveralls.io/github/gilacost/oneflow?branch=master) -->

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

## Todo
 - [] ensure first char of string is / for any path

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/oneflow](https://hexdocs.pm/oneflow).
