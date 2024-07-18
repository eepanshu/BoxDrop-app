import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_ui/constants.dart';
import 'package:foodly_ui/screens/phoneLogin/phone_login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/Illustrations/all_bg.svg', // Path to your SVG background image
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name Field
              TextFormField(
                validator: requiredValidator,
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Full Name"),
              ),
              const SizedBox(height: defaultPadding),

              // Email Field
              TextFormField(
                validator: emailValidator,
                onSaved: (value) {},
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
              const SizedBox(height: defaultPadding),

              // Password Field
              TextFormField(
                obscureText: _obscureText,
                validator: passwordValidator,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: _obscureText
                        ? const Icon(Icons.visibility_off, color: bodyTextColor)
                        : const Icon(Icons.visibility, color: bodyTextColor),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),

              // Confirm Password Field
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: _obscureText
                        ? const Icon(Icons.visibility_off, color: bodyTextColor)
                        : const Icon(Icons.visibility, color: bodyTextColor),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PghoneLoginScreen(),
                    ),
                  );
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
