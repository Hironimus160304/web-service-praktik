import 'package:flutter/material.dart';

class ShoeItem extends StatelessWidget {
  final String brand;
  final String price;
  final String imageUrl;

  const ShoeItem({
    required this.brand,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(imageUrl, fit: BoxFit.cover, width: 60),
        title: Text(brand, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Harga: $price'),
        trailing: Icon(Icons.shopping_cart, color: Colors.blueAccent),
      ),
    );
  }
}
