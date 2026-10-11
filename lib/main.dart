import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_one/core/service/shared_pref_helper.dart';
import 'package:project_one/core/utils/constant_manager.dart';
import 'package:project_one/feature/user_profile/manager/user_profile_view_model.dart';
import 'package:provider/provider.dart';

import 'core/di/injectable_initializer.dart';
import 'core/routes/pages_route.dart';
import 'core/routes/routes_generator.dart';
import 'core/service/bloc_observer.dart';
import 'core/service/easy_loading_service.dart';
import 'core/service/localization_service.dart';
import 'core/service/screen_size.dart';
import 'core/utils/theming.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPrefHelper.init();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  var token = await SharedPrefHelper.getSecureString(AppConstants.token);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        BlocProvider(create: (_) => getIt<ProfileViewModel>()),
      ],
      child: MyApp(token: token),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.token});

  final String? token;

  var isSignedIn = SharedPrefHelper.getBool(AppConstants.onBoarding) ?? false;

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();

    ScreenSizeService.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: localeProvider.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: isSignedIn
          ? (token != null ? PagesRoute.layOutScreen : PagesRoute.signInScreen)
          : PagesRoute.onBoarding,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,

      builder: (context, child) {
        ScreenSizeService.init(context);
        return EasyLoading.init()(context, child);
      },
      theme: theme(),
    );
  }
}
