import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile/cubit/app_cubit.dart';
import 'package:flutter_mobile/screens/home_screen.dart';
import 'package:flutter_mobile/utils/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBrandsLogos()
        ..getCategories(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
      ),
    );
  }
}
