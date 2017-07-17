# Oneflow

[![Build Status](https://travis-ci.org/gilacost/oneflow.svg?branch=master)](https://travis-ci.org/gilacost/oneflow)
[![Hex package version](https://img.shields.io/hexpm/v/oneflow.svg)](https://hexdocs.pm/oneflow/api-reference.html)
[![Coverage Status](https://coveralls.io/repos/github/gilacost/oneflow/badge.svg?branch=master)](https://coveralls.io/github/gilacost/oneflow?branch=master)

The docs can be found at [https://hexdocs.pm/oneflow](https://hexdocs.pm/oneflow).

## Installation

The package can be installed
by adding `oneflow` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:oneflow, "~> 0.1.2"}]
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

## Useful endpoints

- /shipping-method
- /sku
