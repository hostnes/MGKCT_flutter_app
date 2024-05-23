class Teacher {
  final int id;
  final String name;
  final String imgPath;

  Teacher({required this.id, required this.name, required this.imgPath});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Teacher otherTeacher = other as Teacher;
    return id == otherTeacher.id &&
        name == otherTeacher.name &&
        imgPath == otherTeacher.imgPath;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imgPath.hashCode;
}
