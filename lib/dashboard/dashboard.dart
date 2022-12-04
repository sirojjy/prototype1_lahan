import 'package:flutter/material.dart';
import 'package:prototype1_lahan/dashboard/model/issueCard.dart';
import 'package:prototype1_lahan/dashboard/model/myCard.dart';
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

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //appbar
                const AppbarNew(title: 'Dashboard'),

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
                // const SizedBox(height: 20,),

                //Issue
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
                SizedBox(
                  height: 400,
                  child: TabelIssueCard(),
                )

              ],
            ),
          )
        ));
  }
}
