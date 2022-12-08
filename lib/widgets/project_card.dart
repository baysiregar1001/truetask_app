import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectName,
    required this.description,
  });

  final String projectName, description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    projectName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.centerEnd,
                  children: const [
                    Positioned(
                      right: 45,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(
                          'assets/image/Avatar1.png',
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(
                          'assets/image/Avatar2.png',
                        ),
                      ),
                    ),
                    Positioned(
                      right: 15,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(
                          'assets/image/Avatar3.png',
                        ),
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 16,
                        child: Text(
                          "+4",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
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
