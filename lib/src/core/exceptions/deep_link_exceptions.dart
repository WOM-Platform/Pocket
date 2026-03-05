/// Eccezioni custom per il parsing dei deep link
/// 
/// Queste eccezioni forniscono informazioni più specifiche rispetto
/// alle eccezioni generiche [Exception] per facilitare il debugging
/// e la gestione degli errori nel routing.

/// Eccezione base per tutti gli errori di deep link
sealed class DeepLinkException implements Exception {
  final String message;
  final String? uri;
  
  const DeepLinkException(this.message, {this.uri});
  
  @override
  String toString() {
    if (uri != null) {
      return '$runtimeType: $message (uri: $uri)';
    }
    return '$runtimeType: $message';
  }
}

/// URI è null o malformato
class InvalidUriException extends DeepLinkException {
  const InvalidUriException({String? uri})
    : super('URI is null or cannot be parsed', uri: uri);
}

/// Schema non valido (non https o wom)
class InvalidSchemeException extends DeepLinkException {
  final String scheme;
  
  const InvalidSchemeException(this.scheme, {String? uri})
    : super('Invalid scheme: $scheme', uri: uri);
}

/// Host non valido
class InvalidHostException extends DeepLinkException {
  final String host;
  
  const InvalidHostException(this.host, {String? uri})
    : super('Invalid host: $host', uri: uri);
}

/// Tipo di transazione non valido
class InvalidTransactionTypeException extends DeepLinkException {
  final String type;
  
  const InvalidTransactionTypeException(this.type, {String? uri})
    : super('Invalid transaction type: $type', uri: uri);
}

/// OTC (One Time Code) mancante o vuoto
class MissingOtcException extends DeepLinkException {
  const MissingOtcException({String? uri})
    : super('OTC is null or empty', uri: uri);
}

/// Chiave parziale di migration mancante
class MissingMigrationKeyException extends DeepLinkException {
  const MissingMigrationKeyException({String? uri})
    : super('Migration partial key is null or empty', uri: uri);
}

/// Eccezione per errori di piattaforma durante il parsing
class DeepLinkPlatformException extends DeepLinkException {
  final String platformError;
  
  const DeepLinkPlatformException(this.platformError, {String? uri})
    : super('Platform error: $platformError', uri: uri);
}
