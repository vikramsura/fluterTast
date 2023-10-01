import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/UI/all_data/appColors.dart';
import 'package:flutter_task/UI/all_data/font_sizes.dart';

import '../UI/home_page/shortDataPage.dart';

class HomePageProvider with ChangeNotifier {
  int? isTap;

  List topName = ["Top Colleges", "Top Schools", "Exams"];
  List imageShow = ["assets/home.png", "assets/home2.png", "assets/home3.png"];
  List sabText = [
    "Search   through   thousands    of accredited colleges  and universities online to find the right one for you.  Apply in 3 min, and connect with your future.",
    "Searching for the best school for you just got easier! With our Advanced School Search, you can easily filter out the schools that are fit for you.",
    "Find an end to end information about the exams that are happening in India",
  ];
  List numText = ["+126", "+106", "+16"];
  List nameText = ["Colleges", "Schools", "Exams"];

  void Show(context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: AppColor.white),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListTile(
                    title: Text(
                      "Sort by",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.clear,
                          size: 24,
                        ))),
                Divider(
                  thickness: 1,
                  color: AppColor.white1,
                ),
                SizedBox(
                  height: AppheightSize.font20,
                ),
                listTile(context, "assets/education.png",
                    "Bachelor of Technology", 0),
                listTile(context, "assets/sketch.png",
                    "Bachelor of Architecture", 1),
                listTile(context, "assets/pharmacy.png", "Pharmacy", 2),
                listTile(context, "assets/balance.png", "Law", 3),
                listTile(context, "assets/management.png", "Management", 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile(BuildContext context, image, name, int value) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(name),
      trailing: Radio(
          value: value,
          groupValue: isTap,
          onChanged: (int? values) {
            isTap = values;
            notifyListeners();
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShortDataPage(),

                ));
          }),
    );
  }
}
