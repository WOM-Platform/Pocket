import 'package:wom_pocket/src/core/application/transaction_notifier.dart';

class LocationServiceException extends PocketException {}

class ServiceGPSDisabled extends LocationServiceException {}

class GetLocationTimeout extends LocationServiceException {}

class LocationPermissionDenied extends LocationServiceException {}

class LocationPermissionDeniedForever extends LocationServiceException {}
