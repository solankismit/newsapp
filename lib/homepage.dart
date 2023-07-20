import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/ui/breakingnews_page/breakingnews.dart';
import 'package:newsapp/ui/breakingnews_page/categories.dart';
import 'package:newsapp/ui/common/app_style.dart';
import 'package:newsapp/ui/common/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: kbackgroundLight,
        elevation: 0,
        bottomOpacity: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 70.w,
        title: Text('News App',
            style: fontStyle(40.sp, Colors.black87, FontWeight.w600)),
      ),
      body: Column(
        children: [
          BreakingNews(),
          Categories()
        ],
      ),
    );
  }
}





