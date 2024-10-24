import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shpping_app/cart_provider.dart';
import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Delete Product',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          content: Text(
                              'Are you sure you want to delete the product.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
              title: Text(
                  style: Theme.of(context).textTheme.bodySmall,
                  cartItem['title'].toString()),
              subtitle: Text('size ${cartItem['sizes']}'),
            );
          }),
    );
  }
}
