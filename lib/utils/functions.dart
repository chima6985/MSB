import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Functions {
  static void autoScroll({
    required ScrollController controller,
    required double position,
  }) {
    controller.animateTo(
      position,
      duration: 300.ms,
      curve: Curves.linear,
    );
  }

  static void showModalAuth(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AuthModal(),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }

  static List<String> greetingMessage(BuildContext context) {
    final currentLocale = context.currentLocale;
    final now = DateTime.now().hour;

    if (now < 12) {
      return [
        context.appLocale.goodMorning,
        if (currentLocale == yo)
          context.enLocale.goodMorning
        else
          context.yoLocale.goodMorning,
      ];
    } else if (now < 17) {
      return [
        context.appLocale.goodAfternoon,
        if (currentLocale == yo)
          context.enLocale.goodAfternoon
        else
          context.yoLocale.goodAfternoon,
      ];
    } else {
      return [
        context.appLocale.goodEvening,
        if (currentLocale == yo)
          context.enLocale.goodEvening
        else
          context.yoLocale.goodEvening,
      ];
    }
  }

  /// Function to copy text to clipboard
  static void copyTextToClipBoard(BuildContext context, String s) {
    Clipboard.setData(ClipboardData(text: s)).then((value) {
      if (!context.mounted) return;
      ToastMessage.showSuccess(
        context: context,
        text: context.appLocale.textCopied,
      );
    }).catchError((e) {
      if (!context.mounted) return;
      ToastMessage.showSuccess(
        context: context,
        text: context.appLocale.couldNotCopy,
      );
    });
  }

  /// Function to get image avatar asset from assets
  static Future<String> getImageFileFromAssets(
    String assetPath,
    String fileName,
  ) async {
    final byteData = await rootBundle.load(assetPath);

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');

    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file.path;
  }

  static Future<void> captureAndShareWidget({
    required BuildContext context,
    required GlobalKey key,
  }) async {
    try {
      final boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;

      final image = await boundary.toImage(pixelRatio: 3);

      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/invite_image.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(pngBytes);

      await Share.shareXFiles(
        [XFile(imagePath)],
        text: '📚 Learn Yoruba on Masoyinbo https://www.eayoruba.com/',
      );
    } catch (e) {
      if (!context.mounted) return;
      ToastMessage.showWarning(
        context: context,
        text: context.appLocale.anErrorOccurredSharing,
      );
    }
  }
}
