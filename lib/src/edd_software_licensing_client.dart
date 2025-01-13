import 'package:http/http.dart' as http;
import 'package:edd_software_licensing/src/edd_software_licensing_response.dart';

/// A client to access the EDD software licensing web API.
class EddSoftwareLicensingClient {
  /// The host where requests should be made. It should be the hostname only
  /// (e.g. 'google.com').
  final String licenseHost;

  const EddSoftwareLicensingClient({required this.licenseHost});

  /// Request a license activation
  ///
  /// [itemId] is an integer and is found on the EDD all downloads page right
  /// after the name of each download
  /// [licenseKey] is the license that was received after purchace
  /// [url] is optional and doesn't need to be a URL. It could be, for instance,
  /// a computer name to monitor how many machines the software is activated
  /// on.
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

  /// Request a license deactivation
  ///
  /// [itemId] is an integer and is found on the EDD all downloads page right
  /// after the name of each download
  /// [licenseKey] is the license that was received after purchace
  /// [url] is optional and doesn't need to be a URL. It could be, for instance,
  /// a computer name to monitor how many machines the software is activated
  /// on.
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

  /// Check the status of a license
  ///
  /// [itemId] is an integer and is found on the EDD all downloads page right
  /// after the name of each download
  /// [licenseKey] is the license that was received after purchace
  /// [url] is optional and doesn't need to be a URL. It could be, for instance,
  /// a computer name to monitor how many machines the software is activated
  /// on.
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

  /// Check the lastest version of a given product
  ///
  /// [itemId] is an integer and is found on the EDD all downloads page right
  /// after the name of each download
  /// [licenseKey] is optional, but if a valid license isn't given, the
  /// response may not include any update/download URLs
  /// [includeBetas], if true, the response will include Beta software versions
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
    if (includeBetas) {
      reqParams['beta'] = 1.toString();
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
