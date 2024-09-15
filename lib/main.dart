import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_task/navBarMenu.dart';

import 'views/portfolio/portfolioView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          title: 'TripMate',
          theme: ThemeData.light(),
          home: child,
        ),
        child: BottomNavBar(),
      );
}
