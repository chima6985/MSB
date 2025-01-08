import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ToastMessage {
  static void showSuccess({
    required BuildContext context,
    required String text,
  }) {
    final fToast = FToast().init(context);

    if (FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }

    fToast
      ..removeQueuedCustomToasts()
      ..showToast(
        child: ToastWidget(
          toastType: ToastType.success,
          text: text,
          fToast: fToast,
        ),
        gravity: ToastGravity.TOP,
      );
    HapticFeedback.lightImpact();
  }

  static void showWarning({
    required BuildContext context,
    required String text,
  }) {
    final fToast = FToast().init(context);

    if (FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    fToast
      ..removeQueuedCustomToasts()
      ..showToast(
        child: ToastWidget(
          toastType: ToastType.warning,
          text: text,
          fToast: fToast,
        ),
        gravity: ToastGravity.TOP,
      );
    HapticFeedback.lightImpact();
  }

  static void showError({
    required BuildContext context,
    required String text,
  }) {
    final fToast = FToast().init(context);

    if (FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    fToast
      ..removeQueuedCustomToasts()
      ..showToast(
        child: ToastWidget(
          toastType: ToastType.error,
          text: text,
          fToast: fToast,
        ),
        gravity: ToastGravity.TOP,
      );
    HapticFeedback.lightImpact();
  }

  static void showInformation({
    required BuildContext context,
    required String text,
  }) {
    final fToast = FToast().init(context);

    if (FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }

    fToast.showToast(
      child: ToastWidget(
        toastType: ToastType.information,
        text: text,
        fToast: fToast,
      ),
      gravity: ToastGravity.TOP,
    );
    HapticFeedback.lightImpact();
  }
}

enum ToastType { success, information, warning, error }

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    required this.toastType,
    required this.text,
    required this.fToast,
  });

  final ToastType toastType;
  final String text;
  final FToast fToast;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final color = {
      ToastType.success: AppColors.green15,
      ToastType.information: AppColors.blue00,
      ToastType.warning: AppColors.yellowF7,
      ToastType.error: AppColors.redF0,
    };

    final toastBgColor = {
      ToastType.success: AppColors.greenE8,
      ToastType.information: AppColors.blueE6,
      ToastType.warning: AppColors.yellowFE,
      ToastType.error: AppColors.redFE,
    };

    final toastIcon = <ToastType, Widget>{
      ToastType.success: AppAssets.images.svgs.success.svg(),
      ToastType.information: AppAssets.images.svgs.message.svg(),
      ToastType.warning: AppAssets.images.svgs.warning.svg(),
      ToastType.error: AppAssets.images.svgs.error.svg(),
    };

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color[toastType]!),
        color: toastBgColor[toastType],
      ),
      child: Row(
        children: [
          toastIcon[toastType] ?? const SizedBox(),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                letterSpacing: -0.28,
                color: AppColors.grey3F,
              ),
            ),
          ),
          const SizedBox(width: 3),
          InkWell(
            onTap: fToast.removeCustomToast,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.close_rounded,
                color: color[toastType],
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
