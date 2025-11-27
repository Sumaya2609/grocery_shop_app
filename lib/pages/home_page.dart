import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/components/grocery_item_tile.dart';
import 'package:grocery_shop_app/model/cart_modal.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: Column(
        children: [
          // good morning
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text("Good morning,"),
          ),

          const SizedBox(height: 4),

          // lets order fresh items fo you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Lets order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),

          const SizedBox(height: 24),

          // fresh item + grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text("Fresh Items", style: TextStyle(fontSize: 16)),
          ),

          Expanded(
            child: Consumer<CartModal>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModal>(
                          context,
                          listen: false,
                        ).addItemToCart(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}