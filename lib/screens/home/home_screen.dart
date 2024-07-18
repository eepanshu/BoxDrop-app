import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import '../../components/cards/big/big_card_image_slide.dart';
import '../../components/cards/big/restaurant_info_big_card.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import '../../demoData.dart';
import '../../screens/filter/filter_screen.dart';
import '../featured/featurred_screen.dart';
import 'components/medium_card_list.dart';
import 'components/promotion_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  int bannerIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to change banners
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        bannerIndex = (bannerIndex + 1) % banners.length;
      });
    });
  }

  @override
  void dispose() {
    // Dispose the timer when the screen is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person), // User profile icon
          onPressed: () {
            // Add your profile icon onPressed action here
          },
        ),
        title: Column(
          children: [
            Text(
              "Welcome To".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: primaryColor),
            ),
            const Text(
              "Box Drop",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FilterScreen(),
                ),
              );
              IconButton(
              icon: const Icon(Icons.attach_money), // Money icon
              onPressed: () {
              // Add your money icon onPressed action here
              },
              );
            },
            child: Text(
              "Filter",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/Illustrations/homescreenBack.svg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        onChanged: (value) {
                          // get data while typing
                          // if (value.length >= 3) showResult();
                        },
                        onFieldSubmitted: (value) {
                          if (_formKey.currentState!.validate()) {
                            // If all data are correct then save data to out variables
                            _formKey.currentState!.save();
                          } else {}
                        },
                        validator: requiredValidator,
                        style: Theme.of(context).textTheme.labelLarge,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: "Search on BoxDrop",
                          contentPadding: kTextFieldPadding,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: bodyTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: BigCardImageSlide(images: demoBigImages),
                  ),
                  const SizedBox(height: defaultPadding),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ServiceBox(
                            icon: Icons.local_shipping,
                            title: 'Box Drop Service',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const User(), // Replace OrderBookingPage with your actual page
                                ),
                              );
                              // Handle onTap event
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: ServiceBox(
                            icon: Icons.volunteer_activism,
                            title: 'Donation',
                            onTap: () {
                              // Handle onTap event
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: ServiceBox(
                            icon: Icons.group,
                            title: 'Join a Community',
                            onTap: () {
                              // Handle onTap event
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 150, // Fixed height for the banner
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: banners[bannerIndex],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  // Existing code...

// SectionTitle for Featured Partners
//                   SectionTitle(
//                     title: "Top Cooks",
//                     titleStyle: const TextStyle(
//                       color: Colors.white, // Set font color to white
//                       // You can also adjust other text properties here, such as fontSize, fontWeight, etc.
//                     ),
//                     press: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const FeaturedScreen(),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: defaultPadding),
//                   const MediumCardList(),
//                   const SizedBox(height: 20),
// Banner
                  const PromotionBanner(),
                  const SizedBox(height: 20),
//
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ServiceBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 90, // Fixed height for each service box
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                  size: 38,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Example banners
final List<Widget> banners = [
  Container(
    color: Colors.black38,
    child: const Center(
      child: Text(
        'Experience the Delight of Home-Cooked Meals Delivered to Your Doorstep with Boxdrop.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 20, // Adjust the font size as needed
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic
        ),
      ),
    ),
  ),
  Container(
    color: Colors.black38,
    child: const Center(
      child: Text(
        'Discover Convenience and Flavor in Every Bite with Boxdrop – Your Reliable Tiffin Delivery Service.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 20, // Adjust the font size as needed
          fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic
        ),
      ),
    ),
  ),
  Container(
    color: Colors.black38,
    child: const Center(
      child: Text(
        'Savor Moments of Togetherness with Boxdrop – Where Every Meal is a Celebration.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 20, // Adjust the font size as needed
          fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic
        ),
      ),
    ),
  ),
];

// Example banners
// final List<Widget> banners = [
//   Container(
//   child: SvgPicture.asset(
//     'assets/images/Banner.png',
//     fit: BoxFit.cover,
//   )),
//   Container(child: SvgPicture.asset(
//     'assets/images/Header-image.png',
//     fit: BoxFit.cover,
//   )),
//   Container(
//     child: SvgPicture.asset(
//       'assets/images/featured _items_2.png',
//       fit: BoxFit.cover,
//     )
//   )
//
//
// ];
class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Background SVG Image
            SvgPicture.asset(
              'assets/Illustrations/all_bg.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // QR Code Image
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Show QR Code image
                      Image.asset(
                        "assets/images/Screenshot 2024-05-05 181400.png",
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                // Form with user information
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        // Name field
                        decoration: const InputDecoration(hintText: 'Enter your name'),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Email ID',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        // Email field
                        decoration: const InputDecoration(hintText: 'Enter your email'),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Mobile Number',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        // Mobile number field
                        decoration: const InputDecoration(hintText: 'Enter your mobile number'),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Pickup Location',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Subfields for pickup location
                      TextFormField(
                        // Flat number
                        decoration: const InputDecoration(hintText: 'Flat Number'),
                      ),
                      TextFormField(
                        // Street
                        decoration: const InputDecoration(hintText: 'Street'),
                      ),
                      TextFormField(
                        // Landmark
                        decoration: const InputDecoration(hintText: 'Landmark'),
                      ),
                      TextFormField(
                        // Pincode
                        decoration: const InputDecoration(hintText: 'Pincode'),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Drop Location',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Subfields for drop location
                      TextFormField(
                        // Flat number
                        decoration: const InputDecoration(hintText: 'Flat Number'),
                      ),
                      TextFormField(
                        // Street
                        decoration: const InputDecoration(hintText: 'Street'),
                      ),
                      TextFormField(
                        // Landmark
                        decoration: const InputDecoration(hintText: 'Landmark'),
                      ),
                      TextFormField(
                        // Pincode
                        decoration: const InputDecoration(hintText: 'Pincode'),
                      ),
                      const SizedBox(height: 32.0),
                      // Place Order Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle place order button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Place Order',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


