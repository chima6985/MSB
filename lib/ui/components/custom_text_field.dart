import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    required this.textEditingController,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.prefix,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.obscuringCharacter = '*',
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.bottomSpacing = true,
    this.maxLength,
    this.autofocus = false,
    this.hintColor = AppColors.black15,
    this.borderColor,
    this.focusedBorderColor,
    this.height,
    this.helperText,
    this.helperColor,
    this.fontSize,
    this.textFieldText,
    this.textFieldSubText,
    this.obscureCharacter,
    this.onSaved,
    this.onSubmitted,
    this.onEditingComplete,
    this.fillColor,
    this.borderWidth = 0.4,
  });

  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String obscuringCharacter;
  final AutovalidateMode? autoValidateMode;
  final bool? bottomSpacing;
  final int? maxLength;
  final bool autofocus;
  final Color hintColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? height;
  final String? helperText;
  final Color? helperColor;
  final double? fontSize;
  final String? textFieldText;
  final String? textFieldSubText;
  final Widget? obscureCharacter;
  final Function(String?)? onSaved;
  final Function(String?)? onSubmitted;
  final Function()? onEditingComplete;
  final double borderWidth;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: height,
              child: TextFormField(
                controller: textEditingController,
                onChanged: onChanged,
                validator: validator,
                obscureText: obscureText,
                maxLines: maxLines,
                cursorColor: AppColors.black15,
                autovalidateMode: autoValidateMode,
                readOnly: readOnly,
                maxLength: maxLength,
                textInputAction: textInputAction,
                autofocus: autofocus,
                onSaved: onSaved,
                onFieldSubmitted: onSubmitted,
                onEditingComplete: onEditingComplete,
                textCapitalization: textCapitalization,
                keyboardType: keyboardType,
                obscuringCharacter: obscuringCharacter,
                autocorrect: false,
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.black15,
                ),
                onTap: onTap,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  helperText: helperText,
                  helperStyle: textTheme.bodySmall!.copyWith(
                    color: AppColors.black15,
                  ),
                  suffixIcon: suffix,
                  // suffix: suffix,
                  prefixIcon: prefix,
                  hintText: hintText ?? '',
                  hintStyle: textTheme.bodyMedium!.copyWith(
                    color: hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                  labelText: labelText,
                  labelStyle:
                      textTheme.titleMedium!.copyWith(color: AppColors.black15),
                  focusColor: AppColors.black15,
                  fillColor: fillColor ?? Colors.transparent,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(22, 18, 3, 14),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.black15,
                      width: borderWidth,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.black15,
                      width: borderWidth,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.black15,
                      width: borderWidth,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: borderColor ?? AppColors.black15,
                      width: 0.8,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: textFieldText != null,
              child: Transform.translate(
                offset: const Offset(15, -16),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                  color: AppColors.whiteFF,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        textFieldText ?? '',
                        style: textTheme.bodyMedium,
                        textScaler: const TextScaler.linear(0.9),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        textFieldSubText != null ? '($textFieldSubText)' : '',
                        style: textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                        textScaler: const TextScaler.linear(0.9),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (bottomSpacing == true) SizedBox(height: 34.h),
      ],
    );
  }
}

class PasswordTextField extends HookWidget {
  const PasswordTextField({
    required this.textEditingController,
    this.textFieldText,
    this.textFieldSubText,
    this.hintText,
    this.isBottomSpacing = true,
    super.key,
  });

  final TextEditingController textEditingController;
  final String? textFieldText;
  final String? textFieldSubText;
  final String? hintText;
  final bool isBottomSpacing;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    return CustomTextField(
      textEditingController: textEditingController,
      textFieldText: textFieldText,
      textFieldSubText: textFieldSubText,
      obscureText: obscureText.value,
      bottomSpacing: isBottomSpacing,
      hintText: hintText,
      suffix: InkWell(
        onTap: () => obscureText.value = !obscureText.value,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            !obscureText.value ? Iconsax.eye3 : Iconsax.eye_slash4,
            size: 21.sp,
            color: AppColors.blue38,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }
}
