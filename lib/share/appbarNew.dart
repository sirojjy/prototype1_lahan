import 'package:flutter/material.dart';
import 'package:prototype1_lahan/share/item.dart';
import 'package:sidebarx/sidebarx.dart';

class AppbarNew extends StatelessWidget {
  final String title;
   AppbarNew({Key? key,
     required this.title,
   }) :
         super(key: key);
  // final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkColor
      ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo-ikn.png',
              height: 25,
            ),
            Text(title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child:
                Icon(Icons.menu,color: whiteColor,)
              // SidebarX(
              //   controller: _controller,
              //   theme: SidebarXTheme(
              //     margin: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: canvasColor,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     hoverColor: scaffoldBackgroundColor,
              //     textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              //     selectedTextStyle: const TextStyle(color: Colors.white),
              //     itemTextPadding: const EdgeInsets.only(left: 30),
              //     selectedItemTextPadding: const EdgeInsets.only(left: 30),
              //     itemDecoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: canvasColor),
              //     ),
              //     selectedItemDecoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(
              //         color: actionColor.withOpacity(0.37),
              //       ),
              //       gradient: const LinearGradient(
              //         colors: [accentCanvasColor, canvasColor],
              //       ),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.28),
              //           blurRadius: 30,
              //         )
              //       ],
              //     ),
              //     iconTheme: IconThemeData(
              //       color: Colors.white.withOpacity(0.7),
              //       size: 20,
              //     ),
              //     selectedIconTheme: const IconThemeData(
              //       color: Colors.white,
              //       size: 20,
              //     ),
              //   ),
              //   extendedTheme: const SidebarXTheme(
              //     width: 200,
              //     decoration: BoxDecoration(
              //       color: canvasColor,
              //     ),
              //   ),
              //   footerDivider: divider,
              //   headerBuilder: (context, extended) {
              //     return SizedBox(
              //       height: 100,
              //       child: Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Image.asset('assets/images/avatar.png'),
              //       ),
              //     );
              //   },
              //   items: [
              //     SidebarXItem(
              //       icon: Icons.home,
              //       label: 'Home',
              //       onTap: () {
              //         debugPrint('Home');
              //       },
              //     ),
              //     const SidebarXItem(
              //       icon: Icons.search,
              //       label: 'Search',
              //     ),
              //     const SidebarXItem(
              //       icon: Icons.people,
              //       label: 'People',
              //     ),
              //     const SidebarXItem(
              //       icon: Icons.favorite,
              //       label: 'Favorites',
              //     ),
              //     const SidebarXItem(
              //       iconWidget: FlutterLogo(size: 20),
              //       label: 'Flutter',
              //     ),
              //   ],
              // ),
            )
          ],
        ),
    );
  }
}


const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
