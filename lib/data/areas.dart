class Area {
  final String college_id;
  final String building_id;
  final String floor_id;
  final String area_id;
  final String icon;
  final String area_name;
  final String building_name;
  final String college_name;

  Area({
    required this.college_id,
    required this.building_id,
    required this.floor_id,
    required this.area_id,
    required this.icon,
    required this.area_name,
    required this.building_name,
    required this.college_name
  });
}

List<Area> allAreas = [...ccjAreas, ...conAreas, ...cspearAreas];



List<Area> ccjAreas = [
  Area(
  college_id: "CCJ", building_id: "B1", floor_id: "F1", area_id: "A1",
  icon: "assets/images/roomicons/work_area.png", 
  area_name: "Front Entrance", 
  building_name: "CCJ Building", 
  college_name: "College of Criminal Justice"),
];

List<Area> conAreas = [
  //First Floor
  Area(
  college_id: "CON", building_id: "B1", floor_id: "F1", area_id: "A1",
  icon: "assets/images/roomicons/hallway.png", 
  area_name: "1st Floor Hallway", 
  building_name: "CON Building", 
  college_name: "College of Nursing"),

  //Second floor
  Area(
  college_id: "CON", building_id: "B1", floor_id: "F2", area_id: "A2",
  icon: "assets/images/roomicons/hallway.png", 
  area_name: "2nd Floor Hallway", 
  building_name: "CON Building", 
  college_name: "College of Nursing"),

  Area(
  college_id: "CON", building_id: "B1", floor_id: "F2", area_id: "A3",
  icon: "assets/images/roomicons/laboratory.png", 
  area_name: "2nd Floor Laboratory Room", 
  building_name: "CON Building", 
  college_name: "College of Nursing"),

  Area(
  college_id: "CON", building_id: "B1", floor_id: "F2", area_id: "A4",
  icon: "assets/images/roomicons/dean_office.png", 
  area_name: "2nd Floor Dean's Office", 
  building_name: "CON Building", 
  college_name: "College of Nursing"),
];

List<Area> cspearAreas = [
  Area(
  college_id: "CSPEAR", building_id: "B1", floor_id: "F1", area_id: "A1",
  icon: "assets/images/roomicons/work_area.png", 
  area_name: "Technical Room", 
  building_name: "University Gym", 
  college_name: "College of Sports, Physical Education and Recreation"),

  Area(
  college_id: "CSPEAR", building_id: "B1", floor_id: "F1", area_id: "A2",
  icon: "assets/images/roomicons/work_area.png", 
  area_name: "Stage Area", 
  building_name: "University Gym", 
  college_name: "College of Sports, Physical Education and Recreation"),
];

/*
Area("CON", "B1", "F2", "A1", "assets/images/roomicons/hallway.png", "2nd Floor Hallway", "CON Building", "College of Nursing"),
Area(2, "assets/images/roomicons/laboratory.png", "2nd Floor Laboratory Room", "CON Building", "College of Nursing"),
  Area(3, "assets/images/roomicons/dean_office.png", "2nd Floor Dean's Office", "CON Building", "College of Nursing"),
  Area(4, "assets/images/roomicons/hallway.png", "1st Floor Hallway", "CON Building", "College of Nursing"),
  Area(5, "assets/images/roomicons/work_area.png", "Technical Room", "University Gym", "College of Sports, Physical Education and Recreation"),
  Area(6, "assets/images/roomicons/work_area.png", "Stage Area", "University Gym", "College of Sports, Physical Education and Recreation"),
  */