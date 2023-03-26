import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  Future<void> signin(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('Signin successful');
      } else {
        print('Signin failed');
      }
    } catch (error) {
      print('Error: $error.message');
    }
  }

  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  signin(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/login'),
        body: {
          'email': email,
          'password': password,

        },
      );
      if (response.statusCode == 200) {
        print('Signin successful');
      } else {
        print('Signin failed');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;  //width
    double h = MediaQuery.of(context).size.height;  //height
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                //color: Colors.cyan.shade50,
                width: w,
                height: h*0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/ccc.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.cyan.shade50,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HELLO,",
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("sign into your account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.cyan.shade400,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.cyan.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "email id",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue.shade600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.cyan.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.blue.shade600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  // Row(
                  //   children: [
                  //     Expanded(child: Container(),),
                  //     Text("Forget Password ? ",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.normal,
                  //         color: Colors.lightBlueAccent.shade400,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/blue.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child:  Center(
                child: ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();
                    signin(email, password);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // set primary color to transparent
                    elevation: 0, // set elevation of the button
                  ),
                child: Text("Sign in",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                ),
              ),
            ),
            ),

            SizedBox(height: w*0.07,),
            RichText(text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: " Create",
                    recognizer: DoubleTapGestureRecognizer()
                      ..onDoubleTap = () {
                        Navigator.pushNamed(context, 'register');
                      },
                    style: TextStyle(
                      color: Colors.cyan.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]

            ),
            ),
          ],
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
//
// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);
//
//   @override
//   _MyLoginState createState() => _MyLoginState();
// }
//
// class _MyLoginState extends State<MyLogin> {
//   @override
//   Widget build(BuildContext context) {
//     // double w = MediaQuery.of(context).size.width;  //width
//     // double h = MediaQuery.of(context).size.height;  //height
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/login.png'),
//             fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             //Container(),
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 130),
//               child: Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Email",
//                                 prefixIcon: Icon(Icons.mail, color: Colors.black54),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Password",
//                                 prefixIcon: Icon(Icons.security, color: Colors.black54,),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 40,
//                            ),
//                           Container(
//                             width: double.infinity,  // double.infinity
//                             child: RawMaterialButton(
//                                 onPressed: (){},
//                               child: Text("SIGN IN",
//                                 style:
//                                   TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                     color: Colors.white,
//                                   ),
//                               ),
//                               elevation: 0.0,
//                               padding: EdgeInsets.symmetric(vertical: 18),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(40.0),
//                               ),
//                               fillColor: Colors.lightBlue,
//                             ),
//                           ),
//                           TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'Forgot Password',
//                                 textAlign: TextAlign.right,
//                                 style: TextStyle(
//                                   decoration: TextDecoration.underline,
//                                   color: Colors.blue[900],
//                                   letterSpacing: 0.7,
//                                   fontSize: 15,
//                                 ),
//                               )),
//
//                           // Row(
//                           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //   children: [
//                           //     Text(
//                           //       'Sign in',
//                           //       style: TextStyle(
//                           //           fontSize: 27, fontWeight: FontWeight.w700),
//                           //     ),
//                           //     CircleAvatar(
//                           //       radius: 30,
//                           //       backgroundColor: Color(0xff4c505b),
//                           //
//                           //       child: IconButton(
//                           //           color: Colors.white,
//                           //           onPressed: () {},
//                           //           icon: Icon(
//                           //             Icons.arrow_forward,
//                           //           )),
//                           //     )
//                           //   ],
//                           // ),
//
//
//                           SizedBox(
//                             height: 1,
//                           ),
//                           Divider(
//                             //height: 1,
//                             color: Colors.black87,
//                             thickness: 1,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children:[
//                               Text("Did not have an account ?",
//                                 style: TextStyle(
//                                   color: Colors.black87,
//                                   fontSize: 17,
//                                   //fontStyle: FontStyle.italic,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'register');
//                                 },
//                                 child: Text(
//                                   'Sign Up',
//                                   //textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Colors.blue.shade900,
//                                       letterSpacing: 0.9,
//                                       fontSize: 18),
//                                 ),
//                                 style: ButtonStyle(),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


/*
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;  //width
    double h = MediaQuery.of(context).size.height;  //height
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                //color: Colors.cyan.shade50,
                width: w,
                height: h*0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/ccc.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.cyan.shade50,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HELLO,",
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("sign into your account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.cyan.shade400,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.cyan.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "email id",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue.shade600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.cyan.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.blue.shade600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      Text("Forget Password ? ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.lightBlueAccent.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/blue.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child:  Center(
                child: Text("Sign in",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: w*0.07,),
            RichText(text: TextSpan(
                text: "Don't have an account?",
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: " Create",
                    recognizer: DoubleTapGestureRecognizer()
                    ..onDoubleTap = () {
                      Navigator.pushNamed(context, 'register');
                    },
                    style: TextStyle(
                      color: Colors.cyan.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]

            ),
            ),
          ],
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
//
// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);
//
//   @override
//   _MyLoginState createState() => _MyLoginState();
// }
//
// class _MyLoginState extends State<MyLogin> {
//   @override
//   Widget build(BuildContext context) {
//     // double w = MediaQuery.of(context).size.width;  //width
//     // double h = MediaQuery.of(context).size.height;  //height
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/login.png'),
//             fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             //Container(),
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 130),
//               child: Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Email",
//                                 prefixIcon: Icon(Icons.mail, color: Colors.black54),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Password",
//                                 prefixIcon: Icon(Icons.security, color: Colors.black54,),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 40,
//                            ),
//                           Container(
//                             width: double.infinity,  // double.infinity
//                             child: RawMaterialButton(
//                                 onPressed: (){},
//                               child: Text("SIGN IN",
//                                 style:
//                                   TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                     color: Colors.white,
//                                   ),
//                               ),
//                               elevation: 0.0,
//                               padding: EdgeInsets.symmetric(vertical: 18),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(40.0),
//                               ),
//                               fillColor: Colors.lightBlue,
//                             ),
//                           ),
//                           TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'Forgot Password',
//                                 textAlign: TextAlign.right,
//                                 style: TextStyle(
//                                   decoration: TextDecoration.underline,
//                                   color: Colors.blue[900],
//                                   letterSpacing: 0.7,
//                                   fontSize: 15,
//                                 ),
//                               )),
//
//                           // Row(
//                           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //   children: [
//                           //     Text(
//                           //       'Sign in',
//                           //       style: TextStyle(
//                           //           fontSize: 27, fontWeight: FontWeight.w700),
//                           //     ),
//                           //     CircleAvatar(
//                           //       radius: 30,
//                           //       backgroundColor: Color(0xff4c505b),
//                           //
//                           //       child: IconButton(
//                           //           color: Colors.white,
//                           //           onPressed: () {},
//                           //           icon: Icon(
//                           //             Icons.arrow_forward,
//                           //           )),
//                           //     )
//                           //   ],
//                           // ),
//
//
//                           SizedBox(
//                             height: 1,
//                           ),
//                           Divider(
//                             //height: 1,
//                             color: Colors.black87,
//                             thickness: 1,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children:[
//                               Text("Did not have an account ?",
//                                 style: TextStyle(
//                                   color: Colors.black87,
//                                   fontSize: 17,
//                                   //fontStyle: FontStyle.italic,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'register');
//                                 },
//                                 child: Text(
//                                   'Sign Up',
//                                   //textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Colors.blue.shade900,
//                                       letterSpacing: 0.9,
//                                       fontSize: 18),
//                                 ),
//                                 style: ButtonStyle(),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

 */