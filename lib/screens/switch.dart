import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:day5/screens/add.dart';
import 'package:day5/screens/home.dart';
import 'package:day5/screens/products.dart';
import 'package:flutter/material.dart';

class Switchss extends StatefulWidget {
  const Switchss({super.key});

  @override
  State<Switchss> createState() => _SwitchssState();
}

class _SwitchssState extends State<Switchss> {
  List<Widget> anything =[
    Homes(),
    Adds(),
    Products()
  ];
  int _page=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
         bottomNavigationBar: ConvexAppBar(
           style: TabStyle.react,
           items: [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => {
       _page=i,
       setState(() {})
        },
      ),
    body:anything[_page],
    
    
    );
  
  }
}