import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/contants.dart';
import 'package:newsapp/newsprovider.dart';
import 'package:newsapp/ui/common/app_style.dart';
import 'package:newsapp/ui/discover_page/discover.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 0.5.sh,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              alignment: Alignment.centerLeft,
              child: Text('Category', style: fontStyle(25.sp, Colors.black87, FontWeight.w600))),
          Expanded(
            // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: catimg.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    category: categories[index],
                    image:catimg[categories[index]]??"https://images.unsplash.com/photo-1627316198270-4b3b3b5b5b0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2h8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.image});

  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NewsProvider newsProvider = Provider.of<NewsProvider>(context, listen: false);
        newsProvider.setCategory(category);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DiscoverScreen(
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        width: 0.3.sw,
        height: 0.2.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black26,
          ),
          child: Center(
            child: Text(
              category,
              style: fontStyle(20.sp, Colors.white, FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}


