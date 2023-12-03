// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/features/add_note_cubit/presentation/cubit/add_note_cubit.dart';
import 'package:notes_app/modals/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);


  runApp(const NotesApp());
}


class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override

  
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins'
      ),
      home: const NotesView(),
    );
  }
}


initialServices() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
