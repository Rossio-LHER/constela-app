# CONSTELA - Arquitectura Base del Proyecto MVP

## 📐 Visión General

CONSTELA es una plataforma gamificada de estudio basada en:
- **Técnica Pomodoro** con salas virtuales colaborativas
- **Sistema de Héroes competitivos** (inspirado en Mobile Legends)
- **Rasas y Géneros** que otorgan bonificadores únicos
- **Skins customizables** con arte visual dinámico
- **Persistencia local** mediante SharedPreferences
- **Interfaz responsiva** para móvil y escritorio

---

## 🏗️ ESTRUCTURA DE CARPETAS

```
constela-app/
├── pubspec.yaml                    # Dependencias del proyecto
├── lib/
│   ├── main.dart                   # Punto de entrada
│   ├── config/
│   │   ├── theme.dart              # Temas y estilos globales
│   │   └── constants.dart          # Constantes de la app
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── usuario.dart        # Entidad Usuario + Raza + Género
│   │   │   ├── heroe.dart          # Entidad Héroe con roles
│   │   │   ├── habilidad.dart      # Entidad de Habilidades
│   │   │   ├── skin.dart           # Entidad Skins con rareza
│   │   │   ├── aula_virtual.dart   # Entidad Aula Pomodoro
│   │   │   └── recompensa.dart     # Entidad de Recompensas
│   │   └── repositories/
│   │       └── repositorio_abstracto.dart  # Interfaces para repos
│   ├── data/
│   │   ├── datasources/
│   │   │   ├── local_datasource.dart       # Manejo SharedPreferences
│   │   │   └── mock_datasource.dart        # Datos de prueba
│   │   ├── models/
│   │   │   ├── usuario_model.dart
│   │   │   ├── heroe_model.dart
│   │   │   ├── habilidad_model.dart
│   │   │   ├── skin_model.dart
│   │   │   ├── aula_model.dart
│   │   │   └── recompensa_model.dart
│   │   └── repositories/
│   │       └── repositorio_implementacion.dart
│   ├── presentation/
│   │   ├── providers/              # Estado con Riverpod o Provider
│   │   │   ├── usuario_provider.dart
│   │   │   ├── heroe_provider.dart
│   │   │   ├── aula_provider.dart
│   │   │   └── timer_provider.dart
│   │   ├── screens/
│   │   │   ├── splash_screen.dart
│   │   │   ├── registro_screen.dart
│   │   │   ├── home_screen.dart
│   │   │   ├── heroe_screen.dart
│   │   │   ├── skins_screen.dart
│   │   │   ├── aula_screen.dart
│   │   │   └── lobby_screen.dart
│   │   ├── widgets/
│   │   │   ├── responsive_layout.dart      # Layout adaptativo
│   │   │   ├── desktop_layout.dart
│   │   │   ├── mobile_layout.dart
│   │   │   ├── heroe_card.dart
│   │   │   ├── skin_selector.dart
│   │   │   ├── pomodoro_timer.dart
│   │   │   ├── vfx_efectos.dart
│   │   │   ├── barra_experiencia.dart
│   │   │   └── bottom_nav_bar.dart
│   │   └── utils/
│   │       ├── responsive_helper.dart      # Helpers responsivos
│   │       └── constantes_ui.dart
│   └── services/
│       ├── persistencia_service.dart       # SharedPreferences wrapper
│       ├── timer_service.dart              # Lógica del reloj Pomodoro
│       └── audio_service.dart              # SFX/Música (opcional)
├── assets/
│   ├── heroes/
│   │   ├── guardian/
│   │   │   ├── masculino/
│   │   │   │   ├── basico/
│   │   │   │   ├── epico/
│   │   │   │   └── collector/
│   │   │   └── femenino/
│   │   ├── especialista/
│   │   │   ├── masculino/
│   │   │   │   ├── basico/
│   │   │   │   ├── epico/
│   │   │   │   └── collector/
│   │   │   └── femenino/
│   │   └── soporte/
│   │       ├── masculino/
│   │       │   ├── basico/
│   │       │   ├── epico/
│   │       │   └── collector/
│   │       └── femenino/
│   ├── vfx/                        # Efectos visuales de habilidades
│   ├── ui/
│   │   ├── icons/
│   │   └── backgrounds/
│   └── fonts/
├── android/                        # Configuración Android
├── windows/                        # Configuración Windows
├── web/                            # Configuración Web (opcional)
└── README.md

```

