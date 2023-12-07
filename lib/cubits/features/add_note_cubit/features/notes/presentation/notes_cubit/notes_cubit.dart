import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/modals/note_model.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
List<NoteModel>? notes;
fetchAllNotes() async {
  var notesBox = Hive.box<NoteModel>(kNotesBox);
  notesBox.values.toList();
  }
}
