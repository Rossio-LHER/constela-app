/// Enumeración de roles de héroes en CONSTELA
enum Rol {
  guardianDelEnfoque,      // Tanque
  especialistaAcademico,   // Mago
  soporteMotivacional;     // Soporte

  /// Retorna el nombre en español
  String get nombreEspanol {
    switch (this) {
      case Rol.guardianDelEnfoque:
        return 'Guardián del Enfoque';
      case Rol.especialistaAcademico:
        return 'Especialista Académico';
      case Rol.soporteMotivacional:
        return 'Soporte Motivacional';
    }
  }

  /// Retorna la descripción del rol
  String get descripcion {
    switch (this) {
      case Rol.guardianDelEnfoque:
        return 'Tanque defensivo con habilidades de protección';
      case Rol.especialistaAcademico:
        return 'Mago con alto daño y control';
      case Rol.soporteMotivacional:
        return 'Soporte que bufea al equipo';
    }
  }
}
