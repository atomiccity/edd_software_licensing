<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

# Easy Digital Downloads software licensing package

This Dart package encapsulates the web API requests available in the Easy Digital Downloads (EDD) 
software licensing extension. This extension allows for registering, deregistering, and checking 
license status. It also allows for checking the latest version info for a product.

EDD is a plugin for Wordpress websites and can be found here: https://easydigitaldownloads.com

The software licensing extension can be found here: https://easydigitaldownloads.com/downloads/software-licensing/

## Features

This package has a web API client class and four core methods in that class. One for each of the 
four EDD software licensing API endpoints.

* activateLicense
* deactivateLicense
* checkLicense
* getVersion

The responses have JSON serialization built in so that licensing server responses can be cached 
locally to cut down on server requests.

## Usage

Here is an example showing how to activate a license and check its validity:

```dart
var eddLicensingClient = EddSoftwareLicensingClient(licenseHost: 'myhost.com');

// Activate a license
var activateResponse = await eddLicensingClient.activateLicense(
    itemId: 1,
    licenseKey: 'USERS_LICENSEKEY',
);

if (activateResponse.isRequestSuccessful() && activateResponse.isLicenseValid()) {
    // License was activated
} else {
    // Figure out what went wrong
    if (!activateResponse.isRequestSuccessful()) {
        // We got a HTTP server error
    } else {
        // We got a licensing error
        var licenseStatus = activateResponse.license;
        var errorMessage = activateResponse.error;
    }
}
```
