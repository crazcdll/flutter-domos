import 'package:flutter/material.dart';
import 'package:tourismandco/widgets/image_banner.dart';
import 'package:tourismandco/widgets/location_title.dart';
import '../../models/location.dart';
import 'text_session.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) async {
    final location = await Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(assetPath: location.imagePath),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
              child: LocationTitle(location: location),
            )
          ]..addAll(textSections(location))),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts.map((fact) => TextSection(fact.title, fact.text)).toList();
  }
}
