import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../global/cubit/global_cubit.dart';
import '../global/cubit/global_state.dart';
import '../router/app_router.dart';
import '../utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            var globalCubit = context.read<GlobalCubit>();

            return MaterialApp.router(
              title: 'YOUR APP',
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.scaffoldColor,
              ),
              locale: Locale(globalCubit.langCode),
              builder: DevicePreview.appBuilder,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', "EG"),
                Locale('en', "US"),
              ],
            );
          },
        );
      },
    );
  }
}
