/// Enumeración de rarezas de skins en CONSTELA
enum Rareza {
  basico,      // Sin bonificadores (100% oro/exp)
  epico,       // +15% oro/exp
  collector;   // +25% oro/exp, exclusiva

  /// Retorna el nombre en español
  String get nombreEspanol {
    switch (this) {
      case Rareza.basico:
        return 'Básico';
      case Rareza.epico:
        return 'Épico';
      case Rareza.collector:
        return 'Collector';
    }
  }

  /// Retorna el multiplicador de oro/exp
  double get multiplicador {
    switch (this) {
      case Rareza.basico:
        return 1.0;
      case Rareza.epico:
        return 1.15;
      case Rareza.collector:
        return 1.25;
    }
  }
}
