import 'package:json_annotation/json_annotation.dart';
import 'rareza.dart';

part 'skin.g.dart';

/// Clase que representa un skin (apariencia) de héroe
@JsonSerializable()
class Skin {
  final String skinId;
  final String nombre;
  final String heroeId; // A qué héroe pertenece
  final Rareza rareza;
  final int precio; // en oro o diamantes
  final String rutaAsset; // ruta dinámica del asset
  final String? vfxEstilo; // estilo visual de habilidades
  final String descripcion;
  final bool desbloqueado;
  final bool equipada;
  final DateTime? fechaDesbloqueo;

  Skin({
    required this.skinId,
    required this.nombre,
    required this.heroeId,
    required this.rareza,
    required this.precio,
    required this.rutaAsset,
    this.vfxEstilo,
    required this.descripcion,
    required this.desbloqueado,
    required this.equipada,
    this.fechaDesbloqueo,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => _$SkinFromJson(json);

  Map<String, dynamic> toJson() => _$SkinToJson(this);

  /// Retorna el multiplicador de oro según rareza
  double get multiplicadorOro => rareza.multiplicador;

  /// Retorna el multiplicador de exp según rareza
  double get multiplicadorExp => rareza.multiplicador;

  /// Crea una copia con valores modificados
  Skin copyWith({
    bool? desbloqueado,
    bool? equipada,
    DateTime? fechaDesbloqueo,
  }) {
    return Skin(
      skinId: skinId,
      nombre: nombre,
      heroeId: heroeId,
      rareza: rareza,
      precio: precio,
      rutaAsset: rutaAsset,
      vfxEstilo: vfxEstilo,
      descripcion: descripcion,
      desbloqueado: desbloqueado ?? this.desbloqueado,
      equipada: equipada ?? this.equipada,
      fechaDesbloqueo: fechaDesbloqueo ?? this.fechaDesbloqueo,
    );
  }
}
