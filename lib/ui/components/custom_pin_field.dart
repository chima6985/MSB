import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinField extends StatelessWidget {
  const CustomPinField({
    super.key,
    this.controller,
    this.length = 6,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
  });

  final TextEditingController? controller;

  final VoidCallback? onTap;

  final int length;

  final bool obscureText;

  final bool readOnly;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: PinCodeTextField(
        animationType: AnimationType.fade,
        autovalidateMode: AutovalidateMode.disabled,
        length: length,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onTap: onTap,
        enablePinAutofill: !readOnly,
        cursorColor: AppColors.blue12,
        readOnly: readOnly,
        controller: controller,
        enableActiveFill: true,
        appContext: context,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.blue12,
        ),
        obscuringCharacter: '*',
        obscureText: obscureText,
        validator: validator ??
            (value) {
              if (value!.isEmpty) return 'Enter your pin';
              if (value.length != length) {
                return 'Enter a valid $length digit pin';
              }
              return null;
            },
        pinTheme: PinTheme(
          activeColor: AppColors.blueE7,
          selectedColor: AppColors.blueE7,
          inactiveColor: AppColors.black15,
          disabledColor: AppColors.black15,
          activeFillColor: AppColors.blueE7,
          selectedFillColor: AppColors.blueE7,
          inactiveFillColor: AppColors.white,
          errorBorderColor: AppColors.redFF,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldWidth: 48,
          fieldHeight: 48,
          borderWidth: 0.8,
          activeBorderWidth: 1,
          inactiveBorderWidth: 0.6,
          selectedBorderWidth: 0.8,
          disabledBorderWidth: 0.6,
          errorBorderWidth: 0.8,
        ),
        autoDisposeControllers: false,
        onChanged: (_) {},
      ),
    );
  }
}
