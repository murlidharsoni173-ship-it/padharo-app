import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> _spots = const [
    {
      'title': 'Amer Fort',
      'location': 'Devisinghpura, Amer',
      'rating': '4.8 (12k+ reviews)',
      'category': 'Heritage',
      'desc': 'Famous hilltop fort with majestic gates, courtyard and the iconic Sheesh Mahal.',
    },
    {
      'title': 'Hawa Mahal',
      'location': 'Badi Choupad, Old City',
      'rating': '4.7 (10k+ reviews)',
      'category': 'Heritage',
      'desc': 'Palace of Winds made with pink sandstone, features 953 small windows (Jharokhas).',
    },
    {
      'title': 'Jal Mahal',
      'location': 'Man Sagar Lake, Jaipur',
      'rating': '4.6 (8k+ reviews)',
      'category': 'Nature & View',
      'desc': 'A breathtaking palace floating in the middle of Man Sagar Lake.',
    },
    {
      'title': 'Johari Bazaar',
      'location': 'Johari Bazar Road, Pink City',
      'rating': '4.5 (6k+ reviews)',
      'category': 'Shopping',
      'desc': 'World-famous market for authentic Jaipuri jewellery, lehengas, and handicrafts.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Explore Jaipur Spots',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _spots.length,
        itemBuilder: (context, index) {
          final spot = _spots[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      spot['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F251F),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        spot['category']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF1B4D3E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Color(0xFF1B4D3E)),
                    const SizedBox(width: 4),
                    Text(
                      spot['location']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  spot['desc']!,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          spot['rating']!,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Guides available for ${spot['title']}')),
                        );
                      },
                      child: const Text(
                        'Find Guides',
                        style: TextStyle(color: Color(0xFF1B4D3E), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
