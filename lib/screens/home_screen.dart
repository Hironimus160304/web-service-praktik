import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'profile_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(), // Beranda
    ProductScreen(), // Produk (Merek Sepatu dan Harga)
    ProfileScreen(), // Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Sepatu'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Konten halaman beranda
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang di Toko Sepatu Kami!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Temukan sepatu favorit Anda dari berbagai merek terkenal!',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Image.network(
                  'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/395205/01/fnd/IDN/fmt/png/Sepatu-Sneaker-Suede-XL',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),

                // Tombol Lihat Produk
                CustomButton(
                  label: 'Lihat Produk',
                  icon: Icons.store,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Tombol Profil
                CustomButton(
                  label: 'Lihat Profil',
                  icon: Icons.person,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
                SizedBox(height: 30),

                // Kategori berdasarkan jenis sepatu
                Text(
                  'Kategori Sepatu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  children: [
                    CategoryItem(
                      label: 'Sneakers',
                      icon: Icons.sports_baseball,
                    ),
                    CategoryItem(
                      label: 'Boots',
                      icon: Icons.hiking,
                    ),
                    CategoryItem(
                      label: 'Sandals',
                      icon: Icons.beach_access,
                    ),
                    CategoryItem(
                      label: 'Running',
                      icon: Icons.run_circle,
                    ),
                    CategoryItem(
                      label: 'Casual',
                      icon: Icons.weekend,
                    ),
                    CategoryItem(
                      label: 'Formal',
                      icon: Icons.business,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget untuk kategori sepatu
class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aksi ketika kategori di tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Anda memilih kategori $label')),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.blueAccent, size: 30),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
