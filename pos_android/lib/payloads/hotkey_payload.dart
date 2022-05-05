class HotKeyPayload {
  final String name;
  final String code;
  late bool isLoad;
  late List<HotKeyItemPayload> items = [];

  HotKeyPayload({
    required this.code,
    required this.name,
    this.isLoad = true,
  });
}

class HotKeyItemPayload {
  String? imageUrl;
  final String name;
  final double price;

  HotKeyItemPayload({
    required this.name,
    required this.price,
  });
}
