import 'package:flutter/material.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Color(0xFF1B4D3E)),
            SizedBox(width: 8),
            Text(
              'Jaipur, Rajasthan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Guide or Specialty...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryItem(Icons.account_balance, 'Heritage'),
                  _buildCategoryItem(Icons.restaurant, 'Food'),
                  _buildCategoryItem(Icons.shopping_bag, 'Shopping'),
                  _buildCategoryItem(Icons.nightlife, 'Night Vibe'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 1. SLIDING MONUMENTS SECTION (Yahan Naya Added Hai)
            const HorizontalMonumentsSection(),

            const SizedBox(height: 16),

            // 2. GUIDES SECTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top Rated Local Guides',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const DynamicGuidesSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1B4D3E),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFFB8860B)),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

// Horizontal Sliding Monuments Widget
class HorizontalMonumentsSection extends StatelessWidget {
  const HorizontalMonumentsSection({Key? key}) : super(key: key);

  final List<Map<String, String>> monuments = const [
    {
      'name': 'Hawa Mahal',
      'location': 'Johari Bazaar, Jaipur',
      'image': 'https://images.unsplash.com/photo-1599661046289-e31897846e41?q=80&w=600',
    },
    {
      'name': 'Amber Fort',
      'location': 'Amer, Jaipur',
      'image': 'https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?q=80&w=600',
    },
    {
      'name': 'Jal Mahal',
      'location': 'Amer Road, Jaipur',
      'image': 'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?q=80&w=600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Explore Popular Monuments',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B4D3E),
            ),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: monuments.length,
            itemBuilder: (context, index) {
              final item = monuments[index];
              return Container(
                width: 220,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(item['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white70, size: 12),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              item['location']!,
                              style: const TextStyle(color: Colors.white70, fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Temporary Guides Placeholder (Matches Firestore/Local Data)
class DynamicGuidesSection extends StatelessWidget {
  const DynamicGuidesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFF1B4D3E),
              child: Text('R', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ramesh', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('★ 4.9 (128 reviews)', style: TextStyle(color: Colors.amber, fontSize: 12)),
                  Text('Heritage Expert', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Column(
              children: [
                const Text('₹450/hr', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B4D3E)),
                  onPressed: () {},
                  child: const Text('Book', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
