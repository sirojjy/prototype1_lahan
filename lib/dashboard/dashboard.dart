import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:prototype1_lahan/dashboard/model/issueCard.dart';
import 'package:prototype1_lahan/dashboard/model/myCard.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
import 'package:prototype1_lahan/share/appbarNew.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../share/item.dart';
import 'model/tabel_bidang_card.dart';
import 'model/tabel_issue_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Page Controller
    final _controller = PageController();
    late TabController _tabController;
    final _tabs = [
      Tab(text: 'IPAL',),
      Tab(text: 'SPAM',),
      Tab(text: 'DPPT Terpadu',),
    ];

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //appbar
                const AppbarNew(title: 'Dashboard'),
                SizedBox(height: 20,),

                //card
                SizedBox(
                  height: 150,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    controller: _controller,
                    // pageSnapping: false,
                    children: const [
                      MyCard(
                          titleCard: 'IPAL',
                          jumlahBidang: 390,
                          jumlahLuas: 100000,
                          jumlahNilai: 300000000000,
                          color: Color(0xFF10A19D)),
                      MyCard(
                          titleCard: 'SPAM',
                          jumlahBidang: 390,
                          jumlahLuas: 100000,
                          jumlahNilai: 300000000000,
                          color: Color(0xFFFF7000)),
                      MyCard(
                          titleCard: 'DPPT Terpadu',
                          jumlahBidang: 390,
                          jumlahLuas: 100000,
                          jumlahNilai: 300000000000,
                          color: Color(0xFFFFBF00))
                    ],
                  ),
                ),

                const SizedBox(height: 10,),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xFF707070),
                  ),
                ),

                const SizedBox(height: 10,),

                //TAB BAR
                DefaultTabController(length: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        // color: whiteColor,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            TabBar(
                              tabs: [
                                Tab(
                                  text: "IPAL",
                                ),
                                Tab(
                                  text: "SPAM",
                                ),
                                Tab(
                                  text: "DPPT",
                                ),
                              ],
                              indicatorColor: primaryColor,
                              labelColor: blackColor,
                              indicator: MaterialIndicator(
                                height: 5,
                                topLeftRadius: 5,
                                topRightRadius: 5,
                                horizontalPadding: 30,
                                tabPosition: TabPosition.bottom,
                              ),
                            ),
                            SizedBox(height: 10.0,),

                            Padding(padding: EdgeInsets.all(8.0)),
                            
                            TabBarView(children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ]
                            )

                            
                          ],
                        ),
                      ),
                    ),

                ),

                SizedBox(
                  height: 300,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: const [
                      IssueCard()
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                SizedBox(
                  child: TabelBidangCard(),
                ),
                SizedBox(height: 20,),

                //Tabel Issue

                GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventarisasi()))
                  },
                  child: SizedBox(
                    // height: 400,
                    child: TabelIssueCard(),
                  ),
                ),

                SizedBox(height: 20,)

              ],
            ),
          )
        ));
  }
}
