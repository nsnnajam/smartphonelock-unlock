import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lockapp/view/dashboard.dart';
import 'package:lockapp/widget.dart';

class SignInsecreen extends StatefulWidget {
  const SignInsecreen({super.key});

  @override
  State<SignInsecreen> createState() => _SignInsecreenState();
}

class _SignInsecreenState extends State<SignInsecreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  bool? check1 = false; //true for checked checkbox, false for unchecked one

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      // appBar: AppBar(
      //   leading: Image.asset('assets/logo.png'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  //logo
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        myText("Sign In", Colors.blue, 21, FontWeight.bold),
                        myText("lock Unlock With Smartphone", Colors.blue, 14,
                            FontWeight.w200),
                      ],
                    ),
                    Icon(
                      Icons.lock,
                      color: Colors.blue,
                    )
                    // Image.asset(
                    //   'assets/logo.png',
                    //   height: 40,
                    //   width: 40,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  autofocus: true,
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.blue,
                    border: UnderlineInputBorder(),
                    labelText: 'User name or Email',
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email Requiblue";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.blue,
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Password',
                  ),
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Enter more then 6 number";
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                        shape: CircleBorder(),

                        //only check box
                        value: check1, //unchecked
                        onChanged: (value) {
                          //value returned when checkbox is clicked
                          setState(() {
                            check1 = value;
                          });
                        }),
                    const Text("Remember me"),
                    const SizedBox(
                      width: 40,
                    ),
                    TextButton(
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Forgetpassword()),
                        // );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Dashbord(),
                        ));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Dashbord(),
                        // ));

                        Fluttertoast.showToast(
                            msg: "User sign in",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 18.0);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     const Text(
                //       'Does not have account?',
                //     ),
                //     TextButton(
                //       child: const Text(
                //         'Sign Up',
                //         style: TextStyle(fontSize: 16, color: Colors.blue),
                //       ),
                //       onPressed: () {
                //         Navigator.pushReplacement(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const SignUpsecreen()));
                //       },
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
