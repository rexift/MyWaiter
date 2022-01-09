import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class SearchTab extends HomeTab {
  @override
  final IconData icon = LucideIcons.search;
  @override
  final String label = 'Search';

  @override
  Widget build(BuildContext context) {
    //! search
    return Column(
      children: [
        RestaurantTile(),
        SizedBox(height: 16),
        RestaurantTile(),
        SizedBox(height: 16),
        RestaurantTile(),
        SizedBox(height: 16),
        RestaurantTile(),
        SizedBox(height: 16),
        RestaurantTile(),
      ],
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final double height = 48;
  final String name = 'Fábrica Bolina';

  // final String name = 'Bo';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
              'https://via.placeholder.com/'
              '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
            ),
            // backgroundImage: , // a default image of the assets
            backgroundColor: Colors.amber,
            radius: height / 2,
            child: Text(name.substring(0, 2)),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text('Opened ∙ Closes at 23pm'),
            ],
          )
        ],
      ),
    );
  }
}
