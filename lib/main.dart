import 'package:courier_management_system/utils/routes/routes.dart';
import 'package:courier_management_system/utils/routes/routes_name.dart';
import 'package:courier_management_system/view_model/quoteView_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> QuoteViewViewModel())
        // ChangeNotifierProvider(create: (_)=> UserViewModel()),


    ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.quoteHome,
      onGenerateRoute: Routes.generateRoute ,
        debugShowCheckedModeBanner: false,
    ),

    );
  }
}
