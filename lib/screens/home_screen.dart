import 'package:design_ecom/item_categories.dart';
import 'package:design_ecom/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 320,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(SolarIconsOutline.magnifier),
                        hintText: 'Search products . . .',
                        contentPadding: EdgeInsets.symmetric(vertical: 13),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff242424),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      SolarIconsOutline.tuning_2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ItemCategories(),
            ),

            // Product Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  children: [
                    ProductGridView(
                      imagePath: 'images/brewer.jpg',
                      price: '\$84.00',
                      actualPrice: '',
                      productTitle: 'Kombucha Brewer',
                    ),
                    ProductGridView(
                      imagePath: 'images/sleep_mask.jpg',
                      badgeText: 'Best Price',
                      discount: '15%',
                      price: '\$85.00',
                      actualPrice: '\$100.00',
                      productTitle: 'Sana Sleep Mask',
                    ),
                    ProductGridView(
                      imagePath: 'images/sound.jpg',
                      discount: '30%',
                      price: '\$78.00',
                      actualPrice: '\$120.00',
                      productTitle: 'Engineer Sound',
                    ),
                    ProductGridView(
                      imagePath: 'images/air_pure.jpg',
                      price: '\$32.00',
                      actualPrice: '',
                      productTitle: 'Purified Air By Design',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // BottomNavBar Section
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xfff26363),
        unselectedItemColor: Color(0xff242424),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0
                  ? SolarIconsBold.home2
                  : SolarIconsOutline.home2,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1
                  ? SolarIconsBold.magnifier
                  : SolarIconsOutline.magnifier,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? SolarIconsBold.heart
                  : SolarIconsOutline.heart,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xfff26363),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('images/prof.jpg'),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
