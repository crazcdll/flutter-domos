import 'package:flutter/material.dart';
import '../models/location.dart';
import '../style.dart';

const LocationTitleHeight = 100.0;

class LocationTitle extends StatelessWidget {
  final Location location;
  final bool dartTheme;

  LocationTitle({this.location, this.dartTheme = false});

  @override
  Widget build(BuildContext context) {
    final textColor = this.dartTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: LocationTitleHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            location.name.toUpperCase(),
            key: Key('location_title_name_${location.id}'),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.title.copyWith(color: textColor),
          ),
          Text(
            location.userItinerarySummary.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle,
          ),
          Text(
            location.tourPackageName.toUpperCase(),
            style: Theme.of(context).textTheme.caption.copyWith(color: textColor),
          )
        ],
      ),
    );
  }
}
