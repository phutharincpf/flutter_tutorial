class MenuPayload {
  final String nameLocal;
  final String pathname;
  final String? svgPath;
  final bool? active;
  final bool? isDivider;

  MenuPayload({
    required this.nameLocal,
    required this.pathname,
    this.svgPath,
    this.active,
    this.isDivider,
  });
}
