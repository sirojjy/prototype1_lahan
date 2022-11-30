import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? judulMenu;

  const CustomAppBar({Key? key, this.judulMenu}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          backgroundColor: Color(0xff0CACFF),
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              child:
              SvgPicture.asset("assets/icons/menu_task.svg", color: Color(0xffffffff),),
              // Image.asset(
              //   'assets/images/logo_qai.jpg',
              //   scale: 1,
              //   // height: 10,
              // ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          title: Text(
            '$judulMenu',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Container(
              width: 50,
              child: IconButton(
                icon: Icon(Icons.person),
                onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                },
              ),

            )
          ],
        ),
        preferredSize: preferredSize);
  }
}