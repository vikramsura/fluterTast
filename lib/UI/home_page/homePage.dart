import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Provider/homePageProvider.dart';
import 'package:flutter_task/UI/all_data/appColors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task/UI/all_data/font_sizes.dart';

import 'shortDataPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    devicewidth(MediaQuery.of(context).size.width);
    deviceHeight(MediaQuery.of(context).size.height);
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return SafeArea(
        child: Scaffold(
          body: Column(children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: AppheightSize.font200,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Find your own way",
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: AppheightSize.font20,
                                fontWeight: FontWeight.w800),
                          ),
                          Stack(
                            children: [
                              Image.asset("assets/Vector.png"),
                              Positioned(
                                right: 1,
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColor.red,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppheightSize.font10,
                      ),
                      Text(
                        "Search in 600 colleges around!",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: AppheightSize.font14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: AppheightSize.font30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: AppwidthSize.font260,
                              height: AppheightSize.font45,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                      AppheightSize.font16)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        prefixIcon: Icon(Icons.search,
                                            color: AppColor.white1),
                                        hintText:
                                            "Search for colleges, schools....",
                                        hintStyle: TextStyle(
                                            color: AppColor.white1,
                                            fontSize: AppheightSize.font14)),
                                  ),
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(
                                    AppheightSize.font16)),
                            height: AppheightSize.font45,
                            width: AppheightSize.font45,
                            child: Image.asset("assets/whh_voice.png"),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: AppheightSize.font10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: provider.topName.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        provider.Show(context);
                      });
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: AppheightSize.font150,
                            width: AppwidthSize.font300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(provider.imageShow[index]))),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      provider.topName[index],
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: AppheightSize.font20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: AppheightSize.font6,
                                    ),
                                    Container(
                                      width: AppwidthSize.font200,
                                      child: Text(
                                        provider.sabText[index],
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: AppheightSize.font12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 30,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: (provider.numText[index]+" "),
                                style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(
                                text: (provider.nameText[index]),
                                style: TextStyle(
                                    color: AppColor.white2,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w800))
                          ])),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      );
    });
  }
}
