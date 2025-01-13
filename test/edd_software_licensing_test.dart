import 'package:edd_software_licensing/edd_software_licensing.dart';
import 'package:test/test.dart';

void main() {
  var exampleInvalidResponse = EddSoftwareLicensingStatusResponse(
    activationsLeft: 1,
    checksum: 'test',
    customerEmail: 'name@example.com',
    customerName: 'John A. Smith',
    error: 'This is an error',
    expires: DateTime.now(),
    itemId: 1,
    itemName: 'The item',
    license: 'valid',
    licenseLimit: 1,
    paymentId: 1,
    priceId: 'PRICE_ID',
    serverResponseCode: 200,
    siteCount: 0,
    success: false,
  );

  group('Helper methods', () {
    test('Invalid license check', () {
      expect(exampleInvalidResponse.isRequestSuccessful(), isTrue);
      expect(exampleInvalidResponse.isLicenseValid(), isFalse);
    });
  });

  group('Serialization/Deserialization', () {
    test('Serialize/Deserialize Invalid Response', () {
      var data = exampleInvalidResponse.toJson();
      var deserialized = EddSoftwareLicensingStatusResponse.fromJson(data);
      expect(deserialized.activationsLeft, equals(exampleInvalidResponse.activationsLeft));
      expect(deserialized.checksum, equals(exampleInvalidResponse.checksum));
      expect(deserialized.customerEmail, equals(exampleInvalidResponse.customerEmail));
      expect(deserialized.customerName, equals(exampleInvalidResponse.customerName));
      expect(deserialized.error, equals(exampleInvalidResponse.error));
      expect(deserialized.expires, equals(exampleInvalidResponse.expires));
      expect(deserialized.itemId, equals(exampleInvalidResponse.itemId));
      expect(deserialized.itemName, equals(exampleInvalidResponse.itemName));
      expect(deserialized.license, equals(exampleInvalidResponse.license));
      expect(deserialized.licenseLimit, equals(exampleInvalidResponse.licenseLimit));
      expect(deserialized.paymentId, equals(exampleInvalidResponse.paymentId));
      expect(deserialized.priceId, equals(exampleInvalidResponse.priceId));
      expect(deserialized.serverResponseCode, equals(exampleInvalidResponse.serverResponseCode));
      expect(deserialized.siteCount, equals(exampleInvalidResponse.siteCount));
      expect(deserialized.success, equals(exampleInvalidResponse.success));
    });
  });
}
