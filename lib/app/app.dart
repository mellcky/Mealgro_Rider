import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealgro_rider_app/app/router/app_router.dart';
import 'package:mealgro_rider_app/app/theme/app_theme.dart';

// Design reference size — must match the Figma frame dimensions.
// All .w / .h / .sp / .r values scale relative to this.
const _kDesignWidth = 390.0;
const _kDesignHeight = 844.0;

class MealgroRiderApp extends ConsumerWidget {
  const MealgroRiderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(_kDesignWidth, _kDesignHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      // builder: is required — ScreenUtil's late fields initialize here.
      // Using child: instead causes LateInitializationError at runtime.
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Mealgro Rider',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: router,
          builder: (context, routerChild) {
            // Clamps system text-scale factor so large-text a11y setting
            // does not break the layout while we build custom typography.
            final mediaQuery = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQuery.copyWith(
                textScaler: mediaQuery.textScaler.clamp(
                  minScaleFactor: 1.0,
                  maxScaleFactor: 1.2,
                ),
              ),
              child: routerChild!,
            );
          },
        );
      },
    );
  }
}
