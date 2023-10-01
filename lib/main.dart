import 'package:flutter/material.dart';
import 'package:flutter_task/Provider/shortDataPageProvider.dart';
import 'package:flutter_task/Provider/homeDetailsPageProvider.dart';
import 'package:flutter_task/Provider/homePageProvider.dart';
import 'package:provider/provider.dart';

import 'UI/BottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return HomeDetailsPageProvider();
      },
      child: ChangeNotifierProvider(
        create: (context) {
          return ShortDataPageProvider();
        },
        child: ChangeNotifierProvider(
          create: (context) {
            return HomePageProvider();
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Bottombar(),
          ),
        ),
      ),
    );
  }
}
