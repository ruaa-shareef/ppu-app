import 'package:attendance/screens/coursesList.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget 
{
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  var _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.30,
                margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: Center(
                  child: FittedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/images/PPU-logo.png'),
                      radius: 120,
                    ),
                  ),
                ),
              ),
              Container(
                height: deviceHeight * 0.65,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (ctx,constraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('login',style:TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                      SizedBox(height: constraints.maxHeight * 0.08,),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'الاسم باللغة العربية',

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Container(
                        height: constraints.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              obscureText: _isVisible ? false : true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isVisible = !_isVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _isVisible? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: 'supervisor number',
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        //children: [
                          //Text('remember user ?',
                            //style: TextStyle(
                              //  color: Color.fromRGBO(29, 28, 28, 1),
                          //),
                          //),
                        //],
                      //),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.12,
                        margin: EdgeInsets.only(
                          top: constraints.maxHeight * 0.05,
                        ),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const CoursesList())
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 22
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(29, 28, 28, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02,),
                    ],
                  );
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
