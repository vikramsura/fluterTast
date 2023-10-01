import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Provider/shortDataPageProvider.dart';
import 'package:flutter_task/UI/all_data/Button.dart';
import 'package:flutter_task/UI/all_data/appColors.dart';
import 'package:flutter_task/UI/all_data/font_sizes.dart';
import 'package:provider/provider.dart';

import 'homeDetailsPage.dart';

class ShortDataPage extends StatefulWidget {
  const ShortDataPage({Key? key}) : super(key: key);

  @override
  State<ShortDataPage> createState() => _ShortDataPageState();
}

class _ShortDataPageState extends State<ShortDataPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShortDataPageProvider>(builder: (context, provider, child) {
      return SafeArea(
          child: Scaffold(
        body: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: AppheightSize.font150,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: AppwidthSize.font260,
                      height: AppheightSize.font45,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius:
                              BorderRadius.circular(AppheightSize.font16)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.search, color: AppColor.white1),
                                hintText: "Search for colleges, schools....",
                                hintStyle: TextStyle(
                                    color: AppColor.white1,
                                    fontSize: AppheightSize.font14)),
                          ),
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius:
                            BorderRadius.circular(AppheightSize.font16)),
                    height: AppheightSize.font45,
                    width: AppheightSize.font45,
                    child: Image.asset("assets/whh_voice.png"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppheightSize.font10,
          ),
          Container(
            width: AppwidthSize.fontFull,
            height: AppheightSize.font50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.resolveWith(
                                  (states) => BorderSide(color: AppColor.white2)),
                          backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => AppColor.white)),
                      onPressed: () {},
                      child: Text(
                        "MVSH Engineering college",
                        style: TextStyle(color: AppColor.black, fontSize: 10),
                      )),
                );
              },
            ),
          ),
          SizedBox(
            height: AppheightSize.font10,
          ),
          Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.nameText.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeDetailsPage(),
                            ));
                      },
                      child: Container(
                        height: AppheightSize.font240,
                        width: AppwidthSize.font300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.white1,)),
                        child: Column(children: [
                          Stack(
                            children: [
                              Image(image: AssetImage(provider.image[index])),
                              Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Image(
                                      image: AssetImage("assets/Frame59.png"))),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColor.white,
                                    child: Image(
                                      image: AssetImage("assets/saved.png"),
                                      height: AppheightSize.font18,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppheightSize.font10,
                          ),
                          Container(
                            width: AppwidthSize.font260,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      provider.nameText[index],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                      height: AppheightSize.font22,
                                      width: AppwidthSize.font50,
                                      decoration: BoxDecoration(
                                          color: AppColor.Green,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              provider.satar[index],
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13),
                                            ),
                                            Icon(Icons.star,
                                                color: AppColor.white,
                                                size: 16),
                                          ]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppheightSize.font10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: AppwidthSize.font180,
                                        child: Text(
                                          provider.sabNameText[index],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppColor.white2,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    AppButton.appButton(
                                        context,
                                        "Apply",
                                        AppColor.blue,
                                        AppColor.white,
                                        AppwidthSize.font80,
                                        AppheightSize.font22,
                                        10.0)
                                  ],
                                ),
                                SizedBox(
                                  height: AppheightSize.font10,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: AppColor.white2,
                                ),
                                SizedBox(
                                  height: AppheightSize.font10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/Vector2.png"),
                                      height: AppheightSize.font24,
                                      width: AppwidthSize.font28,
                                    ),
                                    Container(
                                        width: AppwidthSize.font130,
                                        child: Text(
                                          provider.comNameText[index],
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                      width: AppwidthSize.font30,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 16,
                                            color: AppColor.white2,
                                          ),
                                          Text(
                                            provider.seen[index],
                                            style: TextStyle(
                                                color: AppColor.white2,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: AppheightSize.font20,
                    )
                  ],
                );
              },
            ),
          )
        ]),
      ));
    });
  }
}
