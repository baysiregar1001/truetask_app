import 'package:flutter/material.dart';
import 'package:truetask_app/screen/search.dart';

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
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SeacrhPage()),
        ),
      ),
    );
  }
}
