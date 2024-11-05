import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ModuleScreen extends HookWidget {
  const ModuleScreen({
    super.key,
  });
  static const String id = 'moduleScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final selectedPosition = useState<int?>(null);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      'Master the Alphabets 1',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              welcomeToYourYrLearningClass,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
