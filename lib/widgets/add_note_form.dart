
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/features/add_note_cubit/presentation/cubit/add_note_cubit.dart';
import 'package:notes_app/modals/note_model.dart';
import 'package:notes_app/widgets/Custom_bottom.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child:  Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              onSaved: (value){
                title = value;
              },
              hint: 'Title',
              ),
            const SizedBox(height: 16,),
            CustomTextField(
              onSaved: (value){
                subTitle = value;
              },
              hint: 'Content',
              maxLines: 5,
              ),
              const SizedBox(height: 32,),
            const ColorListView(),
            const SizedBox(height: 32,),
              BlocBuilder<AddNoteCubit, AddNotesState>(
                builder: (context, state){
                  return  CustomButton(
                    isLoading: state is AddNotesLoading ? true : false,
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formattedCurrentDate = DateFormat("EEEE, dd-M-yyyy").format(currentDate);
                      var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else{
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {
                        
                      });
                    }
                  },
                );
                }
              ),
          const SizedBox(height: 16,),
          ],
        
      ),
    );
  }
}