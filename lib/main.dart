import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:solesmates/routes/router.dart';
import 'package:solesmates/routes/routes.dart';
import 'package:solesmates/themes/colours.dart';
import 'package:solesmates/utils/app_providers.dart';
import 'package:solesmates/utils/config.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProvProducts()),
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
      ],
      child: MaterialApp(
        // disable test banner
        debugShowCheckedModeBanner: false,
        // app name
        title: AppConfig.appName,
        // app theme
        theme: ThemeData(
          primarySwatch: AppColours.primaryColour,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0XFFf7f7f7),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Color(0XFFf7f7f7),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
       
        //make flutter aware of app routes using router generator in router.dart file
        onGenerateRoute: generateRoute,

        initialRoute: mainScreenRoute,
      ),
    );
  }
}
