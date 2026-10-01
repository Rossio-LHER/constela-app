/// Enumeración de géneros disponibles en CONSTELA
enum Genero {
  masculino,
  femenino,
}

extension GeneroExtension on Genero {
  String get nombreEspanol {
    switch (this) {
      case Genero.masculino:
        return 'Masculino';
      case Genero.femenino:
        return 'Femenino';
    }
  }

  static Genero fromString(String value) {
    switch (value.toLowerCase()) {
      case 'masculino':
        return Genero.masculino;
      case 'femenino':
        return Genero.femenino;
      default:
        return Genero.masculino;
    }
  }
}
