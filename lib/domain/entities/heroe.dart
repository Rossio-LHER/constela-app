import 'package:json_annotation/json_annotation.dart';
import 'rol.dart';
import 'raza.dart';
import 'genero.dart';
import 'atributos.dart';
import 'habilidad.dart';
import 'skin.dart';

part 'heroe.g.dart';

/// Clase que representa un héroe jugable en CONSTELA
@JsonSerializable()
class Heroe {
  final String heroeId;
  final String nombre;
  final Rol rol;
  final Raza raza;
  final Genero genero;
  int nivel;
  int experiencia; // 0 a EXP_POR_NIVEL
  final double vidaBase;
  final Atributos atributos;
  final List<Habilidad> habilidades; // Exactamente 3
  final Skin skinEquipada;
  int victorias;
  int derrotas;
  int assists;
  final DateTime fechaCreacion;

  Heroe({
    required this.heroeId,
    required this.nombre,
    required this.rol,
    required this.raza,
    required this.genero,
    required this.nivel,
    required this.experiencia,
    required this.vidaBase,
    required this.atributos,
    required this.habilidades,
    required this.skinEquipada,
    required this.victorias,
    required this.derrotas,
    required this.assists,
    required this.fechaCreacion,
  }) : assert(habilidades.length == 3, 'Un héroe debe tener exactamente 3 habilidades');

  factory Heroe.fromJson(Map<String, dynamic> json) => _$HeroeFromJson(json);

  Map<String, dynamic> toJson() => _$HeroeToJson(this);

  /// Retorna el multiplicador de bonificadores según raza
  double get bonificadorRaza {
    switch (raza) {
      case Raza.astrales:
        return 1.15;
      case Raza.celidos:
        return 1.15;
      case Raza.nebulanos:
        return 1.15;
    }
  }

  /// Calcula el porcentaje de experiencia hacia el siguiente nivel
  double get porcentajeExperiencia {
    const expPorNivel = 1000;
    return (experiencia / expPorNivel).clamp(0, 1);
  }

  /// Añade experiencia y gestiona subida de nivel
  void anadirExperiencia(int cantidad) {
    const expPorNivel = 1000;
    experiencia += cantidad;
    while (experiencia >= expPorNivel) {
      nivel++;
      experiencia -= expPorNivel;
    }
  }

  /// Registra una victoria
  void registrarVictoria() => victorias++;

  /// Registra una derrota
  void registrarDerrota() => derrotas++;

  /// Registra una asistencia
  void registrarAsistencia() => assists++;

  /// Retorna la tasa de victoria (victorias / (victorias + derrotas))
  double get tasaVictoria {
    if ((victorias + derrotas) == 0) return 0;
    return victorias / (victorias + derrotas);
  }

  /// Crea una copia con valores modificados
  Heroe copyWith({
    int? nivel,
    int? experiencia,
    Skin? skinEquipada,
    int? victorias,
    int? derrotas,
    int? assists,
  }) {
    return Heroe(
      heroeId: heroeId,
      nombre: nombre,
      rol: rol,
      raza: raza,
      genero: genero,
      nivel: nivel ?? this.nivel,
      experiencia: experiencia ?? this.experiencia,
      vidaBase: vidaBase,
      atributos: atributos,
      habilidades: habilidades,
      skinEquipada: skinEquipada ?? this.skinEquipada,
      victorias: victorias ?? this.victorias,
      derrotas: derrotas ?? this.derrotas,
      assists: assists ?? this.assists,
      fechaCreacion: fechaCreacion,
    );
  }
}
