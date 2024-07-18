import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/welcome_text.dart';
import '../../constants.dart';
import 'number_verify_screen.dart';

class PghoneLoginScreen extends StatefulWidget {
  const PghoneLoginScreen({super.key});

  @override
  State<PghoneLoginScreen> createState() => _PghoneLoginScreenState();
}

class _PghoneLoginScreenState extends State<PghoneLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to Box drop"),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/Illustrations/all_bg.svg', // Path to your SVG background image
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeText(
                    title: "Get started with BoxDrop",
                    text: "Enter your phone number to use BoxDrop and enjoy your food :)",
                  ),
                  const SizedBox(height: defaultPadding),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: phoneNumberValidator,
                      autofocus: true,
                      onSaved: (value) => _phoneNumber = value,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: titleColor),
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        contentPadding: kTextFieldPadding,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Sign Up Button
                  PrimaryButton(
                    text: "Sign Up",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        // If all data are correct then save data to out variables
                        _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NumberVerifyScreen(),
                          ),
                        );
                      } else {}
                    },
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
