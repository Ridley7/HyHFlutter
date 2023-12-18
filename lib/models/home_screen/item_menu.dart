class ItemMenu {
  String imageBackground;
  String labelSection;
  String route;
  int amountCells;
  double? positionRightLabel;
  double? positionLeftLabel;
  bool allWidth;

  ItemMenu({
    required this.imageBackground,
    required this.labelSection,
    required this.route,
    required this.amountCells,
    required this.positionRightLabel,
    required this.positionLeftLabel,
    required this.allWidth
  });

  factory ItemMenu.fromJson(Map<String, dynamic> json){
    print("FLAG 100");
    print(json.toString());

    return ItemMenu(
      imageBackground: json["imageBackground"],
      labelSection: json["labelSection"],
      route: json["route"],
      amountCells: json["amountCells"],
      positionRightLabel: json["positionRightLabel"] == null ? null : json["positionRightLabel"].toDouble(),
      positionLeftLabel: json["positionLeftLabel"] == null ? null : json["positionLeftLabel"].toDouble(),
      allWidth: json["allWidth"],
    );
  }
}