import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // Guide banne ka form (Bottom Sheet mein khulega)
  void _showGuideApplication(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20, right: 20, top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Apply as a Local Guide', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F251F))),
              const SizedBox(height: 10),
              const Text('Join Padharo and show tourists the authentic India. Enter your details below:'),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(labelText: 'Area of Expertise (e.g., Heritage, Food)', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(labelText: 'Years of Experience', border: OutlineInputBorder(), keyboardType: TextInputType.number),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B4D3E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Form band karein
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Application submitted successfully!')),
                    );
                  },
                  child: const Text('Submit Application', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('My Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // User Avatar & Info
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF0F251F),
              child: Icon(Icons.person, size: 50, color: Color(0xFFD4AF37)),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('Guest User', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const Center(
            child: Text('Verified Mobile Number', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ),
          const SizedBox(height: 30),

          // Become a Guide Onboarding Banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1B4D3E),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Become a Local Guide', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Earn by sharing your local culture and stories.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => _showGuideApplication(context),
                  child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Menu Options
          const ListTile(
            leading: Icon(Icons.book_online, color: Color(0xFF1B4D3E)),
            title: Text('My Bookings'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings, color: Color(0xFF1B4D3E)),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.help_outline, color: Color(0xFF1B4D3E)),
            title: Text('Help & Support'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
