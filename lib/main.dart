import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:food_app/core/constants/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/helper/shared_preference.dart';
import 'package:food_app/core/firebase/firebase_options.dart';
import 'package:food_app/features/client/home/cubit/category/category_cubit.dart';
import 'package:food_app/features/client/home/cubit/restaurant/restaurant_cubit.dart';
import 'package:food_app/features/client/home/data/data_source/remote_home_data_source.dart';
import 'package:food_app/features/client/home/data/repository/home_repository.dart';
import 'package:food_app/features/client/restaurant/model/restaurant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreference.initialize();

  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: HydratedStorageDirectory(
  //     (await getTemporaryDirectory()).path,
  //   ),
  // );
  
  runApp(const MyApp());
  // runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

         BlocProvider(create: (context)=>CategoryCubit(HomeRepository(RemoteHomeDataSource())))
        ,BlocProvider(create: (context)=>
        RestaurantCubit(HomeRepository(RemoteHomeDataSource()))),


      ], 
      child: ScreenUtilInit(
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
    ));
  }
}