---

## 🎮 MÓDULOS PRINCIPALES Y RESPONSABILIDADES

### 1️⃣ **DOMINIO (Lógica Pura - Sin Dependencias)**

#### **Entidad: Usuario**
```dart
- userId: String (UUID)
- nombre: String
- email: String
- raza: Raza (enum: ASTRALES, CELIDOS, NEBULANOS)
- genero: Genero (enum: MASCULINO, FEMENINO)
- nivel: int
- experienciaTotal: int
- heroeActual: Heroe
- heroesDesbloqueados: List<Heroe>
- skinsDesbloqueados: List<Skin>
- oro: int
- diamantes: int
- estadisticas: EstadisticasJugador
  - minutosEstudiados: int
  - salasCompletadas: int
  - habilidadesUsadas: int
- fechaCreacion: DateTime
- ultimoAcceso: DateTime
```

**Bonificadores por Raza:**
- Astrales: +15 Poder de Resolución (daño a distracciones)
- Célidos: +15 Resistencia a Distracción (durabilidad en sala)
- Nebulanos: +15 Velocidad de Enfoque (recarga de habilidades)

---

#### **Entidad: Héroe**
```dart
- heroeId: String
- nombre: String
- rol: Rol (enum: GUARDIAN_DEL_ENFOQUE, ESPECIALISTA_ACADEMICO, SOPORTE_MOTIVACIONAL)
- raza: Raza
- genero: Genero
- nivel: int
- experiencia: int (0-10000 por nivel)
- vidaBase: double (HP)
- vidaActual: double
- atributos: Atributos
  - poder: int (daño/efectividad)
  - resistencia: int (durabilidad)
  - velocidad: int (recarga de habilidades)
  - inteligencia: int (bonus de oro/exp)
- habilidades: List<Habilidad> (exactamente 3)
- skinEquipada: Skin
- estadisticasHeroe: EstadisticasHeroe
  - victorias: int
  - derrotas: int
  - assists: int
  - habilidadesUsadas: Map<String, int>
- bonificador: double (multiplicador de oro/exp, varía por raza)
```

**Roles y Arcotipos:**

a) **GuardianDelEnfoque (Tanque)**
   - Alto HP, resistencia
   - Habilidades defensivas/soporte
   - Ej: Habilidad 1 "Escudo Mental" (reduce daño en sala)

b) **EspecialistaAcademico (Mago)**
   - Alto daño/poder
   - Habilidades de control/utilidad
   - Ej: Habilidad 1 "Lógica Aplastante" (aumenta concentración)

c) **SoporteMotivacional (Soporte)**
   - Buffs a equipo
   - Habilidades de curación/utilidad
   - Ej: Habilidad 1 "Motivación Colectiva" (bonus exp grupal)

---

#### **Entidad: Habilidad**
```dart
- habilidadId: String
- nombre: String
- descripcion: String
- rol: Rol (de qué héroe es)
- tipoEfecto: TipoEfecto (enum: BUFF, DEBUFF, DAMAGE, HEAL, UTILITY)
- cooldown: Duration (tiempo entre usos)
- cooldownRestante: Duration
- costo: int (recursos de enfoque)
- efectoSala: EfectoSala
  - alteraVariable: String (ej: "tiempoPomodoro", "distraccion", "productividad")
  - magnitud: double (% de cambio o valor absoluto)
  - duracion: Duration (cuánto tiempo afecta)
- vfxId: String (referencia al asset de efecto visual)
- sonidoId: String (referencia al audio)
- bonificadorPorRaza: Map<Raza, double> (multiplicadores según raza)

// Método aplicar efecto en aula
aplicarEnSala(AulaVirtual aula) → void
```

**Ejemplo de Kit para GuardianDelEnfoque:**
1. "Escudo Mental" - Reduce distracción en 20% por 2 minutos
2. "Fortaleza Inquebrantable" - Immunidad a distracciones por 30 seg
3. "Regeneración Académica" - Restaura 15% enfoque del equipo

