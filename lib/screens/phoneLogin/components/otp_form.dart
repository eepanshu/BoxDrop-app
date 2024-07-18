import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodly_ui/entry_point.dart';

import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

import '../../../components/buttons/primary_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  FocusNode? _pin1Node;
  FocusNode? _pin2Node;
  FocusNode? _pin3Node;
  FocusNode? _pin4Node;

  @override
  void initState() {
    super.initState();
    _pin1Node = FocusNode();
    _pin2Node = FocusNode();
    _pin3Node = FocusNode();
    _pin4Node = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _pin1Node!.dispose();
    _pin2Node!.dispose();
    _pin3Node!.dispose();
    _pin4Node!.dispose();
  }

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
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildOtpInput(_pin1Node, _pin2Node),
                    buildOtpInput(_pin2Node, _pin3Node),
                    buildOtpInput(_pin3Node, _pin4Node),
                    buildOtpInput(_pin4Node, null),
                  ],
                ),
                const SizedBox(height: defaultPadding * 2),
                // Continue Button
                PrimaryButton(
                  text: "Continue",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      // If all data are correct then save data to out variables
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EntryPoint(),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOtpInput(FocusNode? currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: 48,
      height: 48,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            nextFocus.requestFocus();
          }
        },
        validator: RequiredValidator(errorText: ''),
        maxLength: 1,
        focusNode: currentFocus,
        obscureText: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: otpInputDecoration,
      ),
    );
  }
}
