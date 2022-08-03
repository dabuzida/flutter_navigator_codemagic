import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_navigator_codemagic/cart_screen.dart';
import 'package:flutter_navigator_codemagic/constants.dart';
import 'package:flutter_navigator_codemagic/item_detail_screen.dart';
import 'package:flutter_navigator_codemagic/items_list_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _selectedItem;
  String? _selectedRoute;
  bool show404 = false;

  void _handleItemTapped(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  void _handleRouteTapped(String route) {
    setState(() {
      _selectedItem = null;
      _selectedRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator-codemagic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: <Page>[
          MaterialPage(
            key: ValueKey('ItemListScreen'),
            child: ItemsListScreen(
              onItemTapped: _handleItemTapped,
              onRouteTapped: _handleRouteTapped,
            ),
          ),
          if (show404)
            const MaterialPage(
              key: ValueKey('Error Page'),
              child: Center(
                child: Text('404'),
              ),
            )
          else if (_selectedItem != null)
            MaterialPage(
              key: ValueKey(_selectedItem),
              child: ItemDetailScreen(
                  // item: _selectedItem,
                  ),
            )
          else if (_selectedRoute != null && _selectedRoute == cartRoute)
            MaterialPage(
              child: CartScreen(
                onItemTapped: _handleItemTapped,
              ),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (_selectedItem != null && _selectedRoute != null) {
            setState(() {
              _selectedItem = null;
            });
            return true;
          }

          setState(() {
            _selectedItem = null;
            _selectedRoute = null;
          });

          return true;
        },
      ),
    );
  }
}
