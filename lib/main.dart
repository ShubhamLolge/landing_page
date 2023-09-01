import 'package:landing_page/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: FontFamily.manrope,
      ),
      home: const HomePage(),
    );
  }
}



// https://arieotech.com/
// https://www.freshconsulting.com/services/software/mobile-app-development/
// https://www.zoho.com/backstage/hybrid-events.html?src=ft
