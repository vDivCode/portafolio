import 'models/project.dart';
import 'models/stack_group.dart';

/// Datos del dueño del portafolio. Todo el "contenido" vive aquí, separado de
/// la UI: así editar textos no te obliga a tocar widgets.
class Profile {
  const Profile._();

  static const brand = 'vDivCode';
  static const name = 'David Ventura Guzmán';
  static const eyebrow = 'Desarrollador · IA / MCP · Móvil · Trujillo, Perú';
  static const lead =
      'Estudiante de Ingeniería de Sistemas que construye aplicaciones web y '
      'móviles, y conecta la IA con datos reales mediante el Model Context '
      'Protocol.';
  static const availability = 'Disponible para prácticas preprofesionales';
  static const contactPitch =
      'Busco una práctica donde aportar en proyectos reales, aprender buenas '
      'prácticas y seguir creciendo. Escríbeme y te respondo pronto.';

  static const email = 'david.02.vg@gmail.com';
  static const linkedIn =
      'https://www.linkedin.com/in/david-ventura-guzman-821a54289/';
  static const github = 'https://github.com/vDivCode';

  static const footerLeft = 'David Alonso Ventura Guzmán · Trujillo, Perú';
  static const footerRight = 'Ingeniería de Sistemas e Informática · UTP';
}

/// Proyectos destacados y en tarjeta.
const List<Project> kProjects = [
  Project(
    title: 'campus-utp — Servidor MCP académico',
    role: 'Proyecto grupal · desarrollé el servidor MCP',
    description:
        'Un servidor MCP (Model Context Protocol) que conecta el expediente '
        'académico de un alumno con la bolsa de prácticas: el modelo ve sus '
        'notas y las vacantes abiertas, y le dice a cuál califica y qué le '
        'falta. Implementé 9 herramientas (notas, horarios, aulas libres, '
        'cruce de vacantes), recursos y prompts, con autenticación OAuth 2.1 '
        '(PKCE), transportes HTTP y stdio, y un plugin para Claude y ChatGPT. '
        'Desplegado en Render.',
    tags: ['MCP', 'TypeScript', 'Node', 'OAuth 2.1 / PKCE', 'JSON-RPC', 'Render'],
    hotTags: {'MCP'},
    featured: true,
    liveUrl: 'https://campus-utp.onrender.com',
    privateNote: 'Código privado (trabajo grupal)',
    demoNote:
        'La demo corre en un plan gratuito: si está dormida, tarda ~50 s en '
        'despertar. Si la primera carga falla, reintenta.',
  ),
  Project(
    title: 'Plus Twenty',
    role: 'Sistema de gestión académica',
    description:
        'Matrícula en línea, portal de estudiantes y apoderados, asistencia, y '
        'cobranza con comprobantes. Control de acceso por roles con Spring '
        'Security y cifrado BCrypt, persistencia con JPA/Hibernate y pruebas '
        'automatizadas.',
    tags: ['Java', 'Spring Boot', 'Spring Security', 'JPA'],
    privateNote: 'Repo privado · demo bajo pedido',
  ),
  Project(
    title: 'Tic-Tac Trux',
    role: 'Sistema de reservas de hotel',
    description:
        'Aplicación web con Spring Data JPA/Hibernate y base de datos MySQL en '
        'la nube (Aiven), modelado de entidades y validaciones, seguridad '
        'stateless con JWT y BCrypt, y vistas Thymeleaf responsivas.',
    tags: ['Java', 'Spring Boot 3.4.5', 'JWT', 'MySQL', 'Thymeleaf'],
    privateNote: 'Repo privado · demo bajo pedido',
  ),
  Project(
    title: 'Proyecto Web',
    role: 'Next.js + Spring Boot',
    description:
        'Frontend en Next.js con TypeScript e interfaces responsive en '
        'Tailwind, y un backend en Spring Boot que expone una API REST para la '
        'gestión de datos.',
    tags: ['Next.js', 'TypeScript', 'Tailwind', 'Spring Boot'],
    privateNote: 'Repo privado · demo bajo pedido',
  ),
  Project(
    title: 'Calculadora Panel Solar',
    role: 'Hidrosolar · cálculo e implementación',
    description:
        'Herramienta en TypeScript para dimensionar paneles solares, con '
        'calculadora y dashboard de resultados.',
    tags: ['TypeScript', 'Vercel', 'Dashboard'],
    liveUrl: 'https://calculadora-panel-solar.vercel.app/',
    codeUrl: 'https://github.com/vDivCode/CalculadoraPanelSolar',
  ),
  Project(
    title: 'Sistema de Ahorro IA',
    role: 'Gestión de ahorro con IA',
    description:
        'Aplicación en TypeScript para seguimiento de ahorro, explorando el '
        'uso de IA dentro del flujo de la app.',
    tags: ['IA', 'TypeScript'],
    hotTags: {'IA'},
    codeUrl: 'https://github.com/vDivCode/SistemaDeAhorro-IA',
  ),
  Project(
    title: 'Talently UI',
    role: 'Interfaz · práctica en Talently',
    description:
        'Componentes e interfaz de usuario con Vue.js y maquetación '
        'responsiva, en el contexto de mi colaboración como asistente de '
        'proyecto en Talently.',
    tags: ['Vue.js', 'Tailwind'],
    codeUrl: 'https://github.com/vDivCode/Talently-UI',
  ),
  Project(
    title: 'Apps de escritorio en Java',
    role: 'Sistema de Ventas · Biblioteca (CRUD)',
    description:
        'Aplicaciones de escritorio con operaciones CRUD para la gestión de '
        'usuarios, ventas e inventario, con MySQL y SQL Server.',
    tags: ['Java', 'MySQL', 'SQL Server'],
    codeUrl: 'https://github.com/vDivCode/ProyectoIntegrador',
  ),
];

