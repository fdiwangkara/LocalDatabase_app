import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/models/note.dart';
import 'package:local_database/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.insertNote,
        child: Icon(Icons.edit),
      ),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notes.length,
            itemBuilder: (context, count) {
              Map<String, dynamic> note = controller.notes[count];
              return ListTile(
                  title: Text(note[titleKey] as String),
                  subtitle: Text(note[contentKey] as String),
                  trailing: PopupMenuButton(
                    itemBuilder: ((context) => [
                      PopupMenuItem(
                        child: Text("Edit"),
                        onTap: () => controller.editNote(count),
                      ),
                      PopupMenuItem(
                        child: Text("Delete"),
                        onTap: () =>
                            controller.removeNote(note[idKey] as int),
                      ),
                    ]),
                  ));
            })),
      ),
    );
  }
}
