/// Un proyecto del portafolio.
///
/// Esta clase es el corazón del refactor: en el HTML original cada proyecto era
/// un bloque `<article>` repetido a mano. Aquí es un objeto tipado; la UI se
/// genera recorriendo una lista de estos. Agregar un proyecto = un objeto más.
class Project {
  const Project({
    required this.title,
    required this.role,
    required this.description,
    required this.tags,
    this.featured = false,
    this.liveUrl,
    this.codeUrl,
    this.privateNote,
    this.demoNote,
    this.hotTags = const {},
  });

  /// Nombre del proyecto.
  final String title;

  /// Subtítulo corto (rol o tipo de sistema).
  final String role;

  /// Descripción de lo que hiciste.
  final String description;

  /// Tecnologías usadas (se pintan como chips).
  final List<String> tags;

  /// Tags que se resaltan con el color de acento (p. ej. MCP, IA).
  final Set<String> hotTags;

  /// Si es el proyecto destacado (ocupa el ancho completo).
  final bool featured;

  /// URL de demo en vivo, si existe.
  final String? liveUrl;

  /// URL del repositorio, si es público.
  final String? codeUrl;

  /// Nota cuando el repo es privado (reemplaza al botón de código).
  final String? privateNote;

  /// Aviso opcional sobre la demo (p. ej. "tarda en despertar").
  final String? demoNote;

  bool get hasLive => liveUrl != null;
  bool get hasCode => codeUrl != null;
}

/// Un proyecto menor que solo se enlaza en vivo (grilla "Más proyectos").
class MiniProject {
  const MiniProject({
    required this.title,
    required this.description,
    required this.liveUrl,
  });

  final String title;
  final String description;
  final String liveUrl;
}
