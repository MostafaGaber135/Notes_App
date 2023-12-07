import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?  CircleAvatar(
      backgroundColor: Colors.white,
      radius: 38,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ) : CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

List<Color> colors = [
  const Color(0XFF355070),
  const Color(0XFF79c7c5),
  const Color(0XFF355070),
  const Color(0XFFEDC9AF),
  const Color(0XFF013220),
  const Color(0XFF00401A),
  const Color(0XFF008080),
  const Color(0XFF0D98BA),
  const Color(0XFF007BA7),
  const Color(0XFF0070BB),
];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap:(){
                    currentIndex = index;
                    setState(() {
                      
                    });
              },
              
              child: ColorItem(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            ));
        },
      ),
    );
  }
}