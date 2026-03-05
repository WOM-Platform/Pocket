/// Estensioni utili per il tipo [String]
extension StringX on String? {
  /// Verifica se la stringa è null o vuota
  bool get isNullOrEmpty {
    final tmp = this;
    return tmp == null || tmp.isEmpty;
  }

  /// Verifica se la stringa è null, vuota o contiene solo spazi
  bool get isNullOrWhitespace {
    final tmp = this;
    return tmp == null || tmp.trim().isEmpty;
  }

  /// Tronca la stringa alla lunghezza specificata aggiungendo "..." se necessario
  String truncate(int maxLength, {String ellipsis = '...'}) {
    final tmp = this;
    if (tmp == null) return '';
    if (tmp.length <= maxLength) return tmp;
    return tmp.substring(0, maxLength - ellipsis.length) + ellipsis;
  }
}
