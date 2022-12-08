import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/get_tasks.dart';
import 'package:truetask_app/viewmodels/get_workspace.dart';
import 'package:truetask_app/widgets/project_card.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab>
    with AutomaticKeepAliveClientMixin<OverviewTab> {
  final listTaskViewModel = ListTaskViewModel();
  final listWorkspaceViewModel = ListWorkspaceViewModel();

  int swiperIndex = 0;
  String? workspaceId;

  @override
  bool get wantKeepAlive => true;

  Future<WorkspaceTasks?> fetchTasks() =>
      Future.delayed(Duration(seconds: workspaceId == null ? 3 : 1), () {
        workspaceId =
            listWorkspaceViewModel.workspaces![swiperIndex].workspace!.id;
        return listTaskViewModel.fetchTasks(workspaceId);
      });

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/icon/ourproject.png'),
            title: const Text(
              'Our Project',
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(projectPage),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          FutureBuilder<List<WorkspaceViewModel>?>(
            future: listWorkspaceViewModel.fetchWorkspaces(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                return SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    index: swiperIndex,
                    // onTap: (index) => Navigator.of(context).pushNamed(
                    //     workspacePage,
                    //     arguments: data[index].workspace),
                    onIndexChanged: (index) {
                      setState(() {
                        swiperIndex = index;
                      });
                    },
                    layout: SwiperLayout.STACK,
                    axisDirection: AxisDirection.right,
                    itemWidth: 300,
                    itemBuilder: (BuildContext context, int index) {
                      return ProjectCard(
                        projectName: data[index].workspace!.name!,
                        description: data[index].workspace!.description!,
                      );
                    },
                    itemCount: data.length,
                    pagination: const SwiperPagination(),
                  ),
                );
              } else {
                return const Center(child: Text("No project"));
              }
            },
          ),
          ListTile(
            leading: Image.asset('assets/icon/Task.png'),
            title: const Text(
              'Our Task',
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: () => Navigator.of(context).pushNamed(taskPage),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          FutureBuilder<WorkspaceTasks?>(
            future: fetchTasks(),
            builder: (context, snapshot) {
              print(workspaceId);
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data == null) {
                return const Center(child: Text("No task"));
              } else if (snapshot.data!.workspaceMain!.tasks!.isNotEmpty) {
                final data = snapshot.data!.workspaceMain!;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.tasks!.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 3,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: Image.asset('assets/icon/task_icon.png'),
                            title: Text(data.tasks![index].title!),
                            subtitle: Row(
                              children: const [
                                Icon(Icons.date_range, size: 16),
                                SizedBox(width: 4),
                                Text("Deadline : 12-11-2022"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("No task"));
              }
            },
          )
        ],
      ),
    );
  }
}
