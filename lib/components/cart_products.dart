import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var products_on_the_cart = [
    {
      "name": "Blazer One",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Blazer Two",
      "picture": "images/products/blazer2.jpeg",
      "price": 55,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Dress One",
      "picture": "images/products/dress1.jpeg",
      "price": 45,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Dress Two",
      "picture": "images/products/dress2.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Hills One",
      "picture": "images/products/hills1.jpeg",
      "price": 75,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Hills Two",
      "picture": "images/products/hills2.jpeg",
      "price": 89,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Pants One",
      "picture": "images/products/pants1.jpg",
      "price": 65,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Pants Two",
      "picture": "images/products/pants2.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Shoe One",
      "picture": "images/products/shoe1.jpg",
      "price": 125,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
    {
      "name": "Skirt One",
      "picture": "images/products/skt1.jpeg",
      "price": 75,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_prod_name: products_on_the_cart[index]["name"],
          cart_prod_picture: products_on_the_cart[index]["picture"],
          cart_prod_price: products_on_the_cart[index]["price"],
          cart_prod_size: products_on_the_cart[index]["size"],
          cart_prod_color: products_on_the_cart[index]["color"],
          cart_prod_qty: products_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        // ==== LEADING SECTION WITH IMAGE =====
        leading: Image.asset(
          cart_prod_picture,
          width: 80.0,
          height: 80.0,
        ),
        // ==== TITLE SECTION ====
        title: new Text(cart_prod_name),
        // ==== SUBTITLE SECTION ====
        subtitle: new Column(
          children: <Widget>[
            // Creating a Row Widget inside of a Column
            new Row(
              children: <Widget>[
                // This section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                // This section is for the color of the product
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            // This is the section for the price of the product
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        trailing: new SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () {},
              ),
              new Text(
                "${cart_prod_qty}",
                style: TextStyle(fontSize: 12.0),
              ),
              new IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