---

#### **Entidad: Skin**
```dart
- skinId: String
- nombre: String
- heroeId: String (a qué héroe pertenece)
- rareza: Rareza (enum: BASICO, EPICO, COLLECTOR)
- precio: int (costo en oro o diamantes)
- rutaAsset: String
  - Patrón: "assets/heroes/{raza}/{genero}/{skinId}/"
  - Archivos: sprite.png, idle.gif, effects.json
- bonificadorOro: double (1.0 = 0%, 1.15 = +15%)
- bonificadorExp: double
- efecto_vfx: String (estilo visual de habilidades)
- descripcion: String
- desbloqueado: bool
- equipada: bool
- fechaDesbloqueo: DateTime

// Método para equipar dinámicamente
equiparSkin() → void
  - Cambia rutaAsset
  - Aplica bonificadores
  - Recarga VFX de habilidades
```

**Rarezas:**
- **Básico**: Skin por defecto, sin bonificadores (100% oro/exp)
- **Épico**: Arte mejorado, +15% oro/exp, efectos VFX mejorados
- **Collector**: Skin exclusiva, +25% oro/exp, VFX premium, efectos de partículas

---

#### **Entidad: AulaVirtual**
```dart
- aulaId: String
- dueBenefId: String (ID único de sesión)
- estado: EstadoAula (enum: NO_INICIADA, ESTUDIANDO, DESCANSO, FINALIZADA)
- pomodoro: ConfigPomodoro
  - tiempoEstudio: Duration (default: 25 min)
  - tiempoDescanso: Duration (default: 5 min)
  - sesionesHasta: int (ciclos completar)
  - tiempoRestante: Duration
- participantes: List<ParticipanteAula>
  - heroeActual: Heroe
  - usuarioId: String
  - habilidadesUsadas: List<(habilidadId, timestamp)>
  - focusActual: double (0-100, energía enfoque)
- variables: VariablesAula
  - distraccion: double (0-100, aumenta con tiempo)
  - productividad: double (0-100, objetivo)
  - energiaColectiva: double (multiplicador de grupo)
  - sincronizacion: double (cohesión del equipo)
- efectos_activos: List<EfectoActivo>
  - habilidadId: String
  - duracionRestante: Duration
  - aplicadoPor: String (userId)
- recompensas_pendientes: RecompensasAula
  - oroBase: int
  - expBase: int
  - bonificadoresPendientes: List<Bonificador>
- timestamp_inicio: DateTime
- timestamp_fin: DateTime

// Método CRÍTICO: aplicar habilidades en tiempo real
aplicarHabilidadEnSala(String heroeId, String habilidadId) → void
  - Valida cooldown
  - Valida costo
  - Aplica efecto a variables
  - Agrega a efectos_activos
  - Dispara eventos de VFX
  - Actualiza UI

// Método: calcular recompensas al finalizar
calcularRecompensas() → Recompensa
  - oroBase * bonificadorSkin * bonificadorRaza * multiplicadorProductividad
  - expBase * bonificadorSkin * bonificadorRaza * multiplicadorProductividad
  - Guardar automáticamente (AUTOSAVE)
```

---

#### **Entidad: Recompensa**
```dart
- recompensaId: String
- usuarioId: String
- aulaId: String
- oroGanado: int
- expGanado: int
- itemsObteni dos: List<Item>
- estadisticasActualizadas: EstadisticasJugador
- timestamp: DateTime
- enGuardado: bool (para saber si ya se persistió)
```

---

### 2️⃣ **DATOS (Data Layer - Implementación)**

#### **LocalDataSource**
Maneja persistencia con `SharedPreferences`:
```dart
- guardarUsuario(Usuario) → Future<bool>
- obtenerUsuario() → Future<Usuario?>
- guardarHeroe(Heroe) → Future<bool>
- obtenerHeroes() → Future<List<Heroe>>
- guardarAula(AulaVirtual) → Future<bool>
- obtenerAulaActiva() → Future<AulaVirtual?>
- guardarRecompensas(List<Recompensa>) → Future<bool>
- obtenerHistorialRecompensas() → Future<List<Recompensa>>
- limpiarDatos() → Future<bool>
```

