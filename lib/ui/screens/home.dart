import 'package:actors_guild_concerts/ui/components/scrollable_exhibition_bottom_sheet.dart';
import 'package:actors_guild_concerts/ui/components/sliding_cards.dart';
import 'package:actors_guild_concerts/ui/components/tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),
          ScrollableExhibitionSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'Shenzhen',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
