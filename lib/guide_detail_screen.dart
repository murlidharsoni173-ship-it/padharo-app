import 'package:flutter/material.dart';

class GuideDetailScreen extends StatelessWidget {
  final String guideName;
  final String expertise;
  final String price;
  final String rating;

  const GuideDetailScreen({
    Key? key,
    required this.guideName,
    required this.expertise,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$guideName Profile', style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0F251F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFF0F251F),
                child: Text(
                  guideName[0],
                  style: const TextStyle(fontSize: 40, color: Color(0xFFD4AF37), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                guideName,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0F251F)),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  expertise,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0F251F)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Rating:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('⭐ $rating', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Charges:', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E))),
              ],
            ),
            const Spacer(),
            
            // Confirm Booking Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F251F),
                  shape: RoundedRectangleBoard(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Booking Successful! 🎉'),
                      content: Text('Aapne $guideName ko successfully book kar liya hai. Guide aapse jald hi sampark karenge.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close Dialog
                            Navigator.pop(context); // Go back to Dashboard
                          },
                          child: const Text('OK', style: TextStyle(color: Color(0xFF0F251F))),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
