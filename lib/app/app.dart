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
            // We extract the raw scale with .scale(1.0) and create a fresh
            // TextScaler.linear to avoid the assertion that fires when
            // .clamp() is composed on an already-clamped TextScaler (which
            // can produce maxScale == minScale and fail maxScale > minScale).
            final mediaQuery = MediaQuery.of(context);
            final scaleFactor =
                mediaQuery.textScaler.scale(1.0).clamp(1.0, 1.2);
            return MediaQuery(
              data: mediaQuery.copyWith(
                textScaler: TextScaler.linear(scaleFactor),
              ),
              child: routerChild!,
            );
          },
        );
      },
    );
  }
}
