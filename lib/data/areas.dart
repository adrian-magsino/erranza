class Area {
  final String icon;
  final String area_name;
  final String building_name;
  final String college_name;

  Area(
    this.icon,
    this.area_name,
    this.building_name,
    this.college_name
  );
}

List areas = [
  Area("assets/images/roomicons/work_area.png", "Front Entrance", "CCJ Building", "College of Criminal Justice"),
  Area("assets/images/roomicons/hallway.png", "2nd Floor Hallway", "CON Building", "College of Nursing"),
  Area("assets/images/roomicons/laboratory.png", "2nd Floor Laboratory Room", "CON Building", "College of Nursing"),
  Area("assets/images/roomicons/dean_office.png", "2nd Floor Dean's Office", "CON Building", "College of Nursing"),
  Area("assets/images/roomicons/hallway.png", "1st Floor Hallway", "CON Building", "College of Nursing"),
  Area("assets/images/roomicons/work_area.png", "Technical Room", "University Gym", "College of Sports, Physical Education and Recreation"),
  Area("assets/images/roomicons/work_area.png", "Stage Area", "University Gym", "College of Sports, Physical Education and Recreation"),

];