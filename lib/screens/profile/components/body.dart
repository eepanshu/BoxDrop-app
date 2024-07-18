import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_ui/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/Illustrations/all_bg.svg', // Path to your SVG background image
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: defaultPadding),
                  Text(
                    "Account Settings",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Update your settings like notifications, payments, profile edit etc.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 18),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/profile.svg",
                    title: "Main Profile Information",
                    subTitle: "Change your account information",
                    press: () {},
                  ),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/lock.svg",
                    title: "Change Password",
                    subTitle: "Change your password",
                    press: () {},
                  ),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/profile.svg",
                    title: "Multiple Profiles",
                    subTitle: "Currently you have 7 multiple profiles",
                    press: () {_showProfileDialog(context);},
                  ),
                  // Modify the Payment Methods section
                  ProfileMenuCard(
                    svgSrc: "assets/icons/card.svg",
                    title: "Payment Methods",
                    subTitle: "Add your credit & debit cards",
                    press: () {
                      // Navigate to the payment page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/share.svg",
                    title: "Subscription",
                    subTitle: "Get an additional Features",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubscriptionPage(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/marker.svg",
                    title: "Locations",
                    subTitle: "Add or remove your delivery locations",
                    press: () {},
                  ),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/fb.svg",
                    title: "Add Social Account",
                    subTitle: "Add Facebook, Twitter etc ",
                    press: () {},
                  ),
                  ProfileMenuCard(
                    svgSrc: "assets/icons/share.svg",
                    title: "Refer to Friends",
                    subTitle: "Get \$10 for referring friends",
                    press: () {},
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    Key? key,
    this.title,
    this.subTitle,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String? title, subTitle, svgSrc;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SvgPicture.asset(
                svgSrc!,
                height: 24,
                width: 24,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subTitle!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}




class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Page"),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/Illustrations/all_bg.svg', // Path to your SVG background image
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
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
                const SizedBox(height: 20),
                // Payment form
                const PaymentForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}


class _PaymentFormState extends State<PaymentForm> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _transactionIdController = TextEditingController();
  final TextEditingController _pdfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _userNameController,
            decoration: const InputDecoration(labelText: "User Name", labelStyle: TextStyle(color: Colors.white)),
          ),
          TextFormField(
            controller: _mobileController,
            decoration: const InputDecoration(labelText: "Mobile Number", labelStyle: TextStyle(color: Colors.white)),
          ),
          TextFormField(
            controller: _transactionIdController,
            decoration: const InputDecoration(labelText: "Transaction ID", labelStyle: TextStyle(color: Colors.white)),
          ),
          TextFormField(
            controller: _pdfController,
            decoration: const InputDecoration(labelText: "Screenshot", labelStyle: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement submit action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow, // Button color
            ),
            child: const Text("Submit", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

}
class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription"),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/Illustrations/all_bg.svg', // Path to your SVG background image
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pricing",
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  PricingCard(
                    price: "700",
                    duration: "1 Month",
                    onTap: () {
                      // Handle click event for $700 pricing
                    },
                  ),
                  PricingCard(
                    price: "1000",
                    duration: "3 Months",
                    onTap: () {
                      // Handle click event for $1000 pricing
                    },
                  ),
                  PricingCard(
                    price: "1300",
                    duration: "6 Months",
                    onTap: () {
                      // Handle click event for $1300 pricing
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Referral Code",
                    style: TextStyle(color: Colors.white),
                  ),
                  // Add TextFormField for Referral Code
                  const SizedBox(height: 10),
                  const Text(
                    "Coupon",
                    style: TextStyle(color: Colors.white),
                  ),
                  // Add TextFormField for Coupon
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement payment action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow, // Button color
                    ),
                    child: const Text("Pay Now", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Support by BoxDrop",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    "Support@boxdrop.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class PricingCard extends StatelessWidget {
  final String price;
  final String duration;
  final VoidCallback onTap;

  const PricingCard({
    required this.price,
    required this.duration,
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "\$$price",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            duration,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
void _showProfileDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Multiple Profiles'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildProfileItem(context, 'Profile 1'),
            _buildProfileItem(context, 'Profile 2'),
            _buildProfileItem(context, 'Profile 3'),
            _buildProfileItem(context, 'Profile 4'),
            _buildProfileItem(context, 'Profile 5'),
            _buildProfileItem(context, 'Profile 6'),
            _buildProfileItem(context, 'Profile 7'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

Widget _buildProfileItem(BuildContext context, String profileName) {
  return ListTile(
    leading: const Icon(Icons.person),
    title: Text(profileName),
    onTap: () {
      // Handle profile item click
      // You can navigate to the profile details page or perform any other action here
      Navigator.of(context).pop(); // Close the dialog box
    },
  );
}
