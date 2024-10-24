import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shpping_app/cart_provider.dart';
import 'package:shpping_app/global_variables.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'sizes': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product added successfully'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a size.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (widget.product['sizes'] as List<int>).length,
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['sizes'] as List<int>)[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(size.toString()),
                                  backgroundColor: selectedSize == size
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          label: Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
