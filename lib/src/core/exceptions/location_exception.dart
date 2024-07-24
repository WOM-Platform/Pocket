abstract class LocationException {}

class LocationServiceException extends LocationException {}

class ServiceGPSDisabled extends LocationServiceException {}

class GetLocationTimeout extends LocationServiceException {}

class LocationPermissionDenied extends LocationServiceException {}

class LocationPermissionDeniedForever extends LocationServiceException {}
