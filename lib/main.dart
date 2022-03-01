import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivfoods_mobile_app/bloc_localization/locale.dart';
import 'package:ivfoods_mobile_app/constants.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations_setup.dart';
import 'package:ivfoods_mobile_app/routes.dart';
import 'core/utils/simple_bloc_delegate.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  LocaleBloc _localeBloc = sl<LocaleBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _localeBloc,
      child: BlocBuilder<LocaleBloc, LocaleState>(
        buildWhen: (previousState, currentState) => previousState != currentState,
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(411, 896),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: () =>
                MaterialApp(
                  title: 'Lv food',
                  debugShowCheckedModeBanner: false,
                  color: kPrimaryColor,
                  initialRoute: "/",
                  routes: routes,
                  supportedLocales: AppLocalisationSetup.supportedLocales,
                  localizationsDelegates: AppLocalisationSetup.localizationDelegates,
                  localeResolutionCallback: AppLocalisationSetup.localeResolutionCallback,
                  locale: state.locale,
                ),
          );
        },
      ),
    );
  }
}
