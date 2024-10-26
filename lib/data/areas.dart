class Area {
  final String college_id;
  final String building_id;
  final String floor_id;
  final String area_id;
  final String icon;
  final String area_name;
  final String building_name;
  final String college_name;

  Area(
    this.college_id,
    this.building_id,
    this.floor_id,
    this.area_id,
    this.icon,
    this.area_name,
    this.building_name,
    this.college_name
  );
}

List areas = [
  Area("CCJ", "B1", "F1", "A1","assets/images/roomicons/work_area.png", "Front Entrance", "CCJ Building", "College of Criminal Justice"),
  Area("CON", "B1", "F2", "A1", "assets/images/roomicons/hallway.png", "2nd Floor Hallway", "CON Building", "College of Nursing"),
  
];
/*
Area(2, "assets/images/roomicons/laboratory.png", "2nd Floor Laboratory Room", "CON Building", "College of Nursing"),
  Area(3, "assets/images/roomicons/dean_office.png", "2nd Floor Dean's Office", "CON Building", "College of Nursing"),
  Area(4, "assets/images/roomicons/hallway.png", "1st Floor Hallway", "CON Building", "College of Nursing"),
  Area(5, "assets/images/roomicons/work_area.png", "Technical Room", "University Gym", "College of Sports, Physical Education and Recreation"),
  Area(6, "assets/images/roomicons/work_area.png", "Stage Area", "University Gym", "College of Sports, Physical Education and Recreation"),
  */