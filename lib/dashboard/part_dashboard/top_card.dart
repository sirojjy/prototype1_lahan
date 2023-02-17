import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/top_card/top_card_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/my_card.dart';

class TopCard extends StatefulWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
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

    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        BlocBuilder<TopCardBloc, TopCardState>(
          bloc: BlocProvider.of<TopCardBloc>(context)..add(OnJumlahIpalEvent()),
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
                      // jumlahNilai: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(state.nilai_ipal ?? '0'),
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

        Center(
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xFF707070),
            ),
          ),
        )
      ],
    );
  }
}
