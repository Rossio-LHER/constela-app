/// Enumeración de géneros disponibles en CONSTELA
enum Genero {
  masculino,
  femenino;

  /// Retorna el nombre en español
  String get nombreEspanol {
    switch (this) {
      case Genero.masculino:
        return 'Masculino';
      case Genero.femenino:
        return 'Femenino';
    }
  }
}
