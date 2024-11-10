class Tags {

  List<String> collegeTags = ["All", "CCJ", "CON", "CSPEAR"];

  List<String> ccjBuildingTags = ["CCJ Building"];
  List<String> conBuildingTags = ["CON Building"];
  List<String> cspearBuildingTags = ["University Gym"];

  late List<String> allBuildingTags;

  Tags() {
    allBuildingTags = [...ccjBuildingTags, ...ccjBuildingTags, ...cspearBuildingTags];
  }
}