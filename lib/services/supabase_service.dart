import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final client = Supabase.instance.client;

  Future<List<Hotel>?> getHotels() async {
    final supabase = Supabase.instance.client;
    final rawCourses = await supabase.from("hotel_room").select();
    final List<Hotel> hotels = [];
    for (final hotel in rawCourses) {
      hotels.add(Hotel.fromJson(hotel));
    }
    print(hotels);
    return hotels;
  }

  /* Future insertCourse(Hotel course) async {
    final supabase = Supabase.instance.client;
     await supabase.from('course').insert(course.toJson());
  }*/

  /* Future deleteCourse(String courseId) async {
    final supabase = Supabase.instance.client;
     await supabase.from('course').delete().eq('course_id', courseId);
  }*/

  Future<List<Hotel>?> getCities() async {
    final supabase = Supabase.instance.client;
    final rawCourses = await supabase.from('hotel_room').select('city');
    final List<Hotel> hotels = [];
    for (final hotel in rawCourses) {
      hotels.add(Hotel.fromJson(hotel));
    }
    return hotels;
  }

  /*Future<List<Student>?> getStudentsByCourseId(String courseId) async {
    final supabase = Supabase.instance.client;
    final rawStudents = await supabase.from('student').select('name, student_id').match(
      {'course_id': courseId},
    );
    final List<Student> students = [];
    for (final student in rawStudents) {
      students.add(Student.fromJson(student));
    }
    return students;
  }*/
}
