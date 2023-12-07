
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/features/add_note_cubit/features/notes/presentation/notes_cubit/notes_cubit.dart';
import 'package:notes_app/modals/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget{
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomAppBar(
            onPressed: (){
              
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              
              
            },
            title: 'Edit Note',
            icon: Icons.check,
            ),
            const SizedBox(height: 50,),
          CustomTextField(
          onChanged: (value){
            title = value;
          },
          hint: widget.note.title,
          ),
        const SizedBox(height: 16,),
        CustomTextField(
        onChanged: (value){
          content = value;
        },
        hint: widget.note.subTitle,
        maxLines: 5,
        
        ),
        ],
      ),
    );
  }}