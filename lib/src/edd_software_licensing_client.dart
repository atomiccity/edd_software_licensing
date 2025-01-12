import 'package:http/http.dart' as http;
import 'package:edd_software_licensing/src/edd_software_licensing_response.dart';

class EddSoftwareLicensingClient {
  final String licenseHost;

  const EddSoftwareLicensingClient({required this.licenseHost});

  Future<EddSoftwareLicensingStatusResponse> activateLicense({
    required int itemId,
    required String licenseKey,
    String? url,
  }) async {
    return _statusRequest(
      request: 'activate_license',
      itemId: itemId,
      licenseKey: licenseKey,
      url: url,
    );
  }

  Future<EddSoftwareLicensingStatusResponse> deactivateLicense({
    required int itemId,
    required String licenseKey,
    String? url,
  }) async {
    return _statusRequest(
      request: 'deactivate_license',
      itemId: itemId,
      licenseKey: licenseKey,
      url: url,
    );
  }

  Future<EddSoftwareLicensingStatusResponse> checkLicense({
    required int itemId,
    required String licenseKey,
    String? url,
  }) async {
    return _statusRequest(
      request: 'check_license',
      itemId: itemId,
      licenseKey: licenseKey,
      url: url,
    );
  }

  Future<EddSoftwareLicensingStatusResponse> _statusRequest({
    required String request,
    required int itemId,
    required String licenseKey,
    String? url,
  }) async {
    var reqParams = {
      'edd_action': request,
      'item_id': itemId.toString(),
      'license': licenseKey,
    };
    if (url != null) {
      reqParams['url'] = url;
    }
    var reqUri = Uri.https(licenseHost, '', reqParams);

    // Make request
    var response = await http.get(reqUri);

    // Process response
    if (response.statusCode != 200) {
      return EddSoftwareLicensingStatusResponse(
        success: false,
        serverResponseCode: response.statusCode,
      );
    }

    return EddSoftwareLicensingStatusResponse.fromJson(
      response.body,
      serverResponseCode: response.statusCode,
    );
  }

  Future<EddSoftwareLicensingVersionResponse> getVersion({
    required int itemId,
    String? licenseKey,
    String? url,
    bool includeBetas = false,
  }) async {
    var reqParams = {
      'edd_action': 'get_version',
      'item_id': itemId.toString(),
    };
    if (licenseKey != null) {
      reqParams['license'] = licenseKey;
    }
    if (url != null) {
      reqParams['url'] = url;
    }
    var reqUri = Uri.https(licenseHost, '', reqParams);

    // Make request
    var response = await http.get(reqUri);

    // Process response
    if (response.statusCode != 200) {
      return EddSoftwareLicensingVersionResponse(
        success: false,
        serverResponseCode: response.statusCode,
      );
    }

    return EddSoftwareLicensingVersionResponse.fromJson(
      response.body,
      serverResponseCode: response.statusCode,
    );
  }
}
