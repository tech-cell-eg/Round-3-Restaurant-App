import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/helper/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  await SharedPreference.initialize();
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
        return MultiBlocProvider(
          providers: [],
          child: MaterialApp(
            title: 'Food Delivery',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
            ),
            onGenerateRoute: Routes.onGenerateRoute,
            //change this line to required screen name
            initialRoute: Routes.empty,
          ),
        );
      },
    );
  }
}
