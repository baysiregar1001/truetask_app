import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectName,
    required this.description,
    required this.userWorkspace,
  });

  final String projectName, description;
  final Widget userWorkspace;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  projectName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                ),
                userWorkspace
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.date_range,
                  size: 16,
                  color: Colors.grey,
                ),
                SizedBox(width: 4),
                Text("12-11-2022"),
                SizedBox(width: 8),
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                SizedBox(width: 8),
                Icon(
                  Icons.date_range,
                  size: 16,
                  color: Colors.blue,
                ),
                Text("12-11-2022", style: TextStyle(color: Colors.blue))
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text("50%"),
                const SizedBox(width: 8),
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const LinearProgressIndicator(value: 0.5))),
                const SizedBox(width: 8),
                const Text("24/48 tasks")
              ],
            )
          ],
        ),
      ),
    );
  }
}
