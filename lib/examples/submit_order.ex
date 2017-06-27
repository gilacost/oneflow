defmodule Oneflow.Examples.SubmitOrder do
  alias Oneflow.Models.{
    Order,
    Item,
    Component,
    Address,
    Carrier,
    Shipment,
    StockItem,
    Destination,
    OrderData
  }

  def send() do

    order_id = :rand.uniform(9999999999)

    try do
      # shipTo
      shipTo = %Address{
        name: "FIRST-NAME LAST-NAME",
        address1: "ADDRESS-1",
        address2: "ADDRESS-2",
        town: "CITY",
        postcode: "POSTCODE",
        isoCountry: "TWO-LETTERS-ISO-CODE",
        phone: "PHONE-NUMBER",
      }

      #carrier
      # This will change depending on your account settings
      carrier = %Carrier{
        code: "CARRIER-CODE",
        service: "CARRIER-NAME",
        alias: "CARRIER-ALIAS"
      }

      #shipment
      shipment = %Shipment{
        shipmentIndex: 0,
        attachments: [],
        shipTo: shipTo,
        carrier: carrier
      }
     #item
     # This will change depending on your account settings
      item = %Item{
        shipmentIndex: 0,
        sourceItemId: "SOURCE-ITEM-ID",
        sku: "SKU",
        quantity: 1,
        shrinkWrap: false,
        components: [
          %Component{
            code: "COMPONENT-CODE-1",
            path: "https://COMPONENT-CODE-1-URL",
            fetch: true,
            localFile: false,
          },
          %Component{
            code: "COMPONENT-CODE-1",
            path: "https://COMPONENT-CODE-2-URL",
            fetch: true,
            localFile: false,
          }
        ]
      }

      # Stock Items
      # This will change depending on your account settings
      stockItems = [
        %StockItem{
          code: "STOCK-ITEM-CODE-1",
          quantity: 1,
          shipmentIndex: 0
        },
        %StockItem{
          code: "STOCK-ITEM-CODE-2",
          quantity: 1,
          shipmentIndex: 0
        }
      ]

      #orderData
      # This will change depending on your account settings
      orderData = %OrderData{
        shipments: [shipment],
        items: [item],
        stockItems: stockItems,
        printType: "digital",
        sourceOrderId: "#{order_id}",
        email: "[help || whatever ]@COMPANY.TLD",
        amount: 0,
        customerName: "ACCOUNT-NAME",
      }

      #pendign
      #postbackAddress: "http:\/\/prelive.api.thebookofeveryone.com\/oneflow\/update",
      #postbackMethod: "http",

      #destination
      # This will change depending on your account settings
      destination = %Destination{
        name: "PRINTER-NAME"
      }

      #order
      order = Order.create_order(destination)
      put_in(order.orderData, orderData)
      |> Oneflow.submit_order
      |> IO.inspect

    rescue
      e in ArgumentError -> IO.inspect e
      e in KeyError -> IO.inspect e
    end

  end
end
