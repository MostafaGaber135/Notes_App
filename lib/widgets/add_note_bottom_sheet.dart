import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/features/add_note_cubit/presentation/cubit/add_note_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/widgets/add_note_form.dart';
class AddNoteBottomSheet extends StatelessWidget{
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return  BlocProvider(
  create: (context) => AddNoteCubit(),
  child: BlocConsumer<AddNoteCubit, AddNotesState> (
    listener: (context, state) {
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
        child: Padding(
          padding:  EdgeInsets.only(left: 16, right: 16,
           bottom: MediaQuery.of(context).viewInsets.bottom
           ),
          
          child: const SingleChildScrollView(
            child: AddNoteForm()
            ),
        ),
      );
    }
  ),
);
  }
}
