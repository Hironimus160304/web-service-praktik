import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  // Data produk sepatu, bisa ditambah sesuai kebutuhan
  final List<Map<String, String>> products = [
    {
      'name': 'Nike Air Max',
      'price': '\$120',
      'imageUrl': 'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/d7yyh7rta3tkye7kdyka/NIKE+AIR+MAX+97.png',
    },
    {
      'name': 'Adidas Ultraboost',
      'price': '\$150',
      'imageUrl': 'https://cdn-images.farfetch-contents.com/18/86/15/72/18861572_40911194_322.jpg',
    },
    {
      'name': 'Puma Suede',
      'price': '\$90',
      'imageUrl': 'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_450,h_450/global/398424/01/sv01/fnd/IDN/fmt/png',
    },
    {
      'name': 'Converse All Star',
      'price': '\$80',
      'imageUrl': 'https://www.converse.id/media/catalog/product/c/o/conm9160c-a.jpeg',
    },
    {
      'name': 'Reebok Classic',
      'price': '\$100',
      'imageUrl': 'https://www.reebok.id/cdn/shop/files/0888-REEC00074340-1.jpg?v=1719309079',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Sepatu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom pada grid
            crossAxisSpacing: 10.0, // Jarak horizontal antar grid
            mainAxisSpacing: 10.0,  // Jarak vertikal antar grid
            childAspectRatio: 0.75, // Rasio tinggi ke lebar item grid
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 5, // Shadow pada card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      product['imageUrl']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    product['price']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
