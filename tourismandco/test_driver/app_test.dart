import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:tourismandco/models/location.dart';

void main() {
  group('happy path integration tests', () {
    final locaitons = Location.fetchAll();

    final locationListItemTextFinder = find.byValueKey('location_list_item_${locaitons.first.id}');
    final locatoinTitleOverlayTextFinder =
        find.byValueKey('location_title_name_${locaitons.first.id}');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('a location name appears in location list', () async {
      expect(await driver.getText(locatoinTitleOverlayTextFinder), isNotEmpty);
    });

    test('a location in the list is tappable', () async {
      await driver.tap(locatoinTitleOverlayTextFinder);

      expect(await driver.getText(locatoinTitleOverlayTextFinder), isNotEmpty);
    });
  });
}
