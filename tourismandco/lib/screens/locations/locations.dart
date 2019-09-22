import 'package:flutter/material.dart';
import '../../screens/locations/title_overlay.dart';
import '../../widgets/image_banner.dart';
import '../../app.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => _itemBuilder(context, locations[index]),
        itemCount: locations.length,
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute, arguments: {"id": locationID});
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      key: Key('location_list_item_${location.id}'),
      child: Container(
        height: 245.0,
        child: Stack(
          children: <Widget>[
            ImageBanner(assetPath: location.imagePath, height: 245.0),
            TitleOverlay(location)
          ],
        ),
      ),
    );
  }
}
