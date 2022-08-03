import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_navigator_codemagic/constants.dart';

class ItemsListScreen extends StatelessWidget {
  const ItemsListScreen({
    Key? key,
    required this.onItemTapped,
    required this.onRouteTapped,
  }) : super(key: key);

  final ValueChanged<String> onItemTapped;
  final ValueChanged<String> onRouteTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () => onRouteTapped(cartRoute),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          // onTap: () {},
          onTap: () => onItemTapped('Item $index'),
          title: Text('Item $index'),
        ),
        itemCount: 10,
      ),
    );
  }
}
