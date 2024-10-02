import 'package:flutter/material.dart';
import 'package:tugasduappam/detailproduk.dart';
import 'package:tugasduappam/profile.dart';

class Homepages extends StatefulWidget {
  final String username;
  const Homepages({super.key, required this.username});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'HOMEPAGE',
          style: TextStyle(color: Colors.white), 
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(username: 'NamaPengguna'), 
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome, ${widget.username}!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _posterItem('assets/poster1.jpeg'),
                  _posterItem('assets/poster2.jpeg'),
                  _posterItem('assets/poster3.jpeg'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6, 
                itemBuilder: (context, index) {
                  return _productItem(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posterItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: 250,
        ),
      ),
    );
  }

  Widget _productItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/converse5.jpeg',
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        const Text(
          'Converse Uhuy',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, 
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Rp 1.350.000,00',
          style: TextStyle(
            fontSize: 14, 
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailProduk(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, 
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), 
            ),
          ),
          child: const Text(
            'Beli',
            style: TextStyle(color: Colors.white), 
          ),
        ),
      ],
    );
  }
}