#### **MockDataSource**
Proporciona datos de prueba:
- Héroes preconfigurados
- Skins disponibles
- Usuarios ejemplo
- Aulas de muestra

#### **RepositorioImplementacion**
Une LocalDataSource + lógica:
```dart
crearCuenta(nombre, email, raza, genero) → Future<Usuario>
  - Crea UUID
  - Inicializa atributos según raza
  - Guarda en SharedPreferences
  - Retorna Usuario

equiparSkin(usuarioId, skinId) → Future<bool>
  - Valida que existe skin
  - Actualiza rutaAsset dinámicamente
  - Aplica bonificadores
  - Persiste cambios

obtenerHeroesDisponibles(usuarioId) → Future<List<Heroe>>
  - Carga desde SharedPreferences
  - Ordena por nivel/experiencia
  - Retorna lista

iniciarAula(...) → Future<AulaVirtual>
  - Crea nueva sesión
  - Inicia timer
  - Guarda estado inicial

finalizarAula(aulaId) → Future<Recompensa>
  - Calcula recompensas
  - Actualiza stats del héroe
  - Guarda automáticamente (AUTOSAVE)
  - Retorna recompensa
```

---

### 3️⃣ **PRESENTACIÓN (UI Layer - Widgets Responsivos)**

#### **ResponsiveLayout (Padre de toda la UI)**
```dart
// Detecta ancho de pantalla
if (MediaQuery.of(context).size.width > 900px)
  return DesktopLayout()  // Vista laptop
else
  return MobileLayout()   // Vista móvil
```

#### **DesktopLayout**
```
┌─────────────────────────────────────────┐
│         BARRA DE NAVEGACIÓN SUPERIOR    │
├──────────────┬──────────────────────────┤
│              │                          │
│  PANEL HÉROE │   PANEL AULA POMODORO   │
│              │                          │
│  - Avatar    │   - Reloj circular       │
│  - Nivel     │   - Botones Iniciar     │
│  - XP Bar    │   - Efectos VFX activos │
│  - Skin      │   - Variables de sala   │
│  - Stats     │   - Chat/Participantes  │
│              │   - Habilidades activas │
│              │                          │
│  SELECTOR    │                          │
│  DE SKINS    │                          │
│              │                          │
└──────────────┴──────────────────────────┘
```

#### **MobileLayout con BottomNavigationBar**
```
┌─────────────────────────────┐
│   APP BAR + NAVEGACIÓN      │
├─────────────────────────────┤
│                             │
│   CONTENIDO DINÁMICO        │
│   (Pestaña activa)          │
│                             │
│   - Héroe/Skins: vertical   │
│   - Aula: pomodoro en vivo  │
│                             │
├─────────────────────────────┤
│  [🦸] [📚] [⚙️] [👤]       │ ← Bottom Nav
└─────────────────────────────┘
```

#### **Widgets Clave**

**PomodoroTimer** (Central en Aula)
```dart
- Circular Timer (25:00 → 00:00)
- Estados: ESTUDIANDO / DESCANSO
- Botones: Iniciar, Pausar, Finalizar
- Display dinámico de tiempo restante
```

**HeroeCard** (Muestra héroe con skin)
```dart
- Imagen sprite dinámico (asset por skin)
- Nivel y barra de experiencia
- Atributos (poder, resistencia, velocidad)
- Botón equipar skin
```

**SkinSelector** (Carrusel/Grid de skins)
```dart
- Grid/Carrusel responsive
- Indicador de rareza (colores)
- Bonificadores mostrados
- Botón equipar/previsualizar
```

**VFXEfectos** (Efectos visuales de habilidades)
```dart
- Overlay de partículas animadas
- Duración según efecto
- Sincronización con aplicarHabilidadEnSala()
```

**BarraExperiencia**
```dart
- Barra lineal o circular
- % de progreso hacia siguiente nivel
- Animación al ganar XP
```

---

### 4️⃣ **SERVICIOS (Lógica Reutilizable)**

#### **PersistenciaService**
```dart
Wrapper de SharedPreferences:
- guardar(key, value)
- obtener(key)
- eliminar(key)
- limpiar()
- obtenerTodo()

Maneja serialización JSON automática para objetos complejos
```

