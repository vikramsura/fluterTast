import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/UI/all_data/font_sizes.dart';
import 'package:flutter_task/UI/home_page/accountPage.dart';
import 'package:flutter_task/UI/home_page/savedData.dart';
import 'package:flutter_task/UI/home_page/savedPage.dart';

import 'all_data/appColors.dart';
import 'home_page/homePage.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({
    Key? key,
  }) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  var _currentIndex = 0;
  List allData = [HomePage(), SavedPage(), SavedData(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: allData[_currentIndex],
      bottomNavigationBar: Container(
        height: AppheightSize.font75,
        width: AppwidthSize.fontFull,
        decoration: BoxDecoration(color: AppColor.blue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBarItem(
                context, 0, "Search", 'assets/fluent_home-48-filled.png'),
            buildBarItem(context, 1, "Saved", "assets/Group.png"),
            buildBarItem(context, 2, "Saved", "assets/Discovery.png"),
            buildBarItem(context, 3, "account", 'assets/Vector1.png'),
          ],
        ),
      ),
    ));
  }

  Widget buildBarItem(BuildContext context, index, name, image) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            color: _currentIndex == index ? AppColor.white : AppColor.white3,
            height: AppheightSize.font24,
            width: AppwidthSize.font24,
          ),
          SizedBox(
            height: AppheightSize.font6,
          ),
          Text(
            name,
            style: TextStyle(
                color:
                    _currentIndex == index ? AppColor.white : AppColor.white3,
                fontWeight: FontWeight.w700,
                fontSize: 10),
          ),
          SizedBox(
            height: AppheightSize.font6,
          ),
          Container(
            height: 2,
            width: AppwidthSize.font60,
            color: _currentIndex == index ? Colors.white : Colors.transparent,
          )
        ],
      ),
    );
  }
}
