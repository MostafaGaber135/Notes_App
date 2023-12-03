// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/features/add_note_cubit/presentation/cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
class AddNoteBottomSheet extends StatelessWidget{
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return  BlocProvider(
  create: (context) => AddNoteCubit(),
  child:   BlocConsumer<AddNoteCubit, AddNotesState> (
    listener: (context, state){
      if(state is AddNotesFailure ){
        print('failed ${state.errMessage}');
    }  
      if(state is AddNotesSuccess){
        Navigator.pop(context);
      }
    },
    builder:(context, state){
    return AbsorbPointer(
      absorbing: state is AddNotesLoading ? true : false,
      child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
        child: AddNoteForm()
        ),
      ),
    );
    }
  
  ),
);
  }
}