#### **TimerService**
```dart
Lógica del Pomodoro:
- iniciar(duracion, onTick, onFinish)
- pausar()
- reanudar()
- detener()
- obtenerTiempoRestante()

Emite eventos cada segundo para actualizar UI
```

#### **AudioService** (Opcional, MVP mínimo)
```dart
- reproducirSFX(sonidoId)
- reproducirMusica(musicaId)
- pausarMusica()
```

---

### 5️⃣ **STATE MANAGEMENT (Riverpod/Provider)**

#### **Providers Clave**
```dart
// Usuario actual
final usuarioProvider = StateNotifierProvider<UsuarioNotifier, Usuario?>

// Héroe seleccionado
final heroeActualProvider = StateNotifierProvider<HeroeNotifier, Heroe?>

// Aula en progreso
final aulaActualProvider = StateNotifierProvider<AulaNotifier, AulaVirtual?>

// Timer Pomodoro
final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>

// Skins disponibles
final skinsProvider = FutureProvider<List<Skin>>

// Recompensas pendientes
final recompensasProvider = StateNotifierProvider<RecompensasNotifier, List<Recompensa>>
```

---

## 🔄 FLUJO DE INTERACCIÓN PRINCIPAL

### **Caso de Uso: Usuario inicia Aula Pomodoro con Héroe**

```
1. Usuario abre app → SplashScreen → verifica SharedPreferences
2. Si no hay usuario → RegistroScreen
   - Elige Raza (Astrales/Célidos/Nebulanos)
   - Elige Género (Masculino/Femenino)
   - Crea usuario → AUTOSAVE en SharedPreferences
3. HomeScreen → selecciona Héroe
4. Abre AulaScreen → selecciona Héroe con Skin equipada
5. Inicia Pomodoro → Timer comienza (25 min)
6. Durante sesión:
   - Variables de AulaVirtual aumentan/disminuyen (distracción, productividad)
   - Usuario ejecuta habilidades → aplicarHabilidadEnSala()
   - Efectos visuales (VFX) se disparan
   - UI actualiza en tiempo real
7. Timer finaliza → calcularRecompensas()
   - oro = oroBase * skinBonus * razaBonus * productividadBonus
   - exp = expBase * skinBonus * razaBonus * productividadBonus
   - Héroe gana XP → sube de nivel
8. AUTOSAVE → guarda Usuario + Héroe + Recompensas en SharedPreferences
9. Pantalla de recompensas → vuelve a HomeScreen
```

---

## 📱 ADAPTABILIDAD RESPONSIVA

### **Breakpoints**
- **Móvil**: < 600 dp (MobileLayout con Bottom Nav)
- **Tablet**: 600-900 dp (Layout híbrido)
- **Escritorio**: > 900 dp (DesktopLayout con paneles)

### **Ajustes por dispositivo**

**Móvil:**
- Fuentes: reducidas 20%
- Padding: 12 dp en lugar de 24 dp
- Bottom Nav: 5 pestañas swipeables
- Pomodoro: pantalla completa con botones grandes

**Escritorio:**
- Paneles lado a lado
- Fuentes normales
- Sidebar persistente con héroe
- Reloj Pomodoro en centro grande

---

## 💾 AUTOSAVE Y PERSISTENCIA

### **Puntos de Guardado**
1. **Al finalizar Aula** → guarda Usuario, Héroe, Recompensas
2. **Al equipar Skin** → actualiza Héroe al instante
3. **Al subir Nivel** → actualiza Usuario
4. **Periódicamente cada 30 seg** (si hay cambios pendientes)

### **Estructura JSON en SharedPreferences**
```json
{
  "usuario_actual": { ... serializado ... },
  "heroes_desbloqueados": [ ... array ... ],
  "skins_desbloqueados": [ ... array ... ],
  "aula_activa": { ... o null ... },
  "historial_recompensas": [ ... últimas 50 ... ]
}
```

---

## 🎨 SISTEMA DE ASSETS

