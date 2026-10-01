/// Enumeración de razas disponibles en CONSTELA
enum Raza {
  astrales,
  celidos,
  nebulanos,
}

extension RazaExtension on Raza {
  String get nombreEspanol {
    switch (this) {
      case Raza.astrales:
        return 'Astrales';
      case Raza.celidos:
        return 'Célidos';
      case Raza.nebulanos:
        return 'Nebulanos';
    }
  }

  String get descripcionBonus {
    switch (this) {
      case Raza.astrales:
        return '+15 Poder de Resolución';
      case Raza.celidos:
        return '+15 Resistencia a Distracción';
      case Raza.nebulanos:
        return '+15 Velocidad de Enfoque';
    }
  }

  int get bonificador => 15;

  static Raza fromString(String value) {
    switch (value.toLowerCase()) {
      case 'astrales':
        return Raza.astrales;
      case 'celidos':
      case 'célidos':
        return Raza.celidos;
      case 'nebulanos':
        return Raza.nebulanos;
      default:
        return Raza.astrales;
    }
  }
}
