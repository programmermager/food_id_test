import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/router.dart' as rt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? locale;

  @override
  void initState(){
    super.initState();

    var locale = const Locale('en', 'US');
    Get.updateLocale(locale);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FOOD ID',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      locale: locale,
      getPages: rt.Router.route,
      initialRoute: '/splashScreen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }
        ),
      ),
    );
  }

  void aMethodThatMightFail() {}
}