### **Estructura de Sprites de Héroes**
```
assets/heroes/
├── astrales/           # Raza
│   ├── masculino/      # Género
│   │   ├── basico/     # Rareza
│   │   │   ├── sprite.png
│   │   │   ├── idle.gif
│   │   │   └── effects.json
│   │   ├── epico/
│   │   └── collector/
│   └── femenino/
├── celidos/
│   ├── masculino/
│   └── femenino/
└── nebulanos/
    ├── masculino/
    └── femenino/
```

### **Carga Dinámica de Sprites**
```dart
String rutaSprite = "assets/heroes/${heroe.raza}/${heroe.genero}/${skin.skinId}/sprite.png"
Image.asset(rutaSprite) // Flutter carga dinámicamente
```

---

## 🛠️ DEPENDENCIAS PRINCIPALES (pubspec.yaml)

```yaml
dependencies:
  flutter: sdk: flutter
  
  # State Management
  riverpod: ^2.0.0
  flutter_riverpod: ^2.0.0
  
  # Persistencia Local
  shared_preferences: ^2.0.0
  
  # Serialización JSON
  json_serializable: ^6.0.0
  json_annotation: ^4.0.0
  
  # UI Responsiva
  responsive_framework: ^1.1.0
  
  # Utilidades
  uuid: ^3.0.0
  intl: ^0.18.0
  
  # Animaciones
  flutter_animate: ^4.0.0
  
  # Debugging (dev)
  dev_dependencies:
    build_runner: ^2.0.0
```

---

## ⚙️ PRINCIPIOS ARQUITECTÓNICOS (SOLID)

### **S - Single Responsibility**
- Cada clase maneja UNA responsabilidad
- `Usuario` no gestiona habilidades
- `Heroe` no persiste datos

### **O - Open/Closed**
- Abierto para extensión (agregar nuevos roles)
- Cerrado para modificación

### **L - Liskov Substitution**
- `Heroe` puede ser `GuardianDelEnfoque`, `EspecialistaAcademico`, `SoporteMotivacional`
- Todos cumplen contrato `Heroe`

### **I - Interface Segregation**
- `RepositorioAbstracto` define interfaz clara
- Implementadores solo usan lo que necesitan

### **D - Dependency Inversion**
- Presentación depende de Dominio, no al revés
- `AulaScreen` inyecta `RepositorioAbstracto`

---

## 📊 DIAGRAMA DE CAPAS

```
┌──────────────────────────────────────────┐
│     PRESENTACIÓN (UI)                    │
│  Screens, Widgets, Providers             │
└──────────────────────────────────────────┘
              ↕ (depende de)
┌──────────────────────────────────────────┐
│     DOMINIO (Lógica Pura)                │
│  Entities, Reglas de Negocio             │
└──────────────────────────────────────────┘
              ↕ (implementa)
┌──────────────────────────────────────────┐
│     DATOS (Persistencia)                 │
│  Repositories, DataSources, Models       │
└──────────────────────────────────────────┘
              ↕ (usa)
┌──────────────────────────────────────────┐
│     EXTERNA (SharedPreferences, Archivos)│
└──────────────────────────────────────────┘
```

---

## 🚀 PRÓXIMOS PASOS

1. ✅ Arquitectura definida (ESTE DOCUMENTO)
2. ⏳ Implementar `pubspec.yaml` con dependencias
3. ⏳ Crear clases de Dominio (Entities)
4. ⏳ Implementar DataLayer (Repositories, Models)
5. ⏳ Crear Providers de estado (Riverpod)
6. ⏳ Desarrollar Screens y Widgets responsivos
7. ⏳ Integrar timers y lógica de Pomodoro
8. ⏳ Implementar AUTOSAVE
9. ⏳ Testing y debugging
10. ⏳ Build para Android (.apk) y Windows (.exe)

---

## 📝 NOTAS IMPORTANTES

- **Reutilización de código**: Los widgets se parametrizan para móvil y escritorio
- **Reactividad**: Riverpod permite actualizar UI automáticamente cuando cambian datos
- **Performance**: SharedPreferences es suficiente para MVP; escalará a Hive/SQLite si es necesario
- **Modularidad**: Cada carpeta puede convertirse en paquete separado (package) en futuro
- **Testing**: Cada capa tendrá tests unitarios aislados

---

**LISTO PARA IMPLEMENTACIÓN COMPLETA** ✅
```

