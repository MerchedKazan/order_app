import 'package:flutter/material.dart';
import 'package:order_app/helper.dart';
import 'package:order_app/provider/order_provider.dart';
import 'package:order_app/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/hive/order_hive.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(OrderSavedAdapter());
  Hive.registerAdapter(OrderModelHiveAdapter());
  Hive.registerAdapter(AddressHiveAdapter());
  Hive.registerAdapter(ItemsHiveAdapter());
  await Hive.openBox<OrderSaved>("order_saved");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>OrderProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Order App',
        theme: ThemeData(
          primarySwatch: Palette.primaryColor,
          textTheme: TextTheme(
            titleMedium: TextStyle(
              color: Color(0xff00241b)
            )
          )

        ),
        home:const SafeArea(child:  HomePage()),
      ),
    );
  }
}

