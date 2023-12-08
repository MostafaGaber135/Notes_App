import 'package:flutter/material.dart';
class SearchBarScreen extends StatefulWidget {
  @override
  _SearchBarScreenState createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  bool _isSearchBarOpened = false;

  void _toggleSearchBar() {
    setState(() {
      _isSearchBarOpened = !_isSearchBarOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _toggleSearchBar,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: _isSearchBarOpened ? buildSearchBar() : buildPlaceholderContent(),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        border: OutlineInputBorder(),
      ),
      // Implement your search logic here
      onChanged: (value) {
        // Perform search based on value
        print('Searching for: $value');
      },
    );
  }

  Widget buildPlaceholderContent() {
    return Center(
      child: Text(
        'Tap the search icon to open the search bar',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
