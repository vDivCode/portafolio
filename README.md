# Portafolio — David Ventura Guzmán

Portafolio personal de proyectos de desarrollo web, móvil e integración de IA
(Model Context Protocol).

Construido con **Flutter**: una sola base de código que corre como **app móvil
(Android / iOS)** y como **sitio web** (Flutter Web). El portafolio es, en sí
mismo, una app móvil multiplataforma.

- **LinkedIn:** https://www.linkedin.com/in/david-ventura-guzman-821a54289/
- **GitHub:** https://github.com/vDivCode

## Stack del proyecto

- **Flutter / Dart** — UI declarativa, multiplataforma.
- **google_fonts** — Bricolage Grotesque + IBM Plex (Sans/Mono).
- **flutter_animate** — animaciones de entrada sobrias.
- **url_launcher** — enlaces externos y correo.

## Arquitectura (feature-first)

```
lib/
├─ main.dart                 # punto de entrada
├─ app.dart                  # MaterialApp + tema reactivo
├─ core/
│  ├─ theme/                 # tokens de color, tipografía, ThemeData, toggle
│  └─ utils/                 # helpers (abrir URLs / correo)
├─ data/
│  ├─ models/                # Project, MiniProject, StackGroup (tipados)
│  └─ portfolio_data.dart    # TODO el contenido como datos
├─ features/
│  ├─ home/                  # pantalla principal + barra fija
│  └─ sections/              # Hero, Projects, Stack, Contact
└─ widgets/                  # UI reutilizable (ChipTag, ProjectCard, ...)
```

Idea clave: **el contenido vive como datos tipados** (`data/`), separado de la
UI. Agregar un proyecto es añadir un objeto a `kProjects`, no copiar y pegar
widgets.

## Desarrollo local

Requiere el [SDK de Flutter](https://docs.flutter.dev/get-started/install)
(canal stable). Desde la raíz del proyecto:

```bash
flutter pub get          # instala dependencias
flutter run -d chrome    # corre en el navegador (desarrollo)
flutter test             # ejecuta las pruebas
flutter analyze          # análisis estático
```

Para correr en Android necesitas el SDK de Android (Android Studio). Para iOS,
una Mac con Xcode.

## Build web (para desplegar)

```bash
flutter build web --release
```

El resultado queda en `build/web/`, listo para publicar en Vercel, Netlify o
GitHub Pages.

## Versión anterior

El portafolio original (HTML/CSS estático de una sola página) se conserva en
[`legacy/index.html`](legacy/index.html).
