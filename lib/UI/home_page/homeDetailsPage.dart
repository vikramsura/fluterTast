import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_task/Provider/homeDetailsPageProvider.dart';
import 'package:flutter_task/UI/all_data/Button.dart';
import 'package:flutter_task/UI/all_data/appColors.dart';
import 'package:flutter_task/UI/all_data/font_sizes.dart';
import 'package:provider/provider.dart';

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({Key? key}) : super(key: key);

  @override
  State<HomeDetailsPage> createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeDetailsPageProvider>(
        builder: (context, provider, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: AppheightSize.font260,
                    width: AppwidthSize.fontFull,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Page4.png"))),
                  ),
                  Container(
                    height: AppheightSize.font80,
                    color: AppColor.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColor.white,
                                child: Image.asset("assets/back.png"),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColor.white,
                              child: Image.asset("assets/saved.png"),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppheightSize.font20,
              ),
              Container(
                width: AppwidthSize.font300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GHJK Engineering college",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: AppheightSize.font10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppwidthSize.font240,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Felis consectetur nulla pharetra praesent hendrerit vulputate viverra. Pellentesque aliquam tempus faucibus est.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.white2),
                            ),
                          ),
                          Container(
                            height: AppheightSize.font75,
                            width: AppwidthSize.font50,
                            decoration: BoxDecoration(
                                color: AppColor.Green,
                                borderRadius: BorderRadius.circular(6)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "4.3",
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18),
                                  ),
                                  Icon(Icons.star,
                                      color: AppColor.white, size: 20),
                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppheightSize.font20,
                      ),
                      Container(
                        color: AppColor.white,
                        height: AppheightSize.font45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildLabelTab(0, "About college"),
                            buildLabelTab(1, "Hostel facility"),
                            buildLabelTab(2, "Q & A"),
                            buildLabelTab(3, "Events"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppheightSize.font30,
                      ),
                      tabWidget(provider, context),
                    ]),
              ),
            ]),
          ),
        ),
      );
    });
  }

  Widget buildLabelTab(value, name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              tabIndex = value;
            });
          },
          child: Text(
            name,
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w900,
                fontSize: 10),
          ),
        ),
        SizedBox(
          height: AppheightSize.font14,
        ),
        Container(
            height: 2,
            width: AppwidthSize.font60,
            color: tabIndex == value ? AppColor.blue : Colors.transparent)
      ],
    );
  }

  Widget aboutCollegeWidget(
      HomeDetailsPageProvider provider, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
              color: AppColor.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        SizedBox(
          height: AppheightSize.font10,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.",
          style: TextStyle(
              color: AppColor.white3,
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
        SizedBox(
          height: AppheightSize.font20,
        ),
        Text(
          "Location",
          style: TextStyle(
              color: AppColor.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        SizedBox(
          height: AppheightSize.font10,
        ),
        Container(
          height: AppheightSize.font150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage("assets/Background.png"))),
        ),
        SizedBox(
          height: AppheightSize.font20,
        ),
        Text(
          "Student Review",
          style: TextStyle(
              color: AppColor.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        SizedBox(
          height: AppheightSize.font10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppwidthSize.font200,
              height: AppheightSize.font70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.StudentReview.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            provider.reviewData = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: AppwidthSize.font45,
                            height: AppheightSize.font45,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        provider.StudentReview[index])),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                          ),
                        ),
                      ),
                      provider.reviewData == index
                          ? Image.asset(
                              "assets/Polygon1.png",
                              height: AppheightSize.font16,
                            )
                          : SizedBox(),
                    ],
                  );
                },
              ),
            ),
            Column(
              children: [
                Container(
                  width: AppwidthSize.font75,
                  height: AppheightSize.font45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppheightSize.font6,
                      ),
                      Text(
                        "+12",
                        style: TextStyle(
                            color: AppColor.blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppheightSize.font20,
                )
              ],
            )
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.userName[provider.reviewData],
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                SizedBox(
                  height: AppheightSize.font10,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec sed lorem nunc varius rutrum eget dolor, quis. Nulla sit magna suscipit tellus malesuada in facilisis a.",
                  style: TextStyle(
                      color: AppColor.white2,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                SizedBox(
                  height: AppheightSize.font10,
                ),
                RatingBar.builder(
                  unratedColor: AppColor.white1,
                  itemSize: AppheightSize.font16,
                  initialRating: provider.userRating[provider.reviewData],
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppheightSize.font30,
        ),
        AppButton.appButton(context, "Apply Now", AppColor.blue, AppColor.white,
            AppwidthSize.fontFull, AppheightSize.font45, 20.0),
        SizedBox(
          height: AppheightSize.font30,
        ),
      ],
    );
  }

  int _currentPage = 0;

  Widget hostelFacilityWidget(
      HomeDetailsPageProvider provider, BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: AppheightSize.font30,
            width: AppwidthSize.font60,
            decoration: BoxDecoration(
                color: AppColor.blue, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("assets/bed1.png")),
                Text(
                  "4",
                  style: TextStyle(color: AppColor.white, fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            height: AppheightSize.font30,
            width: AppwidthSize.font60,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue),
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("assets/bed2.png")),
                Text(
                  "3",
                  style: TextStyle(color: AppColor.black, fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            height: AppheightSize.font30,
            width: AppwidthSize.font60,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue),
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("assets/bed2.png")),
                Text(
                  "2",
                  style: TextStyle(color: AppColor.black, fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            height: AppheightSize.font30,
            width: AppwidthSize.font60,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue),
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("assets/bed2.png")),
                Text(
                  "1",
                  style: TextStyle(color: AppColor.black, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: AppheightSize.font20,
      ),
      Container(
        width: AppwidthSize.fontFull,
        height: AppheightSize.font150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: provider.hostelRoom.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  _currentPage = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: AppwidthSize.font150,
                  height: AppheightSize.font150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(provider.hostelRoom[index])),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white),
                ),
              ),
            );
          },
        ),
      ),
      SizedBox(
        height: AppheightSize.font20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: AppwidthSize.font40,
            height: AppheightSize.font14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColor.blue
                              : AppColor.white1,
                          borderRadius: BorderRadius.circular(8)),
                      height: 10,
                      width: _currentPage == 0 ? 10 : 10,
                    ),
                    SizedBox(
                      width: AppwidthSize.font6,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
      SizedBox(
        height: AppheightSize.font20,
      ),
      Center(
        child: Container(
          width: AppwidthSize.font300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "GHJK Engineering Hostel",
                    style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Container(
                    height: AppheightSize.font22,
                    width: AppwidthSize.font50,
                    decoration: BoxDecoration(
                        color: AppColor.Green,
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "4.3",
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13),
                          ),
                          Icon(Icons.star, color: AppColor.white, size: 16),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: AppheightSize.font20,
              ),
              Row(
                children: [
                  Image.asset("assets/location1.png"),
                  SizedBox(
                    width: AppwidthSize.font10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur ",
                    style: TextStyle(
                        color: AppColor.white3,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: AppheightSize.font20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque accumsan, scelerisque eget lectus ullamcorper a placerat. Porta cras at pretium varius purus cursus. Morbi justo commodo habitant morbi quis pharetra posuere mauris. Morbi sit risus, diam amet volutpat quis. Nisl pellentesque nec facilisis ultrices.",
                style: TextStyle(
                    color: AppColor.white2,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              SizedBox(
                height: AppheightSize.font20,
              ),
              Text(
                "Facilities",
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              SizedBox(
                height: AppheightSize.font20,
              ),
              Row(
                children: [
                  Image.asset("assets/university1.png"),
                  SizedBox(
                    width: AppwidthSize.font10,
                  ),
                  Text(
                    "College in 400mtrs",
                    style: TextStyle(
                        color: AppColor.white3,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: AppheightSize.font20,
              ),
              Row(
                children: [
                  Image.asset("assets/bath1.png"),
                  SizedBox(
                    width: AppwidthSize.font10,
                  ),
                  Text(
                    "Bathrooms : 2",
                    style: TextStyle(
                        color: AppColor.white3,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: AppheightSize.font60,
              ),
              AppButton.appButton(
                  context,
                  "Apply Now",
                  AppColor.blue,
                  AppColor.white,
                  AppwidthSize.fontFull,
                  AppheightSize.font45,
                  20.0),
              SizedBox(
                height: AppheightSize.font30,
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  int tabIndex = 0;

  tabWidget(HomeDetailsPageProvider provider, BuildContext context) {
    if (tabIndex == 0) {
      return aboutCollegeWidget(provider, context);
    } else if (tabIndex == 1) {
      return hostelFacilityWidget(provider, context);
    } else if (tabIndex == 2) {
      return Center(
          child: AppButton.appButton(
              context,
              "Hello",
              AppColor.Green,
              AppColor.black,
              AppheightSize.font200,
              AppheightSize.font60,
              22.0));
    } else {
      return Center(
          child: AppButton.appButton(
              context,
              "Ram Ram",
              AppColor.red,
              AppColor.white,
              AppheightSize.font200,
              AppheightSize.font60,
              22.0));
    }
  }
}
