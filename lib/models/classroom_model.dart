import 'dart:convert';

class ClassRoomModel {
  int course_id;
  String course_random;
  String subject_id;
  int category_id;
  String course_name;
  String academic_year;
  String description;
  String keywords_tags;
  int teacher_id;
  String create_datetime;
  String update_datetime;
  int school;
  int sec_id;
  int section_id;
  int student_id;
  String audience_id;
  String student_name;
  String student_surname;
  String phone;
  String email_address;
  ClassRoomModel({
    required this.course_id,
    required this.course_random,
    required this.subject_id,
    required this.category_id,
    required this.course_name,
    required this.academic_year,
    required this.description,
    required this.keywords_tags,
    required this.teacher_id,
    required this.create_datetime,
    required this.update_datetime,
    required this.school,
    required this.sec_id,
    required this.section_id,
    required this.student_id,
    required this.audience_id,
    required this.student_name,
    required this.student_surname,
    required this.phone,
    required this.email_address,
  });

  ClassRoomModel copyWith({
    int? course_id,
    String? course_random,
    String? subject_id,
    int? category_id,
    String? course_name,
    String? academic_year,
    String? description,
    String? keywords_tags,
    int? teacher_id,
    String? create_datetime,
    String? update_datetime,
    int? school,
    int? sec_id,
    int? section_id,
    int? student_id,
    String? audience_id,
    String? student_name,
    String? student_surname,
    String? phone,
    String? email_address,
  }) {
    return ClassRoomModel(
      course_id: course_id ?? this.course_id,
      course_random: course_random ?? this.course_random,
      subject_id: subject_id ?? this.subject_id,
      category_id: category_id ?? this.category_id,
      course_name: course_name ?? this.course_name,
      academic_year: academic_year ?? this.academic_year,
      description: description ?? this.description,
      keywords_tags: keywords_tags ?? this.keywords_tags,
      teacher_id: teacher_id ?? this.teacher_id,
      create_datetime: create_datetime ?? this.create_datetime,
      update_datetime: update_datetime ?? this.update_datetime,
      school: school ?? this.school,
      sec_id: sec_id ?? this.sec_id,
      section_id: section_id ?? this.section_id,
      student_id: student_id ?? this.student_id,
      audience_id: audience_id ?? this.audience_id,
      student_name: student_name ?? this.student_name,
      student_surname: student_surname ?? this.student_surname,
      phone: phone ?? this.phone,
      email_address: email_address ?? this.email_address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'course_id': course_id,
      'course_random': course_random,
      'subject_id': subject_id,
      'category_id': category_id,
      'course_name': course_name,
      'academic_year': academic_year,
      'description': description,
      'keywords_tags': keywords_tags,
      'teacher_id': teacher_id,
      'create_datetime': create_datetime,
      'update_datetime': update_datetime,
      'school': school,
      'sec_id': sec_id,
      'section_id': section_id,
      'student_id': student_id,
      'audience_id': audience_id,
      'student_name': student_name,
      'student_surname': student_surname,
      'phone': phone,
      'email_address': email_address,
    };
  }

  factory ClassRoomModel.fromMap(Map<String, dynamic> map) {
    return ClassRoomModel(
      course_id: map['course_id'],
      course_random: map['course_random'],
      subject_id: map['subject_id'],
      category_id: map['category_id'],
      course_name: map['course_name'],
      academic_year: map['academic_year'],
      description: map['description'],
      keywords_tags: map['keywords_tags'],
      teacher_id: map['teacher_id'],
      create_datetime: map['create_datetime'],
      update_datetime: map['update_datetime'],
      school: map['school'],
      sec_id: map['sec_id'],
      section_id: map['section_id'],
      student_id: map['student_id'],
      audience_id: map['audience_id'],
      student_name: map['student_name'],
      student_surname: map['student_surname'],
      phone: map['phone'],
      email_address: map['email_address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassRoomModel.fromJson(String source) =>
      ClassRoomModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassRoomModel(course_id: $course_id, course_random: $course_random, subject_id: $subject_id, category_id: $category_id, course_name: $course_name, academic_year: $academic_year, description: $description, keywords_tags: $keywords_tags, teacher_id: $teacher_id, create_datetime: $create_datetime, update_datetime: $update_datetime, school: $school, sec_id: $sec_id, section_id: $section_id, student_id: $student_id, audience_id: $audience_id, student_name: $student_name, student_surname: $student_surname, phone: $phone, email_address: $email_address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassRoomModel &&
        other.course_id == course_id &&
        other.course_random == course_random &&
        other.subject_id == subject_id &&
        other.category_id == category_id &&
        other.course_name == course_name &&
        other.academic_year == academic_year &&
        other.description == description &&
        other.keywords_tags == keywords_tags &&
        other.teacher_id == teacher_id &&
        other.create_datetime == create_datetime &&
        other.update_datetime == update_datetime &&
        other.school == school &&
        other.sec_id == sec_id &&
        other.section_id == section_id &&
        other.student_id == student_id &&
        other.audience_id == audience_id &&
        other.student_name == student_name &&
        other.student_surname == student_surname &&
        other.phone == phone &&
        other.email_address == email_address;
  }

  @override
  int get hashCode {
    return course_id.hashCode ^
        course_random.hashCode ^
        subject_id.hashCode ^
        category_id.hashCode ^
        course_name.hashCode ^
        academic_year.hashCode ^
        description.hashCode ^
        keywords_tags.hashCode ^
        teacher_id.hashCode ^
        create_datetime.hashCode ^
        update_datetime.hashCode ^
        school.hashCode ^
        sec_id.hashCode ^
        section_id.hashCode ^
        student_id.hashCode ^
        audience_id.hashCode ^
        student_name.hashCode ^
        student_surname.hashCode ^
        phone.hashCode ^
        email_address.hashCode;
  }
}
