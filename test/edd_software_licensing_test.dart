import 'package:edd_software_licensing/edd_software_licensing.dart';
import 'package:test/test.dart';

void main() {
  group('Easy Digital Downloads Test', () {
    final edd = EddSoftwareLicensingClient(licenseHost: 'atomic.city');

    test('GetVersion', () async {
      var resp = await edd.getVersion(itemId: 47);
      print(resp.toJson());
    });
  });
}
