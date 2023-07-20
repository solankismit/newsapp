import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/contants.dart';
import 'package:newsapp/model/getnews.dart';
import 'package:newsapp/newsprovider.dart';
import 'package:newsapp/ui/common/app_style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key});
  @override
  Widget build(BuildContext context) {
    final NewsProvider newsProvider = Provider.of<NewsProvider>(context);
    //Only top 3 news that have image
    final topNews = newsProvider.newsList.where((element) => element.urlToImage!=null).toList().sublist(0,5);
    for (var i = 0; i < topNews.length; i++) {
      // print("Top News $i ::::");
      // print(topNews[i].toJson());
      // print("Top News $i ------");
    }
    // print(topNews[i].toJson());
    // print(topNews);
    // return Placeholder();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text("Breaking News",style: fontStyle(25.sp, Colors.black87, FontWeight.w600),)),
        CarouselSlider.builder(
            itemCount: topNews.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return NewsCard(news:topNews[index]);
            },
            options: CarouselOptions(
              height: 0.25.sh,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
      ],
    );
  }


}

class NewsCard extends StatelessWidget {
   NewsCard({super.key, required this.news});
  final Articles news;

  String image =
      "https://media.cnn.com/api/v1/images/stellar/prod/230720103524-belarus-wagner-fighters-handout-072023.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp";
  //6:43 AM EDT, Thu July 20, 2023 in Format
   String publishedAt = "2023-07-20T10:09:36Z";

   String author = "CNNIndonasia";
   String title =
      "Belarus to hold exercises with Wagner fighters near Polish border";
  // late late final String time = "2 hours ago";
  @override
  Widget build(BuildContext context) {
    image = news.urlToImage!;
    publishedAt = news.publishedAt!;
    author = news.author ?? news.source?.name ?? "";
    title = news.title!;

    var date = DateTime.parse(publishedAt);
    var time = "";
    //If its same day then convert to "2 hours ago" format
    if (date.day == DateTime.now().day) {
      var diff = DateTime.now().difference(date);
      print(diff);
      var hours = diff.inHours;
      time = "$hours hours ago";
    } else {
      //Convert publishdat to "Month-name day, year"
      var formattedDate = "${months[date.month]} ${date.day},${date.year}";
      time = formattedDate;
    }
    return GestureDetector(
      onTap: () {
        _launchUrl();
      },
      child: Stack(
        children: [
          Container(
            height: 400.h,
            width: 1.sw,
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: Image.network(image).image,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1), BlendMode.dstATop),
              ),
            ),
          ),
          Container(
            height: 400.0,
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.5,
                colors: [Colors.transparent,Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.6)],
                stops: [0.3,0.54, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Container(
              height: 0.2.sh,
              width: 0.7.sw,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 0.3.sw,

                          child: Text(author,style:fontStyle(12.sp, Colors.white, FontWeight.w500),maxLines: 1,)),
                      CircleAvatar(radius: 2,backgroundColor: Colors.white,),
                      Text(time,style: fontStyle(12.sp, Colors.white, FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(title,style: fontStyle(16.sp, Colors.white, FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
  _launchUrl() async {
    if (await canLaunchUrlString(news.url!)) {
      await launchUrlString(news.url!);
    } else {
      throw 'Could not launch ${news.url!}';
    }
  }
}
