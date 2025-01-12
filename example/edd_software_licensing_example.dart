import 'package:edd_software_licensing/edd_software_licensing.dart';

void main() async {
  var eddLicensingClient = EddSoftwareLicensingClient(licenseHost: 'google.com');

  // Activate a license
  var activateResponse = await eddLicensingClient.activateLicense(
    itemId: 1,
    licenseKey: 'MYLICENSEKEY',
  );
  if (activateResponse.isSuccessful()) {
    // License was activated
  } else {
    // Figure out what went wrong
    if (activateResponse.serverResponseCode != 200) {
      // We got a HTTP server error
    } else {
      // We got a licensing error
      var licenseStatus = activateResponse.license;
      var errorMessage = activateResponse.error;
    }
  }

  // Check the activation
  var checkResponse = await eddLicensingClient.checkLicense(
    itemId: 1,
    licenseKey: 'MYLICENSEKEY',
  );
  if (checkResponse.isSuccessful()) {
    // License is good
  } else {
    // Figure out what went wrong
    if (activateResponse.serverResponseCode != 200) {
      // We got a HTTP server error
    } else {
      // We got a licensing error
      var licenseStatus = activateResponse.license;
      var errorMessage = activateResponse.error;
    }
  }

  // Deactivate the license
  var deactivateResponse = await eddLicensingClient.deactivateLicense(
    itemId: 1,
    licenseKey: 'MYLICENSEKEY',
  );
  if (checkResponse.isSuccessful()) {
    // License is deactivated
  } else {
    // Figure out what went wrong
    if (activateResponse.serverResponseCode != 200) {
      // We got a HTTP server error
    } else {
      // We got a licensing error
      var licenseStatus = activateResponse.license;
      var errorMessage = activateResponse.error;
    }
  }

  // Get latest version of software
  var versionResponse = await eddLicensingClient.getVersion(itemId: 1);
  if (versionResponse.isSuccessful()) {
    var newestVersion = versionResponse.newVersion;
    var stableVersion = versionResponse.stableVersion;
  }
}
