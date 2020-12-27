import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer One",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer Two",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 55,
    },
    {
      "name": "Dress One",
      "picture": "images/products/dress1.jpeg",
      "old_price": 90,
      "price": 45,
    },
    {
      "name": "Dress Two",
      "picture": "images/products/dress2.jpeg",
      "old_price": 150,
      "price": 85,
    },
    {
      "name": "Hills One",
      "picture": "images/products/hills1.jpeg",
      "old_price": 130,
      "price": 75,
    },
    {
      "name": "Hills Two",
      "picture": "images/products/hills2.jpeg",
      "old_price": 140,
      "price": 89,
    },
    {
      "name": "Pants One",
      "picture": "images/products/pants1.jpg",
      "old_price": 100,
      "price": 65,
    },
    {
      "name": "Pants Two",
      "picture": "images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Shoe One",
      "picture": "images/products/shoe1.jpg",
      "old_price": 170,
      "price": 125,
    },
    {
      "name": "Skirt One",
      "picture": "images/products/skt1.jpeg",
      "old_price": 110,
      "price": 75,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.black54,
                child: ListTile(
                  leading: Text(prod_name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  title: Text(
                    "\$$prod_price",
                    style: TextStyle(
                        color: Colors.red[100], fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "\$$prod_old_price",
                    style: TextStyle(
                        color: Colors.red[100],
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
