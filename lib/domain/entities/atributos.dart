import 'package:json_annotation/json_annotation.dart';

part 'atributos.g.dart';

/// Clase que representa los atributos de un héroe
@JsonSerializable()
class Atributos {
  final int poder;           // Daño/Efectividad de habilidades
  final int resistencia;     // Durabilidad en sala
  final int velocidad;       // Recarga de habilidades
  final int inteligencia;    // Bonus de oro/exp

  Atributos({
    required this.poder,
    required this.resistencia,
    required this.velocidad,
    required this.inteligencia,
  });

  factory Atributos.fromJson(Map<String, dynamic> json) =>
      _$AtributosFromJson(json);

  Map<String, dynamic> toJson() => _$AtributosToJson(this);

  /// Suma de todos los atributos (usado para UI)
  int get total => poder + resistencia + velocidad + inteligencia;

  /// Crea una copia con valores modificados
  Atributos copyWith({
    int? poder,
    int? resistencia,
    int? velocidad,
    int? inteligencia,
  }) {
    return Atributos(
      poder: poder ?? this.poder,
      resistencia: resistencia ?? this.resistencia,
      velocidad: velocidad ?? this.velocidad,
      inteligencia: inteligencia ?? this.inteligencia,
    );
  }
}
