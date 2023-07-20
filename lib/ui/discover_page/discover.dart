import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/contants.dart';
import 'package:newsapp/newsprovider.dart';
import 'package:newsapp/ui/common/app_style.dart';
import 'package:newsapp/ui/common/custom_loader.dart';
import 'package:newsapp/ui/discover_page/discover.dart';
import 'package:newsapp/ui/discover_page/widgets/newstile.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();

    // fetchNewsAll();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void fetchNewsAll() async {
  //   final newsProvider = Provider.of<NewsProvider>(context, listen: false);
  //   // newsProvider.setCategory("General");
  //   // newsProvider.ChangeLoading(true);
  //   await newsProvider.fetchNewsAll();
  //   // newsProvider.ChangeLoading(false);
  //
  // }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        return FutureBuilder(
            future: newsProvider.fetchNewsByCategory(newsProvider.selectedCategory),
            builder: (context, snapshot) {
              return !snapshot.hasData?
            CustomLoader()
            : orientation == Orientation.portrait ? DiscoverScreenPortrait(): DiscoverScreenLandscape();
      },);
      },
    );
  }
}

class DiscoverScreenLandscape extends StatelessWidget {
  const DiscoverScreenLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final selectedCategory = newsProvider.selectedCategory;
    final _newsList = selectedCategory == "General"
        ? newsProvider.newsList
        : newsProvider.newsListByCategory;

    return Scaffold(
        backgroundColor: kbackgroundLight,
        body: Container(
            child: Stack(
          children: [
            Positioned(
                top: 160.h,
                child: Container(
                  height: .6.sh,
                  width: 1.sw,
                  child: ListView.builder(
                    itemCount: _newsList.length,
                    itemBuilder: (context, index) {
                      var data = _newsList[index];
                      var category = selectedCategory ?? "General";


                      return NewsListTile(
                        article: data,
                        category: category,
                          orientation: Orientation.landscape);
                    },
                  ),
                )),
            Positioned(
              top: 10.h,
              child: Container(
                height: 170.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0, 0.5,0.8,1],
                    // tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // Starting color (change to your desired color)
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      // Colors.black,
                      // Colors.black,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                // color: Colors.black45,
                margin: EdgeInsets.only(left: 20.w, top: 10.h),
                height: .4.sh,
                width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Discover",
                          style: fontStyle(
                              50.sp, Colors.black87, FontWeight.w600)),
                    ),
                    Container(
                      child: Text(" News from all around world",
                          style: fontStyle(
                              15.sp, Colors.black45, FontWeight.w300)),
                    ),
                    categoryChips(context, Orientation.landscape),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}

class DiscoverScreenPortrait extends StatelessWidget {
  const DiscoverScreenPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final selectedCategory = newsProvider.selectedCategory;
    final _newsList = selectedCategory == "General"
        ? newsProvider.newsList
        : newsProvider.newsListByCategory;

    return Scaffold(
        backgroundColor: kbackgroundLight,
        appBar: AppBar(
          backgroundColor: kbackgroundLight,
          elevation: 0,
          bottomOpacity: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 70.w,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20.w),
              child: Icon(
                Icons.search,
                color: Colors.black87,
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.white.withOpacity(0),
            child: Stack(
          // fit: StackFit.expand,
          children: [
            Positioned(
                top: .17.sh,
                child: Container(
                  color: Colors.white.withOpacity(0),
                  height: .7.sh,
                  width: 1.sw,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 15.h),
                    itemCount: _newsList.length,
                    itemBuilder: (context, index) {
                      var data = _newsList[index];
                      var category = selectedCategory ?? "General";
                      return NewsListTile(
                          article: data,
                          category: category,
                          orientation: Orientation.portrait);
                    },
                  ),
                )),
            //Add White Container
            Positioned(
              top: 16,
              child: Container(
                height: .2.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0, 0.5,0.8,1],
                    // tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // Starting color (change to your desired color)
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      // Colors.black,
                      // Colors.black,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(

                color: Colors.white.withOpacity(0),
                margin: EdgeInsets.only(left: 0.w, top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: .18.sh,
                width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.08.sh,
                      child: Text("Discover",
                          style: fontStyle(
                              50.sp, Colors.black87, FontWeight.w600)),
                    ),
                    Container(
                      child: Text(" News from all around world",
                          style: fontStyle(
                              15.sp, Colors.black45, FontWeight.w300)),
                    ),
                    categoryChips(context, Orientation.portrait),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}

Widget categoryChips(context, Orientation orientation) {
  final newsProvider = Provider.of<NewsProvider>(context);
  final selectedCategory = newsProvider.selectedCategory;


  return Container(
    color: Colors.white.withOpacity(0),
    margin: EdgeInsets.only(top: 3.h),
    height: orientation == Orientation.portrait ? 0.05.sh : 0.08.sh,
    width: 1.sw,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = category == selectedCategory;
        return GestureDetector(
          onTap: () {
            if (!isSelected) {
              newsProvider.setCategory(category);
              newsProvider.fetchNewsByCategory(category);
            }
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 80.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.only(right: 10.w),
              // width: 100.w,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : kwidgetBGLight,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  category,
                  style: fontStyle(
                      16.sp,
                      isSelected ? Colors.white : Colors.black54,
                      FontWeight.w500),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
