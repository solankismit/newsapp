import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/contants.dart';
import 'package:newsapp/model/getnews.dart';
import 'package:newsapp/ui/common/app_style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsListTile extends StatelessWidget {
  NewsListTile({
    Key? key,
    required this.article,
    required this.category,
    required this.orientation,
  }) : super(key: key);
  final Articles article;

    final String category ;
  final Orientation orientation;
   Uri _url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {

    final String? title = article.title ?? "No Title";
    final String? image = article.urlToImage ?? "";
    final String publishedat = article.publishedAt ?? "";
    //Convert publishdat to "Month-name day, year"
    var date = DateTime.parse(publishedat);
    // print(date.year);
    var formattedDate =
        "${months[date.month]} ${date.day},${date.year}";
    String? author = article.author??article.source?.name ?? "".split("")[0];
    //If author is url then split it and get word after www and before .com
    if (author!.contains("www") ) {
      author = author.split("www.")[1].split(".com")[0];
    }
    _url = Uri.parse(article.url ?? "https://google.com");
    return GestureDetector(
      onTap: () {
        _launchUrl();
      },
      child: Container(
        color: Colors.white.withOpacity(0),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        height: orientation == Orientation.portrait ? 0.15.sh : calculateContainerHeight(),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              //Get Height of parent container
              height: orientation == Orientation.portrait ? 0.15.sh : calculateContainerHeight(),
              width: orientation == Orientation.portrait ? 0.15.sh : calculateContainerHeight(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category,style: fontStyle(12.sp, Colors.black45, FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text(title!,style: fontStyle(16.sp, Colors.black87, FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 0.3.sw,

                          child: Text(author!,style:fontStyle(12.sp, Colors.black45, FontWeight.w500),maxLines: 1,)),
                      CircleAvatar(radius: 2,backgroundColor: Colors.black45,),
                      Text(formattedDate,style: fontStyle(12.sp, Colors.black45, FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  double calculateContainerHeight() {
    // Calculate the maximum height based on the available width and the text content
    final titleText = TextSpan(
      text: article.title ?? "No Title",
      style: fontStyle(16.sp, Colors.black87, FontWeight.w600),
    );

    final textPainter = TextPainter(
      text: titleText,
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 200); // Set a maxWidth that works for your case

    final textHeight = textPainter.height;

    return textHeight + 80; // Add some extra space for other elements
  }
}
