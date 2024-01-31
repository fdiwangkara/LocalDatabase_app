import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/pages/create/controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 1,
            ),
            TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                    labelText: "Title", border: OutlineInputBorder())),
            Spacer(
              flex: 1,
            ),
            TextField(
                controller: controller.contentController,
                decoration: InputDecoration(
                    labelText: "Content", border: OutlineInputBorder())),
            Spacer(
              flex: 20,
            ),
            ElevatedButton(onPressed: controller.onSubmit, child: Text("Add")),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      )),
    );
  }
}
