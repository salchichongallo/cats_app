import 'package:flutter/material.dart';

class CatOverviewCard extends StatelessWidget {
  const CatOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Abyssinian'),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('View'),
            ),
          ),
          Image.network(
            'https://cdn2.thecatapi.com/images/tv8tNeYaU.jpg',
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 16,
              right: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Origin: Egypt'),
                Text('Intelligence: 5'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
