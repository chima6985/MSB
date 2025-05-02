import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/theme/colors.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  static const String id = 'notificationsScreen';

  @override
  Widget build(BuildContext context) {
    final changeDisplay = useState(true);
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            GestureDetector(
              onTap: () => changeDisplay.value = !changeDisplay.value,
              child: HookBuilder(
                builder: (context) {
                  return Text(
                    changeDisplay.value
                        ? 'My name is victor'
                        : 'My name is Chima',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
