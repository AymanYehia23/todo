import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/strings.dart';
import 'package:todo/presentation/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/http/http_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  HttpService.init();
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(Strings.designWidth, Strings.designHight),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appTitle,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const HomeScreen(),
        ),
      ),
    ),
  );
}
