import 'package:get/get.dart';
import 'package:local_database/db/db_helper.dart';
import 'package:local_database/models/note.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  Database db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Map<String, Object?>> notes;


  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    notes = await db.query("Notes");
    await Future.delayed(Duration(milliseconds: 1000));
    isLoading.value = false;
  }

  void editNote(int index) async {
    Note oldNote = Note.fromMap(map: notes[index]);
    var newNote = await Get.toNamed("/create", arguments: oldNote);
    newNote = newNote as Note?;
    if (newNote != null) {
      await db.update("Notes", newNote.toMap(),
          where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }

  void removeNote(int id) async {
    await db.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void insertNote() async {
    var newNote = await Get.toNamed("/create");
    newNote = newNote as Note?;
    if (newNote != null) {
      await db.insert("Notes", newNote.toMap());
      getNotes();
    }
  }
}