import 'dart:convert';

/// The response of a request to the EDD license API endpoints.
///
/// This is the response of a [activateLicense], [deactivateLicense], and
/// [checkLicense] query.
///
/// When this response is received, the response
/// validity should be checked by checking the [serverResponseCode] or calling
/// [isRequestSuccessful] first. If the server didn't respond with a 200 HTTP
/// status code, then the rest of the message should be ignored.
class EddSoftwareLicensingStatusResponse {
  final bool? success;
  final int? serverResponseCode;
  final String? license;
  final int? itemId;
  final String? itemName;
  final int? licenseLimit;
  final int? siteCount;
  final DateTime? expires;
  final int? activationsLeft;
  final String? checksum;
  final int? paymentId;
  final String? customerName;
  final String? customerEmail;
  final String? priceId;
  final String? error;

  const EddSoftwareLicensingStatusResponse({
    this.success,
    this.serverResponseCode,
    this.license,
    this.itemId,
    this.itemName,
    this.licenseLimit,
    this.siteCount,
    this.expires,
    this.activationsLeft,
    this.checksum,
    this.paymentId,
    this.customerName,
    this.customerEmail,
    this.priceId,
    this.error,
  });

  /// A helper method to check that the web server replied with a 200 HTTP
  /// status code.
  bool isRequestSuccessful() {
    return (serverResponseCode == 200);
  }

  /// Check if the license is valid.
  ///
  /// For this to return true the following conditions must be met:
  /// * serverResponseCode == 200
  /// * success == true
  /// * license == 'valid'
  bool isLicenseValid() {
    return isRequestSuccessful() && success != null && success! && (license == 'valid');
  }

  /// Serialize this object to JSON
  String toJson() {
    return json.encode({
      if (license != null) 'license': license,
      if (itemId != null) 'item_id': itemId,
      if (itemName != null) 'item_name': itemName,
      if (licenseLimit != null) 'license_limit': licenseLimit,
      if (siteCount != null) 'site_count': siteCount,
      if (expires != null) 'expires': expires!.toIso8601String(),
      if (activationsLeft != null) 'activations_left': activationsLeft,
      if (checksum != null) 'checksum': checksum,
      if (paymentId != null) 'payment_id': paymentId,
      if (customerName != null) 'customer_name': customerName,
      if (customerEmail != null) 'customer_email': customerEmail,
      if (priceId != null) 'price_id': priceId,
      if (error != null) 'error': error,
      if (success != null) 'success': success,
      if (serverResponseCode != null) 'serverResponseCode': serverResponseCode,
    });
  }

  /// Create an [EddSoftwareLicensingStatusResponse] from a JSON representation.
  ///
  /// If [serverResponseCode] is passed in, its value will override the
  /// corresponding value in [jsonString]. Passing in [serverResponseCode] is
  /// helpful when deserializing from the web API call since that value won't
  /// be present in the JSON.
  static EddSoftwareLicensingStatusResponse fromJson(
    String jsonString, {
    int? serverResponseCode,
  }) {
    var responseMap = json.decode(jsonString);
    int? responseItemId;
    if (responseMap['item_id'] is int) {
      responseItemId = responseMap['item_id'];
    }

    return EddSoftwareLicensingStatusResponse(
      success: responseMap['success'],
      serverResponseCode: (serverResponseCode == null) ? responseMap['serverResponseCode'] : serverResponseCode,
      activationsLeft: responseMap['activations_left'],
      checksum: responseMap['checksum'],
      customerEmail: responseMap['customer_email'],
      customerName: responseMap['customer_name'],
      error: responseMap['error'],
      expires: (responseMap['expires'] != null) ? DateTime.tryParse(responseMap['expires']) : null,
      itemId: responseItemId,
      itemName: responseMap['item_name'],
      license: responseMap['license'],
      licenseLimit: responseMap['license_limit'],
      paymentId: responseMap['payment_id'],
      priceId: responseMap['price_id'],
      siteCount: responseMap['site_count'],
    );
  }
}

/// The response of a request to the EDD version API endpoints.
///
/// This is the response of a [getVersion] query.
///
/// When this response is received, the response
/// validity should be checked by checking the [serverResponseCode] or calling
/// [isRequestSuccessful] first. If the server didn't respond with a 200 HTTP
/// status code, then the rest of the message should be ignored.
class EddSoftwareLicensingVersionResponse {
  final bool? success;
  final int? serverResponseCode;
  final String? newVersion;
  final String? stableVersion;
  final String? name;
  final String? slug;
  final String? url;
  final DateTime? lastUpdated;
  final String? homepage;
  final String? package;
  final String? downloadLink;
  final String? sections;
  final String? banners;

  const EddSoftwareLicensingVersionResponse({
    this.success,
    this.serverResponseCode,
    this.newVersion,
    this.stableVersion,
    this.name,
    this.slug,
    this.url,
    this.lastUpdated,
    this.homepage,
    this.package,
    this.downloadLink,
    this.sections,
    this.banners,
  });

  /// A helper method to check that the web server replied with a 200 HTTP
  /// status code.
  bool isRequestSuccessful() {
    return (serverResponseCode == 200);
  }

  /// Serialize this object to JSON
  String toJson() {
    return json.encode({
      if (newVersion != null) 'new_version': newVersion,
      if (stableVersion != null) 'stable_version': stableVersion,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (url != null) 'url': url,
      if (lastUpdated != null) 'last_updated': lastUpdated!.toIso8601String(),
      if (homepage != null) 'homepage': homepage,
      if (package != null) 'package': package,
      if (downloadLink != null) 'download_link': downloadLink,
      if (sections != null) 'sections': sections,
      if (banners != null) 'banners': banners,
      if (success != null) 'success': success,
      if (serverResponseCode != null) 'serverResponseCode': serverResponseCode,
    });
  }

  /// Create an [EddSoftwareLicensingVersionResponse] from a JSON representation.
  ///
  /// If [serverResponseCode] is passed in, its value will override the
  /// corresponding value in [jsonString]. Passing in [serverResponseCode] is
  /// helpful when deserializing from the web API call since that value won't
  /// be present in the JSON.
  static EddSoftwareLicensingVersionResponse fromJson(
    String jsonString, {
    int? serverResponseCode,
  }) {
    var responseMap = json.decode(jsonString);
    return EddSoftwareLicensingVersionResponse(
      success: true,
      serverResponseCode: (serverResponseCode == null) ? responseMap['serverResponseCode'] : serverResponseCode,
      banners: responseMap['banners'],
      downloadLink: responseMap['download_link'],
      homepage: responseMap['homepage'],
      lastUpdated: DateTime.tryParse(responseMap['last_updated']),
      name: responseMap['name'],
      newVersion: responseMap['new_version'],
      package: responseMap['package'],
      sections: responseMap['sections'],
      slug: responseMap['slug'],
      stableVersion: responseMap['stable_version'],
      url: responseMap['url'],
    );
  }
}
