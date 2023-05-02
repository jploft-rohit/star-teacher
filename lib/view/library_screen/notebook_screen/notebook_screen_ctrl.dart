import 'package:get/get.dart';
import 'package:staff_app/backend/custom_models/notes_model.dart';

class NotebookScreenCtrl extends GetxController{

  List<NotesModel> unDoneNotesList = <NotesModel>[
    NotesModel("To Do List", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
    NotesModel("Things to Purchase", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
    NotesModel("Home Work", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
    NotesModel("To be learn", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
  ].obs;
  List<NotesModel> doneNotesList = <NotesModel>[].obs;

  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  final selectedIndex3 = 0.obs;
  final selectedColor = 0.obs;
  final isChecked = false.obs;

  List<String> colorList = [
    "FFE7E9",
    "FFF7AA",
    "037D00",
    "EDB494",
    "FFD081",
    "E1C4EB",
    "B5E3B9",
    "CECECE",
  ];
}