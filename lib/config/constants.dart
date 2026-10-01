/// Constantes globales de la aplicación CONSTELA

// Duración Pomodoro
const Duration DURACION_ESTUDIO = Duration(minutes: 25);
const Duration DURACION_DESCANSO = Duration(minutes: 5);

// Atributos y bonificadores por raza
const Map<String, int> BONIFICADORES_RAZA = {
  'ASTRALES': 15, // Poder de Resolución
  'CELIDOS': 15, // Resistencia a Distracción
  'NEBULANOS': 15, // Velocidad de Enfoque
};

// Recompensas base
const int ORO_BASE_AULA = 100;
const int EXP_BASE_AULA = 50;

// Umbrales de experiencia
const int EXP_POR_NIVEL = 1000;

// Multiplicadores de skin
const Map<String, double> BONIFICADORES_SKIN = {
  'BASICO': 1.0,
  'EPICO': 1.15,
  'COLLECTOR': 1.25,
};

// Variables de aula
const double DISTRACCION_MAX = 100.0;
const double PRODUCTIVIDAD_MAX = 100.0;

// Cooldowns de habilidades (en segundos)
const Map<String, int> COOLDOWNS_HABILIDADES = {
  'escudo_mental': 10,
  'fortaleza_inquebrantable': 20,
  'regeneracion_academica': 15,
  'logica_aplastante': 8,
  'enfoque_total': 12,
  'lluvia_de_conocimiento': 18,
  'motivacion_colectiva': 15,
  'sanacion_grupal': 20,
  'sincronizacion_perfecta': 25,
};

// Rutas de assets
const String RUTA_HEROES = 'assets/heroes';
const String RUTA_VFX = 'assets/vfx';
const String RUTA_UI = 'assets/ui';

// Claves SharedPreferences
const String KEY_USUARIO = 'usuario_actual';
const String KEY_HEROES = 'heroes_desbloqueados';
const String KEY_SKINS = 'skins_desbloqueados';
const String KEY_AULA_ACTIVA = 'aula_activa';
const String KEY_HISTORIAL_RECOMPENSAS = 'historial_recompensas';
