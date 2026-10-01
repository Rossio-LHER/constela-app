/// Enumeración de rarezas de skins en CONSTELA
enum Rareza {
  basico,
  epico,
  collector,
}

extension RarezaExtension on Rareza {
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

  static Rareza fromString(String value) {
    switch (value.toLowerCase()) {
      case 'basico':
      case 'básico':
        return Rareza.basico;
      case 'epico':
      case 'épico':
        return Rareza.epico;
      case 'collector':
        return Rareza.collector;
      default:
        return Rareza.basico;
    }
  }
}