/// Proyectos menores que solo se enlazan en vivo.
const List<MiniProject> kMiniProjects = [
  MiniProject(
    title: 'Hidrosolar Calculadora',
    description: 'Calculadora y dashboard para paneles solares.',
    liveUrl: 'https://calculadora-panel-solar.vercel.app/',
  ),
  MiniProject(
    title: 'Hidrosolar',
    description: 'Plataforma de cálculo e implementación de paneles solares.',
    liveUrl: 'https://mi-proyecto-web-bibx.onrender.com',
  ),
  MiniProject(
    title: 'Brújula Vocacional',
    description: 'Test vocacional basado en paradigmas de la carrera.',
    liveUrl: 'https://testvocacional.integratify.io/',
  ),
];

/// Stack técnico agrupado por categoría.
const List<StackGroup> kStack = [
  StackGroup(
    title: 'Frontend',
    items: [
      'Vue.js', 'Nuxt.js', 'Next.js', 'TypeScript', 'Tailwind CSS', 'HTML', 'CSS',
    ],
  ),
  StackGroup(
    title: 'Backend',
    items: [
      'Java', 'Spring Boot', 'Spring Data JPA', 'Spring Security', 'API REST',
      'Node.js',
    ],
  ),
  StackGroup(
    title: 'Móvil (aprendiendo)',
    items: ['Flutter', 'Dart', 'Material Design'],
    hotItems: {'Flutter'},
  ),
  StackGroup(
    title: 'Datos',
    items: [
      'MySQL', 'SQL Server', 'H2', 'JPA / Hibernate', 'SQL', 'BD en la nube (Aiven)',
    ],
  ),
  StackGroup(
    title: 'IA y herramientas',
    items: [
      'MCP', 'OAuth 2.1 / PKCE', 'JWT', 'Claude Code', 'Git / GitHub',
      'Render / Vercel',
    ],
    hotItems: {'MCP'},
  ),
];
