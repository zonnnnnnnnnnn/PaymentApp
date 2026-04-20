import 'package:flutter/material.dart';
import '../screens/checkout_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();

}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  final double _price = 50.99;

@override
Widget build(BuildContext context) {
  final total = _price * _quantity;
  return Scaffold(
    appBar: AppBar(title: const Text('Shop')),
    body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network('https://m.media-amazon.com/images/I/61F7+MF-CSL._AC_SL1100_.jpg',
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                height: 220,
                color: Colors.grey[800],
                child: const Icon(
                  Icons.headphones,
                  size: 80,
                  color: Colors.white54,
                ),
              ),
            ),
            ),
            const SizedBox(height: 50),
            const Text('Wireless Headphones',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('₱${_price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, color: Colors.greenAccent),
            ),
            const SizedBox(height: 12),
            Text('Premium noise-cancelling wireless headphone with 100-hour battery life hihi.',
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                    icon: const Icon(Icons.remove),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      disabledBackgroundColor: Colors.grey[900],

                    ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '$_quantity',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _quantity++),
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Center(
              child: Text(
                'Total: ₱${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (_) => CheckoutPage(
                      productName: 'Wireless Headphones',
                      price: _price,
                      quantity: _quantity,
                    ),
                    ),
                    ),
                    icon: const Icon(Icons.shopping_cart),
                    label: Text('Buy Now - ₱${total.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    ),
          ],
        ),
      ),
    );
  }
}