/// Enumeración de razas disponibles en CONSTELA
enum Raza {
  astrales,    // +15 Poder de Resolución
  celidos,     // +15 Resistencia a Distracción
  nebulanos;   // +15 Velocidad de Enfoque

  /// Retorna el nombre en español
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

  /// Retorna la descripción del bonificador
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
}
