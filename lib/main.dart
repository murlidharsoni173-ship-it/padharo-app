Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '2 Hrs (₹450/hr)',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          Text(
            value, // Yeh variable hai, isliye 'const' nahi lagega
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      const Text(
        'Continue with Google',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
)
 
