import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori_card/kategori_card_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../share/item.dart';
import '../../model/bidang_pie_chart.dart';
import '../../model/issue_bar.dart';
import '../../model/kelengkapan_dok_bar.dart';
import '../../model/luas_chart_donut.dart';
import '../../model/tabel_bidang_card.dart';

class KategoriCard extends StatefulWidget {
  const KategoriCard({Key? key}) : super(key: key);

  @override
  State<KategoriCard> createState() => _KategoriCardState();
}

class _KategoriCardState extends State<KategoriCard> {
  SharedPreferences? pref;

  @override
  void initState() {
    getPref();
    super.initState();
  }
  void getPref() async{
    pref = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KategoriCardBloc, KategoriCardState>(
      bloc: BlocProvider.of<KategoriCardBloc>(context)..add(ViewKategoriCard()),
      builder: (context, state){
        return DefaultTabController(length: 3,
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
                        ///TAB IPAL
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const SizedBox(
                                  child: LuasChartDonut()
                              ),

                              const SizedBox(height: 10,),

                              const SizedBox(
                                  child: TabelBidangCard()
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

                              SizedBox(height: 10,),

                              BidangPieChart(),

                              SizedBox(height: 10,),

                              KelengkapanBidang(),

                            ],
                          ),
                        ),

                        ///TAB SPAM
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
                                  child: TabelBidangCard()
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

                              SizedBox(height: 10,),

                              BidangPieChart(),

                              SizedBox(height: 10,),

                              KelengkapanBidang(),

                            ],
                          ),
                        ),

                        ///TAB DPPT
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
                                  child: TabelBidangCard()
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

                              SizedBox(height: 10,),

                              BidangPieChart(),

                              SizedBox(height: 10,),

                              KelengkapanBidang(),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }


}
