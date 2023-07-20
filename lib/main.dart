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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Provider.of<NewsProvider>(context, listen: false).fetchNewsAll();
  }
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home:  Provider.of<NewsProvider>(context,listen:true).isLoading?CustomLoader(): HomePage(),);
            },
          // home: DiscoverScreen()  ,
        );
      }}





