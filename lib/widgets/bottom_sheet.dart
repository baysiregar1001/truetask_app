import 'package:flutter/material.dart';
import 'package:truetask_app/services/task_service.dart';
import 'package:truetask_app/services/workspace_service.dart';
import 'package:truetask_app/utils/validator.dart';
import 'package:truetask_app/widgets/input_field.dart';

class BottomSheetCreate extends StatefulWidget {
  const BottomSheetCreate({super.key});

  @override
  State<BottomSheetCreate> createState() => _BottomSheetCreateState();
}

class _BottomSheetCreateState extends State<BottomSheetCreate> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final validator = Validator();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Center(
                child: Text(
                  'Create project',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              trailing: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Project Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputTextField(
                      controller: nameController,
                      validator: (value) =>
                          validator.validateField(field: value!),
                      hintText: 'enter project name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Project Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputTextField(
                      controller: descController,
                      validator: (value) =>
                          validator.validateField(field: value!),
                      hintText: 'enter project name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final createdWorkspace =
                                await FetchWorkspace().createWorkspace(
                              name: nameController.text,
                              description: descController.text,
                            );
                            if (mounted) {
                              Navigator.pop(context);
                              // Navigator.of(context).pushReplacementNamed(
                              //   workspacePage,
                              //   arguments: createdWorkspace,
                              // );
                            }
                          }
                        },
                        child: const Text('Create Project'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTaskSheet extends StatelessWidget {
  const CreateTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final validator = Validator();
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Center(
                child: Text(
                  'Create task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              trailing: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close)),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Task Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputTextField(
                      controller: titleController,
                      validator: (value) =>
                          validator.validateField(field: value!),
                      hintText: 'enter task title',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Task Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputTextField(
                      controller: descController,
                      validator: (value) =>
                          validator.validateField(field: value!),
                      hintText: 'enter task description',
                      obscureText: false,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            FetchTask().createTask(
                              workspaceId:
                                  '6f746630-754d-11ed-80f1-f93360896540',
                              title: titleController.text,
                              description: descController.text,
                              status: '1',
                            );
                          }
                        },
                        child: const Text('Create Task'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
