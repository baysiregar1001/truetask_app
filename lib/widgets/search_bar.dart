import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/viewmodels/search_workspace_viewmodel.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: TextField(
        readOnly: true,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          prefixIcon: Container(
            padding: const EdgeInsets.all(15),
            width: 18,
            child: const Icon(Icons.search),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune),
          ),
        ),
        onTap: () => showSearch(context: context, delegate: Search()),
      ),
    );
  }
}

class Search extends SearchDelegate {
  final getQuery = ListSearchWorkspaceViewModel();

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<SearchWorkspaceViewModel>?>(
        future: getQuery.fetchWorkspacesQuery(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      projectDetailPage,
                      arguments: data[index].workspace),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image.asset('assets/icon/ourproject.png'),
                      title: Text(data[index].workspace!.name!),
                      subtitle: Text(data[index].workspace!.description!),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("Workspace tidak ditemukan"));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Workspace'),
    );
  }
}
