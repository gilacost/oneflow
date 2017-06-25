defmodule OneflowEx.SubmitOrderExample do
  alias OneflowEx.{
    Order,
    Item,
    Component,
    Address,
    Carrier,
    Shipment,
    OrderData
  }
  def send() do

    order_id = :rand.uniform(9999999999)
    IO.inspect "Order id: #{order_id}"
    customer_name = "CUSTOMER-NAME"
    email = "CUSTOMER-NAME"
    destination = "DESTINATION"
    order_id = order_id
    item_id = "item-#{order_id}"
    fetch_url = "FETCHURL"
    quantity = 1
    sku_code = "SKU-CODE"
    component_code = "COMPONENT-CODE" #"text"
    carrier_code = "CARRIER-CODE"
    carrier_service = "CARRIER-SERVICE"
    name = "NAME"
    address1 = "ADDRESS-1"
    address2 = "ADDRESS-2"
    town = "TOWN"
    state = "STATE"
    postcode = "POSTCODE"
    iso_country = "ISO // GB"

    order = Order.create_order(destination)
    order_data = %OrderData {
      sourceOrderId: order_id,
      email: email,
      customerName: customer_name
    }
    order = put_in(order.orderData, order_data)
    item = %Item{
      sku: sku_code,
      quantity: quantity,
      sourceItemId: item_id,
    }
    component = %Component{
      code: component_code,
      path: fetch_url,
      fetch: false,
      localFile: true
    }
    item = put_in(item.components, [ component ])
    order = put_in(order.orderData.items, [ item ])
    address = %Address{
      name: name,
      address1: address1,
      address2: address2,
      town: town,
      isoCountry: iso_country,
      postcode: postcode,
      state: state
    }
    shipment = %Shipment{
      carrier: %Carrier{
        code: carrier_code,
        service: carrier_service,
      },
      shipTo: address
    }
    order = put_in(order.orderData.shipments, [shipment])
    OneflowEx.submit_order(order) |> IO.inspect

  end
end
