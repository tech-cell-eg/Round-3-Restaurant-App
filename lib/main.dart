import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/helper/shared_preference.dart';
import 'package:food_app/core/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          onGenerateRoute: Routes.onGenerateRoute,
          //change this line to required screen name
          initialRoute:
              SharedPreference.getBool(key: "onboarding") != true
                  ? Routes.onboard
                  : Routes.login,
        );
      },
    );
  }
}
