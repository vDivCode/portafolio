/// Una categoría del stack técnico (Frontend, Backend, etc.).
class StackGroup {
  const StackGroup({
    required this.title,
    required this.items,
    this.hotItems = const {},
  });

  final String title;
  final List<String> items;

  /// Ítems resaltados con el acento (lo que más quieres destacar).
  final Set<String> hotItems;
}
