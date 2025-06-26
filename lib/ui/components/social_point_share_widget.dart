import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/user/cubits/user_cubit/user_cubit.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SocialPointsShareWidget extends StatelessWidget {
  const SocialPointsShareWidget({
    super.key,
    required this.point,
  });

  final num point;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final user = context.watch<UserCubit>().state.user;
    return Container(
      width: mqr.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AppAssets.images.jpegs.paintedBackground.provider(),
          fit: BoxFit.cover,
          opacity: 0.95,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -20.h,
            right: -40.w,
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 74.r,
              child: Transform.translate(
                offset: Offset(-10.w, -10.h),
                child: Transform.scale(
                  scale: 0.68,
                  child: CachedNetworkImage(
                    imageUrl: user?.image ?? '',
                    errorWidget: (context, _, error) =>
                        AppAssets.images.jpegs.womanSocial.image(),
                    progressIndicatorBuilder: (context, _, val) =>
                        AppAssets.images.jpegs.womanSocial.image(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAssets.images.jpegs.masoyinboLogo.image(
                  width: 80.w,
                  height: 80.w,
                ),
                SizedBox(height: 20.h),
                Text(
                  'I scored',
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyLarge,
                    children: [
                      const TextSpan(text: '🌟 '),
                      TextSpan(
                        text: '$point points',
                        style: context.textTheme.headlineMedium!.copyWith(
                          fontSize: 26.5.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blue12,
                        ),
                      ),
                      const TextSpan(text: ' in Yoruba'),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Join me on Masoyinbo to learn\nYoruba in a fun way ',
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    height: 1.8,
                  ),
                ),
                SizedBox(height: 26.h),
                Text(
                  'App available on',
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodySmall,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppAssets.images.svgs.playstore.svg(),
                    const SizedBox(width: 22),
                    AppAssets.images.svgs.apple.svg(),
                  ],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
