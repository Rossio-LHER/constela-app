import 'package:json_annotation/json_annotation.dart';
import 'heroe.dart';

part 'aula_virtual.g.dart';

/// Enumeración de estados de la aula
enum EstadoAula {
  noIniciada,  // No se ha empezado
  estudiando,  // En tiempo de estudio
  descanso,    // En tiempo de descanso
  finalizada;  // Pomodoro completado

  String get nombreEspanol {
    switch (this) {
      case EstadoAula.noIniciada:
        return 'No Iniciada';
      case EstadoAula.estudiando:
        return 'Estudiando';
      case EstadoAula.descanso:
        return 'Descanso';
      case EstadoAula.finalizada:
        return 'Finalizada';
    }
  }
}

/// Clase que representa el efecto activo de una habilidad
@JsonSerializable()
class EfectoActivo {
  final String habilidadId;
  final String habilidadNombre;
  final int duracionRestanteSegundos;
  final String aplicadoPorUsuarioId;
  final DateTime momentoAplicacion;

  EfectoActivo({
    required this.habilidadId,
    required this.habilidadNombre,
    required this.duracionRestanteSegundos,
    required this.aplicadoPorUsuarioId,
    required this.momentoAplicacion,
  });

  factory EfectoActivo.fromJson(Map<String, dynamic> json) =>
      _$EfectoActivoFromJson(json);

  Map<String, dynamic> toJson() => _$EfectoActivoToJson(this);
}

/// Clase que representa una sala de estudio Pomodoro virtual
@JsonSerializable()
class AulaVirtual {
  final String aulaId;
  final String sessionId; // UUID único de sesión
  EstadoAula estado;
  final Duration tiempoEstudio; // default: 25 min
  final Duration tiempoDescanso; // default: 5 min
  int sesionesHasta; // cantidad de ciclos a completar
  Duration tiempoRestante; // tiempo actual del reloj
  
  // Variables de aula (0-100)
  double distraccion; // Aumenta con tiempo, baja con habilidades
  double productividad; // Objetivo a alcanzar
  double energiaColectiva; // Multiplicador si hay grupo
  double sincronizacion; // Cohesión del equipo
  
  // Participantes activos
  final String heroeActualId;
  final String usuarioId;
  final List<String> habilidadesUsadasIds; // IDs de habilidades aplicadas
  
  // Efectos visuales activos
  final List<EfectoActivo> efectosActivos;
  
  // Recompensas a calcular
  int oroGanado;
  int expGanado;
  
  final DateTime timestampInicio;
  DateTime? timestampFin;

  AulaVirtual({
    required this.aulaId,
    required this.sessionId,
    required this.estado,
    required this.tiempoEstudio,
    required this.tiempoDescanso,
    required this.sesionesHasta,
    required this.tiempoRestante,
    required this.distraccion,
    required this.productividad,
    required this.energiaColectiva,
    required this.sincronizacion,
    required this.heroeActualId,
    required this.usuarioId,
    required this.habilidadesUsadasIds,
    required this.efectosActivos,
    required this.oroGanado,
    required this.expGanado,
    required this.timestampInicio,
    this.timestampFin,
  });

  factory AulaVirtual.fromJson(Map<String, dynamic> json) =>
      _$AulaVirtualFromJson(json);

  Map<String, dynamic> toJson() => _$AulaVirtualToJson(this);

  /// Retorna si el aula está en fase de estudio
  bool get enEstudio => estado == EstadoAula.estudiando;

  /// Retorna si el aula está en fase de descanso
  bool get enDescanso => estado == EstadoAula.descanso;

  /// Retorna si el aula está finalizada
  bool get finalizada => estado == EstadoAula.finalizada;

  /// Retorna porcentaje de productividad (0-100)
  double get porcentajeProductividad => (productividad / 100).clamp(0, 1);

  /// Retorna porcentaje de distracción (0-100)
  double get porcentajeDistraccion => (distraccion / 100).clamp(0, 1);

  /// Aplica una habilidad en la sala, afectando variables
  /// Este método es llamado cuando un usuario ejecuta una habilidad
  void aplicarHabilidadEnSala(String habilidadId, String habilidadNombre, 
      {required double cambioProductividad,
      required double cambioDistraccion,
      required int duracionSegundos,
      required String usuarioId}) {
    // Registra la habilidad usada
    habilidadesUsadasIds.add(habilidadId);
    
    // Aplica cambios a variables
    productividad = (productividad + cambioProductividad).clamp(0, 100);
    distraccion = (distraccion + cambioDistraccion).clamp(0, 100);
    
    // Añade efecto activo visual
    efectosActivos.add(
      EfectoActivo(
        habilidadId: habilidadId,
        habilidadNombre: habilidadNombre,
        duracionRestanteSegundos: duracionSegundos,
        aplicadoPorUsuarioId: usuarioId,
        momentoAplicacion: DateTime.now(),
      ),
    );
  }

  /// Calcula las recompensas finales basado en productividad
  void calcularRecompensas(int oroBase, int expBase, double bonificadorSkin,
      double bonificadorRaza) {
    // Bonificador por productividad
    double multiplicadorProductividad = 1 + (productividad / 100) * 0.5;
    
    // Fórmula final
    oroGanado = (oroBase * bonificadorSkin * bonificadorRaza * multiplicadorProductividad).toInt();
    expGanado = (expBase * bonificadorSkin * bonificadorRaza * multiplicadorProductividad).toInt();
  }

  /// Crea una copia con valores modificados
  AulaVirtual copyWith({
    EstadoAula? estado,
    Duration? tiempoRestante,
    double? distraccion,
    double? productividad,
    double? energiaColectiva,
    double? sincronizacion,
    int? oroGanado,
    int? expGanado,
    DateTime? timestampFin,
  }) {
    return AulaVirtual(
      aulaId: aulaId,
      sessionId: sessionId,
      estado: estado ?? this.estado,
      tiempoEstudio: tiempoEstudio,
      tiempoDescanso: tiempoDescanso,
      sesionesHasta: sesionesHasta,
      tiempoRestante: tiempoRestante ?? this.tiempoRestante,
      distraccion: distraccion ?? this.distraccion,
      productividad: productividad ?? this.productividad,
      energiaColectiva: energiaColectiva ?? this.energiaColectiva,
      sincronizacion: sincronizacion ?? this.sincronizacion,
      heroeActualId: heroeActualId,
      usuarioId: usuarioId,
      habilidadesUsadasIds: habilidadesUsadasIds,
      efectosActivos: efectosActivos,
      oroGanado: oroGanado ?? this.oroGanado,
      expGanado: expGanado ?? this.expGanado,
      timestampInicio: timestampInicio,
      timestampFin: timestampFin ?? this.timestampFin,
    );
  }
}
