/// Enumeración de roles de héroes en CONSTELA
enum Rol {
  guardianDelEnfoque,
  especialistaAcademico,
  soporteMotivacional,
}

extension RolExtension on Rol {
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

  static Rol fromString(String value) {
    switch (value.toLowerCase()) {
      case 'guardian':
      case 'guardián':
      case 'guardiandelenfoque':
      case 'guardian_del_enfoque':
        return Rol.guardianDelEnfoque;
      case 'especialista':
      case 'especialistaacademico':
      case 'especialista_academico':
        return Rol.especialistaAcademico;
      case 'soporte':
      case 'soportemotivacional':
      case 'soporte_motivacional':
        return Rol.soporteMotivacional;
      default:
        return Rol.guardianDelEnfoque;
    }
  }
}
