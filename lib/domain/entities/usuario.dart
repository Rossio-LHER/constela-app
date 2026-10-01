import 'package:json_annotation/json_annotation.dart';
import 'raza.dart';
import 'genero.dart';
import 'heroe.dart';
import 'skin.dart';

part 'usuario.g.dart';

/// Clase que representa un usuario/jugador en CONSTELA
@JsonSerializable()
class Usuario {
  final String usuarioId;
  final String nombre;
  final String email;
  final Raza raza;
  final Genero genero;
  int nivel;
  int experienciaTotal;
  final String heroeActualId; // ID del héroe equipado
  final List<String> heroesDesbloqueadosIds;
  final List<String> skinsDesbloqueadosIds;
  int oro;
  int diamantes;
  int minutosEstudiados;
  int salasCompletadas;
  int habilidadesUsadas;
  final DateTime fechaCreacion;
  final DateTime ultimoAcceso;

  Usuario({
    required this.usuarioId,
    required this.nombre,
    required this.email,
    required this.raza,
    required this.genero,
    required this.nivel,
    required this.experienciaTotal,
    required this.heroeActualId,
    required this.heroesDesbloqueadosIds,
    required this.skinsDesbloqueadosIds,
    required this.oro,
    required this.diamantes,
    required this.minutosEstudiados,
    required this.salasCompletadas,
    required this.habilidadesUsadas,
    required this.fechaCreacion,
    required this.ultimoAcceso,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);

  /// Retorna el bonificador de la raza del usuario
  int get bonificadorRaza {
    switch (raza) {
      case Raza.astrales:
        return 15; // Poder de Resolución
      case Raza.celidos:
        return 15; // Resistencia a Distracción
      case Raza.nebulanos:
        return 15; // Velocidad de Enfoque
    }
  }

  /// Añade oro (usado en recompensas)
  void anadirOro(int cantidad) => oro += cantidad;

  /// Añade diamantes (premium)
  void anadirDiamantes(int cantidad) => diamantes += cantidad;

  /// Crea una copia con valores modificados
  Usuario copyWith({
    int? nivel,
    int? experienciaTotal,
    String? heroeActualId,
    int? oro,
    int? diamantes,
    int? minutosEstudiados,
    int? salasCompletadas,
    int? habilidadesUsadas,
  }) {
    return Usuario(
      usuarioId: usuarioId,
      nombre: nombre,
      email: email,
      raza: raza,
      genero: genero,
      nivel: nivel ?? this.nivel,
      experienciaTotal: experienciaTotal ?? this.experienciaTotal,
      heroeActualId: heroeActualId ?? this.heroeActualId,
      heroesDesbloqueadosIds: heroesDesbloqueadosIds,
      skinsDesbloqueadosIds: skinsDesbloqueadosIds,
      oro: oro ?? this.oro,
      diamantes: diamantes ?? this.diamantes,
      minutosEstudiados: minutosEstudiados ?? this.minutosEstudiados,
      salasCompletadas: salasCompletadas ?? this.salasCompletadas,
      habilidadesUsadas: habilidadesUsadas ?? this.habilidadesUsadas,
      fechaCreacion: fechaCreacion,
      ultimoAcceso: ultimoAcceso,
    );
  }
}
