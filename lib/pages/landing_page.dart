import 'package:cats_app/breed_dto.dart';
import 'package:flutter/material.dart';

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
  String searchValue = '';

  List<BreedDto> filtereBreeds = [];

  onCatPressed(BuildContext context, BreedDto breed) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BreedDetailsPage(breed: breed)),
    );
  }

  List<BreedDto> get _breeds {
    if (searchValue.isEmpty) {
      return widget.breeds;
    }
    return filtereBreeds;
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
              ListView.builder(
                itemCount: _breeds.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final breed = widget.breeds[index];
                  return BreedOverviewCard(
                    breed: breed,
                    onPressed: () => onCatPressed(context, breed),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSearch(String value) {
    setState(() {
      searchValue = value;
      filtereBreeds = widget.breeds
          .where((breed) => breed.name.toLowerCase().contains(value))
          .toList();
    });
  }

  Widget _buildSearchBar() {
    return SearchBar(
      hintText: 'Search breeds',
      onChanged: _onSearch,
      leading: const Padding(
        padding: EdgeInsets.all(4),
        child: Icon(Icons.search),
      ),
    );
  }
}
