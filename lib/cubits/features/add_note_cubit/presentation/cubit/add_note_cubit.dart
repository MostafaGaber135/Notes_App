import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/modals/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(AddNotesInitial());


  addNote(NoteModel note) async{
    emit(AddNotesLoading());
    try {
  var notesBox = Hive.box<NoteModel>(kNotesBox);
  await notesBox.add(note);
  emit(AddNotesSuccess());
} catch (e) {
  emit(AddNotesFailure(errMessage: e.toString()));
}
  }
}
