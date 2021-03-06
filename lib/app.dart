import 'package:cv_for_khamidjon/ui/components/snackbar.dart';
import 'package:cv_for_khamidjon/ui/screens/main/home_pages.dart';
import 'package:cv_for_khamidjon/ui/theme/themes.dart';
import 'package:cv_for_khamidjon/utils/app_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base/connection_observer.dart';
import 'base/navigator_observer.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey<ScaffoldMessengerState>();
  ScaffoldMessengerState get appMessenger => _messengerKey.currentState!;
  // final Directory appDirectory;

  App({
    Key? key,
  }) : super(key: key) {
    // observe network connection
    ConnectionObserver.onChanged.listen((hasConnection) {
      if (hasConnection)
        AppSnackBar.showSuccess(
          appMessenger,
          iconData: Icons.done,
          title: S.current.your_internet_connection_was_restored,
        );
      else
        AppSnackBar.showError(
          appMessenger,
          title: S.current.connection_is_lost,
          description: S.current.please_check_your_internet_connection,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () {
          return BlocProvider(
            create: (context) => AppSettingsCubit(),
            child: BlocBuilder<AppSettingsCubit, AppSettings>(builder: (context, settings) {
              return MaterialApp(
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: settings.themeMode,
                debugShowCheckedModeBanner: false,
                navigatorObservers: [
                  AppNavigatorObserver(),
                ],
                locale: settings.language,
                localizationsDelegates: const [
                  S.delegate,
                  RefreshLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: const HomePage(),
              );
            }),
          );
        });
  }
}
