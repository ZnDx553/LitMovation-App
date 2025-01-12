import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SHOP')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildUserInfo(),
            const SizedBox(height: 20),
            Expanded(child: _buildItemList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserInfoWithAvatar(
            avatarUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
            trophyCount: '29',
          ),
          UserInfoStatsCombined(flashValue: '90', poinPembelian: '110'),
        ],
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            _showItemDetails(context, 'Casual Streak Protection');
          },
          child: const ItemCard(
            title: 'Casual Streak Protection',
            owned: '3',
            description:
                'Memberikan perlindungan rank bagi pemain dalam ranked competition sebanyak 2 kali pertandingan.',
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            width: 233,
            height: 233,
          ),
        ),
        GestureDetector(
          onTap: () {
            _showItemDetails(context, 'Domino Streak Points');
          },
          child: const ItemCard(
            title: 'Domino Streak Points',
            owned: '2',
            description:
                'Memberikan perlindungan untuk 3 pertandingan. Pass ini memberikan fleksibilitas lebih besar, sehingga anda dapat bermain lebih nyaman tanpa khawatir rank anda turun selama 3 pertandingan.',
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            width: 233,
            height: 233,
          ),
        ),
        GestureDetector(
          onTap: () {
            _showItemDetails(context, 'Domino Streak Points');
          },
          child: const ItemCard(
            title: 'Urban Streak Points',
            owned: '2',
            description:
                'Memberikan perlindungan untuk 5 pertandingan, Ini adalah opsi terbaik untuk anda yang sering, bermain dalam mode kompetitif, memberikan anda perlindungan tambahan agar rank tetap terjaga dalam 5 pertandingan.',
            image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            width: 233,
            height: 233,
          ),
        ),
      ],
    );
  }

  void _showItemDetails(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(itemName),
          content: Text('Apakah anda yakin ingin membeli $itemName?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class UserInfoWithAvatar extends StatelessWidget {
  final String avatarUrl;
  final String trophyCount;

  const UserInfoWithAvatar(
      {super.key, required this.avatarUrl, required this.trophyCount});

  @override
  Widget build(BuildContext context) {
    return _buildUserInfoCard(
      child: Row(
        children: [
          CircleAvatar(radius: 25, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 5),
          UserInfoStatsCombined.buildStatIcon(
              Icons.emoji_events, trophyCount, Colors.yellow),
        ],
      ),
    );
  }
}

class UserInfoStatsCombined extends StatelessWidget {
  final String flashValue;
  final String poinPembelian;

  const UserInfoStatsCombined(
      {super.key, required this.flashValue, required this.poinPembelian});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStatIcon(Icons.flash_on, flashValue, Colors.blue),
        const SizedBox(width: 10),
        buildStatIcon(Icons.star, poinPembelian, Colors.orange),
      ],
    );
  }

  static Widget buildStatIcon(IconData icon, String value, Color iconColor) {
    return _buildUserInfoCard(
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(width: 5),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String owned;
  final String description;
  final ImageProvider image;
  final double width;
  final double height;

  const ItemCard({super.key, 
    required this.title,
    required this.owned,
    required this.description,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 2), // Blue outline
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Owned: $owned',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Center(
            child: Image(
              image: image,
              width: width, // Resizable width
              height: height, // Resizable height
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

Widget _buildUserInfoCard({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        color: Colors.brown[600], borderRadius: BorderRadius.circular(10)),
    child: child,
  );
}