import 'package:flutter/material.dart';
import 'guide_detail_screen.dart';
import 'profile_screen.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allGuides = [
    {
      'name': 'Ramesh',
      'rating': '4.9',
      'reviews': '(128 Reviews)',
      'specialty': 'Heritage Expert',
      'category': 'Heritage',
      'price': '₹450/hr',
    },
    {
      'name': 'Priya',
      'rating': '4.8',
      'reviews': '(98 Reviews)',
      'specialty': 'Local Markets',
      'category': 'Shopping',
      'price': '₹400/hr',
    },
    {
      'name': 'Vikram',
      'rating': '4.7',
      'reviews': '(85 Reviews)',
      'specialty': 'Street Food Guru',
      'category': 'Food',
      'price': '₹350/hr',
    },
    {
      'name': 'Neha',
      'rating': '4.9',
      'reviews': '(112 Reviews)',
      'specialty': 'Nightlife Guide',
      'category': 'Night Vibe',
      'price': '₹500/hr',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredGuides = _allGuides.where((guide) {
      bool matchesCategory = _selectedCategory == 'All' || guide['category'] == _selectedCategory;
      bool matchesSearch = guide['name']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                           guide['specialty']!.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Color(0xFF1B4D3E)),
            SizedBox(width: 8),
            Text(
              'Jaipur, Rajasthan',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search Guide or Specialty...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryItem(Icons.account_balance, 'Heritage'),
                _buildCategoryItem(Icons.restaurant, 'Food'),
                _buildCategoryItem(Icons.shopping_bag, 'Shopping'),
                _buildCategoryItem(Icons.nightlife, 'Night Vibe'),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Rated Local Guides',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F251F)),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategory = 'All';
                      _searchController.clear();
                      _searchQuery = '';
                    });
                  },
                  child: const Text('View All', style: TextStyle(color: Color(0xFF1B4D3E), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (filteredGuides.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Center(
                  child: Text(
                    'No guides found!',
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            else
              ...filteredGuides.map((guide) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GuideCard(
                    name: guide['name']!,
                    rating: guide['rating']!,
                    reviews: guide['reviews']!,
                    specialty: guide['specialty']!,
                    price: guide['price']!,
                  ),
                );
              }).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF1B4D3E),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
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
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = isSelected ? 'All' : label;
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1B4D3E) : const Color(0xFFFFF8E7),
              borderRadius: BorderRadius.circular(16),
              border: isSelected ? Border.all(color: const Color(0xFFD4AF37), width: 2) : null,
            ),
            child: Icon(
              icon,
              color: const Color(0xFFD4AF37),
              size: 28,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              fontSize: 12,
              color: isSelected ? const Color(0xFF1B4D3E) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String name;
  final String rating;
  final String reviews;
  final String specialty;
  final String price;

  const GuideCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.specialty,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFF0F251F),
            child: Text(name[0], style: const TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text('$rating $reviews', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(specialty, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B4D3E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GuideDetailScreen(
                        guideName: name,
                        expertise: specialty,
                        price: price,
                        rating: '$rating $reviews',
                      ),
                    ),
                  );
                },
                child: const Text('Book', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
