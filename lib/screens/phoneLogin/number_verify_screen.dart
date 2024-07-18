import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/welcome_text.dart';
import '../../constants.dart';
import 'components/otp_form.dart';

class NumberVerifyScreen extends StatelessWidget {
  const NumberVerifyScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to BoxDrop"),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/Illustrations/all_bg.svg', // Path to your SVG background image
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeText(
                    title: "Verify phone number",
                    text: "Enter the 4-Digit code sent to you at \n+1501333982",
                  ),
                  // OTP form
                  const OtpForm(),
                  const SizedBox(height: defaultPadding),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Didn’t receive code? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Resend Again.",
                            style: const TextStyle(color: primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Your OTP PIN resend code
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  const Center(
                    child: Text(
                      "By Signing up you agree to our Terms \nConditions & Privacy Policy.",
                      textAlign: TextAlign.center,
                    ),
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
