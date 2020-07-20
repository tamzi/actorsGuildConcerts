import 'package:actors_guild_concerts/ui/widgets/event_card.dart';
import 'package:flutter/material.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 10;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          EventCard(
            name: 'A fashion Affair',
            date: 'June 20 2020',
            assetName: 'aFashionPhotoshoot.png',
            offset: pageOffset,
          ),
          EventCard(
            name: 'Thirsty Birds',
            date: 'July 18-23 2020',
            assetName: 'birdsDrink.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'Natujenge maisha',
            date: 'August 3-7 2020',
            assetName: 'buildersConcert.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'Malimwenza Show',
            date: 'August 19-23',
            assetName: 'gallery.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'i will text you',
            date: 'September 4-6 2020',
            assetName: 'justSaying.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'Let us Chart',
            date: 'September 14-16 2020',
            assetName: 'letUsChart.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'Wangari Maathai',
            date: 'November 12-13 2020',
            assetName: 'nature.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'A walk in nature',
            date: 'December 28-31 2020',
            assetName: 'natureWalk.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'get Physicall',
            date: 'January 28-31 2021',
            assetName: 'physicalFitness.png',
            offset: pageOffset - 1,
          ),
          EventCard(
            name: 'Wearable Tech expo',
            date: 'March 6-9 2021',
            assetName: 'wearabletechExpo.png',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}
