import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/bubblebarprovider.dart';
import 'package:newsapp/homepage.dart';
import 'package:newsapp/newsprovider.dart';
import 'package:newsapp/ui/common/app_style.dart';
import 'package:newsapp/ui/common/custom_loader.dart';
import 'package:newsapp/ui/discover_page/discover.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsProvider()),
        ChangeNotifierProvider(create: (context) => BubbleBarProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      //Get Screen Size from Different Devices
      designSize: Size(ScreenSize.width, ScreenSize.height),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (BuildContext context, Widget? child) {
        NewsProvider newsProvider = Provider.of<NewsProvider>(context);
        return MaterialApp(
          // title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home:  FutureBuilder(
            future: newsProvider.fetchNewsAll(),
            builder: (context, snapshot) {
             return snapshot.hasData?HomePage():CustomLoader();
            }
          ),
          // home: DiscoverScreen()  ,
        );
      },
    );
  }
}




