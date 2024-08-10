import 'package:flutter/material.dart';

import '../breed_dto.dart';
import '../widgets/breed_overview_card.dart';
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
  String _searchedBreed = '';

  List<BreedDto> _filteredBreeds = [];

  _onCatPressed(BreedDto breed) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BreedDetailsPage(breed: breed)),
    );
  }

  List<BreedDto> get _breeds =>
      _searchedBreed.isEmpty ? widget.breeds : _filteredBreeds;

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
              ListView.builder(
                itemCount: _breeds.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final breed = widget.breeds[index];
                  return BreedOverviewCard(
                    breed: breed,
                    onPressed: () => _onCatPressed(breed),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SearchBar(
      hintText: 'Search breeds',
      onChanged: _onSearch,
      focusNode: null,
      leading: const Padding(
        padding: EdgeInsets.all(4),
        child: Icon(Icons.search),
      ),
    );
  }

  void _onSearch(String breedName) {
    setState(() {
      _searchedBreed = breedName;
      _filteredBreeds = _filterBreeds(_searchedBreed);
    });
  }

  List<BreedDto> _filterBreeds(String name) => widget.breeds
      .where((breed) => breed.name.toLowerCase().contains(name))
      .toList();
}
