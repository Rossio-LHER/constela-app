import 'package:json_annotation/json_annotation.dart';
import 'rol.dart';
import 'raza.dart';

part 'habilidad.g.dart';

/// Enumeración de tipos de efectos
enum TipoEfecto {
  buff,      // Mejora de stats
  debuff,    // Reducción de stats
  damage,    // Daño directo
  heal,      // Curación
  utility;   // Utilidad
}

/// Clase que representa una habilidad de héroe
@JsonSerializable()
class Habilidad {
  final String habilidadId;
  final String nombre;
  final String descripcion;
  final Rol rol;
  final TipoEfecto tipoEfecto;
  final int cooldown; // en segundos
  final int costo; // recursos de enfoque (0-100)
  final String? vfxId; // identificador del efecto visual
  final Map<String, dynamic> efectoSala; // variables de aula que afecta

  Habilidad({
    required this.habilidadId,
    required this.nombre,
    required this.descripcion,
    required this.rol,
    required this.tipoEfecto,
    required this.cooldown,
    required this.costo,
    this.vfxId,
    required this.efectoSala,
  });

  factory Habilidad.fromJson(Map<String, dynamic> json) =>
      _$HabilidadFromJson(json);

  Map<String, dynamic> toJson() => _$HabilidadToJson(this);

  /// Retorna el multiplicador de bonificador según raza
  double obtenerMultiplicadorRaza(Raza raza) {
    switch (raza) {
      case Raza.astrales:
        return 1.2; // Mayor poder de resolución
      case Raza.celidos:
        return 1.1; // Resistencia moderada
      case Raza.nebulanos:
        return 1.15; // Velocidad media
    }
  }
}
