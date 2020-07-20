import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

///Notice that by default this class is not used
///Go to [home.dart] and replace [ExhibitionBottomSheet] with [ScrollableExhibitionSheet] to use it
class ScrollableExhibitionSheet extends StatefulWidget {
  @override
  _ScrollableExhibitionSheetState createState() =>
      _ScrollableExhibitionSheetState();
}

class _ScrollableExhibitionSheetState extends State<ScrollableExhibitionSheet> {
  double initialPercentage = 0.20;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DraggableScrollableSheet(
        minChildSize: initialPercentage,
        initialChildSize: initialPercentage,
        builder: (context, scrollController) {
          return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              double percentage = initialPercentage;
              if (scrollController.hasClients) {
                percentage = (scrollController.position.viewportDimension) /
                    (MediaQuery.of(context).size.height);
              }
              double scaledPercentage =
                  (percentage - initialPercentage) / (1 - initialPercentage);
              return Container(
                padding: const EdgeInsets.only(left: 32),
                decoration: const BoxDecoration(
                  color: Color(0xFF162A49),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: percentage == 1 ? 1 : 0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(right: 32, top: 128),
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          Event event = events[index % 3];
                          return EventItems(
                            event: event,
                            percentageCompleted: percentage,
                          );
                        },
                      ),
                    ),
                    ...events.map((event) {
                      int index = events.indexOf(event);
                      int heightPerElement = 120 + 8 + 8;
                      double widthPerElement =
                          40 + percentage * 80 + 8 * (1 - percentage);
                      double leftOffset = widthPerElement *
                          (index > 4 ? index + 2 : index) *
                          (1 - scaledPercentage);
                      return Positioned(
                        top: 44.0 +
                            scaledPercentage * (128 - 44) +
                            index * heightPerElement * scaledPercentage,
                        left: leftOffset,
                        right: 32 - leftOffset,
                        child: IgnorePointer(
                          ignoring: true,
                          child: Opacity(
                            opacity: percentage == 1 ? 0 : 1,
                            child: EventItems(
                              event: event,
                              percentageCompleted: percentage,
                            ),
                          ),
                        ),
                      );
                    }),
                    SheetHeader(
                      fontSize: 14 + percentage * 8,
                      topMargin:
                          16 + percentage * MediaQuery.of(context).padding.top,
                    ),
                    MenuButton(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Handles the event listings property
class Event {
  final String assetName;
  final String title;
  final String date;

  Event(this.assetName, this.title, this.date);
}

class EventItems extends StatelessWidget {
  final Event event;
  final double percentageCompleted;

  const EventItems({Key key, this.event, this.percentageCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Transform.scale(
        alignment: Alignment.topLeft,
        scale: 1 / 3 + 2 / 3 * percentageCompleted,
        child: SizedBox(
          height: 120,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8),
                  right: Radius.circular(8 * (1 - percentageCompleted)),
                ),
                child: Image.asset(
                  'assets/${event.assetName}',
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: max(0, percentageCompleted * 2 - 1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(16)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8),
                    child: _buildContent(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(event.title, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Text(
          '1 ticket',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 8),
            Text(
              event.date,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Icon(Icons.place, color: Colors.grey.shade400, size: 16),
            Text(
              'Science Park 10 25A',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}

final List<Event> events = [
  Event('letUsChart.png', 'Let us Chart', 'September 14-16 2020'),
  Event('wearabletechExpo.png', 'Wearable Tech expo', 'March 6-9 2021'),
  Event('aFashionPhotoshoot.png', 'A fashion Affair', 'June 20 2020'),
  Event('letUsChart.png', 'Let us Chart', 'September 14-16 2020'),
];

/// Bottom Sheet Header
class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 32,
      child: IgnorePointer(
        child: Container(
          padding: EdgeInsets.only(top: topMargin, bottom: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF162A49),
          ),
          child: Text(
            'Purchased Tickets',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 24,
      child: Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
