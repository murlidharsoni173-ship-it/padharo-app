import 'package:flutter/material.dart';

void main() {
  runApp(const PadharoApp());
}

class PadharoApp extends StatelessWidget {
  const PadharoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Padharo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A1B17),
        primaryColor: const Color(0xFF008B47),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF008B47),
          secondary: Color(0xFFD4AF37),
          surface: Color(0xFF0A1B17),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    LoginScreen(),
    HomeScreen(),
    GuideProfileScreen(),
    ActiveTourScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF0A1B17),
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Guide'),
          BottomNavigationBarItem(icon: Icon(Icons.navigation), label: 'Active'),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// SCREEN 1: SPLASH & LOGIN
// -----------------------------------------------------------------------------
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A1B17), Color(0xEE0A1B17)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Icon(Icons.account_balance, size: 80, color: Color(0xFFD4AF37)),
                const SizedBox(height: 12),
                const Text(
                  'PADHARO',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                    letterSpacing: 3,
                  ),
                ),
                const Text(
                  'Explore India Authentically',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const Spacer(),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('🇮🇳 +91', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                    hintText: 'Enter Mobile Number',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008B47),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: const Text('Get OTP', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('OR', style: TextStyle(color: Colors.white38)),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white24),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 28),
                  label: const Text('Continue with Google'),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// SCREEN 2: HOME DASHBOARD
// -----------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1B17),
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 20),
            SizedBox(width: 6),
            Text('Jaipur, Rajasthan', style: TextStyle(fontSize: 16, color: Colors.white)),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
        actions: const [
          CircleAvatar(backgroundColor: Colors.white24, child: Icon(Icons.person, color: Colors.white)),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Monuments, Food Walks, Guides...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            
            // Category Pills
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(icon: Icons.account_balance, label: 'Heritage', color: Color(0xFFFFF3E0)),
                  CategoryItem(icon: Icons.fastfood, label: 'Food', color: Color(0xFFFFEBEE)),
                  CategoryItem(icon: Icons.shopping_bag, label: 'Shopping', color: Color(0xFFEDE7F6)),
                  CategoryItem(icon: Icons.nightlife, label: 'Night Vibe', color: Color(0xFFE0F2F1)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Section Header
            const Text('Top Rated Local Guides', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black80)),
            const SizedBox(height: 12),
            
            // Guide Cards
            const GuideCard(name: 'Ramesh Kumar', rating: '4.9 (128 Reviews)', spec: 'Heritage Expert', price: '₹450/hr'),
            const GuideCard(name: 'Priya Sharma', rating: '4.8 (98 Reviews)', spec: 'Local Markets & Culture', price: '₹400/hr'),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const CategoryItem({super.key, required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: Colors.black80),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black80, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String name, rating, spec, price;
  const GuideCard({super.key, required this.name, required this.rating, required this.spec, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const CircleAvatar(radius: 30, backgroundColor: Color(0xFF0A1B17), child: Icon(Icons.person, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified, color: Color(0xFF008B47), size: 16),
                  ],
                ),
                Text('⭐ $rating', style: const TextStyle(fontSize: 12, color: Colors.amber)),
                Text(spec, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF008B47)),
            onPressed: () {},
            child: const Text('Book', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// SCREEN 3: GUIDE PROFILE & CHECKOUT
// -----------------------------------------------------------------------------
class GuideProfileScreen extends StatelessWidget {
  const GuideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAlignment.start,
          children: [
            Center(
              child: Column(
                children: const [
                  CircleAvatar(radius: 45, backgroundColor: Color(0xFF0A1B17), child: Icon(Icons.person, size: 50, color: Colors.white)),
                  SizedBox(height: 8),
                  Text('Ramesh Kumar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                  Text('🛡️ Govt. Certified Guide', style: TextStyle(color: Color(0xFF008B47), fontWeight: FontWeight.w600)),
                  Text('Languages: Hindi, English, Spanish', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Tour Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
            const SizedBox(height: 8),
            Row(
              children: const [
                Expanded(child: SelectableOption(label: 'Solo/Couple', isSelected: true)),
                SizedBox(width: 8),
                Expanded(child: SelectableOption(label: 'Family (3-5)', isSelected: false)),
                SizedBox(width: 8),
                Expanded(child: SelectableOption(label: 'Group (6+)', isSelected: false)),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFF4F5F7), borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAlignment.start,
                children: const [
                  Text('Bill Breakdown', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 8),
                  Row(mainAxisAlignment: Mainbetween, children: [Text('2 Hrs (₹450/hr)', style: TextStyle(color: Colors.black70)), Text('₹900', style: TextStyle(color: Colors.black))]),
                  Row(mainAxisAlignment: Mainbetween, children: [Text('Platform Fee', style: TextStyle(color: Colors.black70)), Text('₹50', style: TextStyle(color: Colors.black))]),
                  Divider(),
                  Row(mainAxisAlignment: Mainbetween, children: [Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)), Text('₹950', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF008B47)))]),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF008B47), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: const Text('💳 Pay Securely (Escrow)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectableOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  const SelectableOption({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.vertical(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0A1B17) : Colors.white,
        border: Border.all(color: const Color(0xFF0A1B17)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }
}

// Helper line fix for Mainbetween enum layout
const MainAxisAlignment Mainbetween = MainAxisAlignment.spaceBetween;

// -----------------------------------------------------------------------------
// SCREEN 4: ACTIVE TOUR & SAFETY
// -----------------------------------------------------------------------------
class ActiveTourScreen extends StatelessWidget {
  const ActiveTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1B17),
        title: const Text('Tour in Progress'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC2626)),
              onPressed: () {},
              icon: const Icon(Icons.warning, color: Colors.white, size: 16),
              label: const Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // Map Placeholder
          Container(
            color: const Color(0xFFE2E8F0),
            child: const Center(
              child: Text('🗺️ Live GPS Route Tracking Active', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
            ),
          ),
          
          // Floating Bottom Status Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(backgroundColor: Color(0xFF0A1B17), child: Icon(Icons.person, color: Colors.white)),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAlignment.start,
                        children: const [
                          Text('Current Guide', style: TextStyle(fontSize: 10, color: Colors.grey)),
                          Text('Ramesh Kumar', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      MetricItem(label: 'ETA', value: '15 min'),
                      MetricItem(label: 'Distance', value: '3.2 km'),
                      MetricItem(label: 'Tour Time', value: '00:45:12'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat, color: Color(0xFF008B47)),
                          label: const Text('Chat', style: TextStyle(color: Color(0xFF008B47))),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF008B47)),
                          onPressed: () {},
                          icon: const Icon(Icons.call, color: Colors.white),
                          label: const Text('Call', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MetricItem extends StatelessWidget {
  final String label, value;
  const MetricItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }
}
