import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NotificationScreen extends HookWidget {
  const NotificationScreen({super.key});

  static const String id = 'notificationScreen';

  @override
  Widget build(BuildContext context) {
    
    final ShowSecondScreenContent = useState(false);
    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Center(
                    child: InkWell(
                      // onTap: () => ,
                      child: Text(
                        context.appLocale.notifications,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 162.h),
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.blueE6,
                child: AppAssets.images.svgs.notification.svg(),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    context.appLocale.itsQuietInHere,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.kanit,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.appLocale.keeppracticing,
                    style: context.textTheme.titleMedium!.copyWith(
                      fontFamily: FontFamily.kanit,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




// class ShowSecondScreen extends StatelessWidget{
//   const ShowSecondScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: ,
//     );
//   }
// }