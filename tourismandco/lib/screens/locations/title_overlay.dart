import 'package:flutter/material.dart';
import 'package:tourismandco/widgets/location_title.dart';
import '../../models/location.dart';

class TitleOverlay extends StatelessWidget {
  final Location location;

  TitleOverlay(this.location);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: LocationTitle(location: location, dartTheme: true),
        )
      ],
    );
  }
}
