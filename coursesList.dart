import 'package:attendance/screens/Course.dart';
import 'package:attendance/screens/studentList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoursesList extends StatefulWidget 
{
  const CoursesList({Key? key}) : super(key: key);
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList>{

  List<Course> course = [
     Course(courseName: 'Flutter', RoomNo: 'C220', bio: "8:00 - 9:15"),
     Course(courseName: 'Web', RoomNo: 'C304', bio: "8:00 - 9:15"),
     Course(courseName: 'Java', RoomNo: 'C225', bio: "8:00 - 9:15",)
  ];

  Widget courseDetailCard(Course) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => studentsList()));
         },
         child: Card(
           color: Color.fromARGB(255, 233, 222, 222),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                       width: 50.0,
                       height: 50.0,
                       decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 192, 188, 188),
                            width: 2,
                          ),
                       ),
                       child: Center(
                         child: Text(Course.RoomNo),
                       ),
                      ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(Course.courseName,
                       style: TextStyle (color: Colors.black,fontSize: 25),
                     ),
                     Text(Course.bio,
                       style: TextStyle (
                           color: Colors.black,
                           fontSize: 18,
                       ),
                     )
                   ],
                 )
               ],
             ),
           ),
         ),
       ),
     );
   }

    @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    //String formattedDate = formatter.format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/PPU-logo.png'),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text('$formatter',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),
                  ),
                  )
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: course.map((p) {
                return courseDetailCard(p);
              }).toList()
            )
          ],
        ),
      ),
    );
  }
}

