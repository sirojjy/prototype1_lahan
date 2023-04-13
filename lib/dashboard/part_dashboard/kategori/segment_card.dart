import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype1_lahan/dashboard/part_dashboard/kategori/bloc/kategori_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/my_card.dart';

class SegmentCard extends StatefulWidget {
  const SegmentCard({Key? key}) : super(key: key);

  @override
  State<SegmentCard> createState() => _SegmentCardState();
}

class _SegmentCardState extends State<SegmentCard> {
  final _controller = PageController(
    viewportFraction: 0.9,
    initialPage: 1,
  );
  late TabController _tabController;
  final _tabs = [
    const Tab(text: 'IPAL',),
    const Tab(text: 'SPAM',),
    const Tab(text: 'DPPT Terpadu',),
  ];

  SharedPreferences? pref;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<KategoriBloc>(context).add(OnKategoriEvent());
    getPref();
  }
  void getPref() async{
    pref = await SharedPreferences.getInstance();

    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KategoriBloc, KategoriState>(
        bloc: BlocProvider.of<KategoriBloc>(context)..add(OnKategoriEvent()),
        builder: (context, state) {
          // final String formattedIpal = state.ipal ?? '0';
          // final String formattedLuasIpal = state.luas_ipal ?? '0';
          //         // .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
          // final String formattedNilaiIpal = state.nilai_ipal ?? '0';
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 150,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  controller: _controller,
                  pageSnapping: true,
                  children: [
                    MyCard(
                      titleCard: 'IPAL',
                      jumlahBidang: state.ipal,
                      // double.parse(state.ipal!)
                      jumlahLuas: state.luas_ipal,
                      jumlahNilai: state.nilai_ipal,
                      // jumlahNilai: NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(state.nilai_ipal ?? '0'),
                      color: const Color(0x0ff2da69b)),
                    MyCard(
                      titleCard: 'SPAM',
                      jumlahBidang: state.spam ?? '',
                      jumlahLuas: state.luas_spam ?? '',
                      jumlahNilai: state.nilai_spam ?? '0',
                      color: const Color(0x0ff34C5D8)),
                    MyCard(
                      titleCard: 'DPPT Terpadu',
                      jumlahBidang: state.dppt ?? '',
                      jumlahLuas: state.luas_dppt ?? '',
                      jumlahNilai: state.nilai_dppt ?? '0',
                      color: const Color(0x0ffB3B300))
                  ],
                ),
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
    );
  }
}
