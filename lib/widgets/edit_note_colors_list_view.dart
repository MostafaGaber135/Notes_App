
  import 'package:flutter/material.dart';
import 'package:Notex/constants.dart';
import 'package:Notex/modals/note_model.dart';
import 'package:Notex/widgets/colors_list_view.dart';
class EditNotesColorsList extends StatefulWidget {
    const EditNotesColorsList({super.key, required this.note});
    final NoteModel note;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
    late int currentIndex;
    @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap:(){
                    currentIndex = index;
                    widget.note.color = kColors[index].value;
                        
                    setState(() {
                  }
                );
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color : kColors[index],
              ),
            ));
        },
      ),
    );
    }
}