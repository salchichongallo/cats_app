import 'package:flutter/material.dart';

import '../breed_dto.dart';
import '../widgets/breed_card_list.dart';
import 'breed_details_page.dart';

class LandingPage extends StatefulWidget {
  final String title;

  final List<BreedDto> breeds;

  const LandingPage({
    super.key,
    required this.title,
    required this.breeds,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _searchController = TextEditingController();

  List<BreedDto> _filteredBreeds = [];

  _onCatPressed(BreedDto breed) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BreedDetailsPage(breed: breed)),
    );
  }

  @override
  void initState() {
    _filteredBreeds = widget.breeds;
    _searchController.addListener(_onSearch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildSearchBar(),
              ),
              BreedCardList(breeds: _filteredBreeds, onPressed: _onCatPressed),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SearchBar(
      hintText: 'Search breeds',
      focusNode: null,
      controller: _searchController,
      leading: const Padding(
        padding: EdgeInsets.all(4),
        child: Icon(Icons.search),
      ),
    );
  }

  void _onSearch() {
    setState(() {
      if (_searchController.text.isNotEmpty) {
        _filteredBreeds = _filterBreeds(_searchController.text);
      }
    });
  }

  List<BreedDto> _filterBreeds(String name) => widget.breeds
      .where((breed) => breed.name.toLowerCase().contains(name.toLowerCase()))
      .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
