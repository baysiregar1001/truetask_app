import 'package:flutter/material.dart';
import 'package:truetask_app/screen/projects/create_meeting.dart';
import 'package:truetask_app/screen/projects/create_team.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/widgets/bottom_sheet.dart';

class MenuPopup extends StatefulWidget {
  const MenuPopup({super.key});

  @override
  State<MenuPopup> createState() => _MenuPopupState();
}

class _MenuPopupState extends State<MenuPopup> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Image(image: AssetImage('assets/icon/add_icon.png')),
      onSelected: (value) {
        switch (value) {
          case 0:
            Navigator.of(context).pushNamed(addProjectPage);
            break;
          case 1:
            Navigator.of(context).pushNamed(createTaskPage);
            break;
          case 2:
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CreateTeam()));
            break;
          case 3:
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CreateMeeting()));
            break;
          default:
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.workspaces_outline,
                color: Colors.black87,
              ),
              SizedBox(width: 10),
              Text("Create project", style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.task_outlined,
                color: Colors.black87,
              ),
              SizedBox(width: 10),
              Text("Create task", style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.people_alt_outlined,
                color: Colors.black87,
              ),
              SizedBox(width: 10),
              Text("Create team", style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.settings_outlined,
                color: Colors.black87,
              ),
              SizedBox(width: 10),
              Text("Create meeting", style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }

  _showCreateProject() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetCreate();
      },
    );
  }

  _showCreateTask() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) {
        return const CreateTaskSheet();
      },
    );
  }
}
