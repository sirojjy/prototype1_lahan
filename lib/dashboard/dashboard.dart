import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:prototype1_lahan/dashboard/bloc/dashboard_bloc.dart';
import 'package:prototype1_lahan/dashboard/model/bidang_pie_chart.dart';
import 'package:prototype1_lahan/dashboard/model/kelengkapan_dok_bar.dart';
import 'package:prototype1_lahan/dashboard/model/luas_chart_donut.dart';
import 'package:prototype1_lahan/dashboard/model/my_card.dart';
import 'package:prototype1_lahan/inventarisasi/inventarisasi.dart';
import 'package:prototype1_lahan/share/appbarNew.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../share/item.dart';
import 'model/issue_bar.dart';
import 'model/tabel_bidang_card.dart';
import 'model/tabel_issue_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _controller = PageController();
  late TabController _tabController;
  final _tabs = [
    const Tab(text: 'IPAL',),
    const Tab(text: 'SPAM',),
    const Tab(text: 'DPPT Terpadu',),
  ];

  SharedPreferences? pref;
  var id_klien;
  var ipal;
  var spam;
  var dppt;
  var luas_ipal;
  var luas_spam;
  var luas_dppt;
  var nilai_ipal;
  var nilai_spam;
  var nilai_dppt;
  var message;


  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }
  void getPref() async{
    pref = await SharedPreferences.getInstance();

    setState(() {
      // ipal =  as double;
    });

  }

  @override
  Widget build(BuildContext context) {
    // Page Controller
    return Scaffold(

        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //appbar
                const AppbarNew(title: 'Dashboard'),
                const SizedBox(height: 20,),

                //card
                BlocBuilder<DashboardBloc, DashboardState>(
                  bloc: BlocProvider.of<DashboardBloc>(context)..add(OnJumlahIpalEvent()),
                  builder: (context, state) {
                    return SizedBox(
                    height: 150,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      physics: const PageScrollPhysics(),
                      controller: _controller,
                      // pageSnapping: false,
                      children:  [
                        MyCard(
                            titleCard: 'IPAL',
                            jumlahBidang: state.ipal ?? '',
                            // double.parse(state.ipal!)

                            jumlahLuas: state.luas_ipal ?? '',
                            jumlahNilai: state.nilai_ipal ?? '0',
                            color: Color(0xFF10A19D)),
                        MyCard(
                            titleCard: 'SPAM',
                            jumlahBidang: state.spam ?? '',
                            jumlahLuas: state.luas_spam ?? '',
                            jumlahNilai: state.nilai_spam ?? '0',
                            color: Color(0xFFFF7000)),
                        MyCard(
                            titleCard: 'DPPT Terpadu',
                            jumlahBidang: state.dppt ?? '',
                            jumlahLuas: state.luas_dppt ?? '',
                            jumlahNilai: state.nilai_dppt ?? '0',
                            color: Color(0xFFFFBF00))
                      ],
                    ),
                  );
  },
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
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            TabBar(
                              tabs: const [
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
                            const SizedBox(height: 10.0,),
                            SizedBox(
                              height: 1500,
                              child: TabBarView(
                                children: [
                                  Container(
                                    child: ListView(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      children: [
                                        const SizedBox(
                                            child:const LuasChartDonut()
                                        ),

                                        const SizedBox(height: 10,),

                                        const SizedBox(
                                            child: const TabelBidangCard()
                                        ),

                                        const SizedBox(height: 10,),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent[100],
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: const Text(
                                              'Terdapat 16 Issue open pada kategori IPAL',
                                              style: TextStyle(color: whiteColor),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 10,),

                                        const IssueBar(),

                                        const SizedBox(height: 10,),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: const Text(
                                              'Total Bidang Area IPAL (IPAL 1+TPST, IPAL 2, dan IPAL 3) : 31 Bidang',
                                              style: const TextStyle(color: whiteColor),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 10,),

                                        const BidangPeChart(),

                                        const SizedBox(height: 10,),

                                        const KelengkapanBidang(),

                                      ],
                                    ),
                                  ),

                                  const Icon(Icons.star),

                                  const Icon(Icons.star),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ),
                //END TABBAR

                const SizedBox(height: 20,),

                //Tabel Issue

                GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventarisasi()))
                  },
                  child: const SizedBox(
                    // height: 400,
                    child: TabelIssueCard(),
                  ),
                ),

                const SizedBox(height: 20,)

              ],
            ),
          )
        ));
  }
}
