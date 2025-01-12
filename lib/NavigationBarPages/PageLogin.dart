import 'package:flutter/material.dart';
import 'package:new_tab_bar/component/LoginTextField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bagian atas desain
            Container(
              height: 100, // Adjust this value to control the overall height
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(500, 500), // Adjust these values to control the curve
                  ),
                ),
              ),
            ),

              SizedBox(height: 20),

              Image.asset("images/LogoLitmovation_trans.png", height: 80, width: 80,),

              //sign in text
              Row(
                children:[ 
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]
              ),

              SizedBox(height: 20),

              //field text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Field Email/User Name
                    LoginTextField(
                      controller: usernameController,
                      hintText: "Username",
                      obscureText: false,
                    ),

                    SizedBox(height: 20),

                    // Field Password
                    LoginTextField(
                      controller: passwordController,
                      hintText: "username",
                      obscureText: true,
                    ),

                    SizedBox(height: 10),

                    //buttion forget password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Tambahkan aksi untuk lupa password
                        },
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Tombol Sign In
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan aksi untuk login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    //text sign up with
                    Center(
                      child: Text(
                        'Or sign up with',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Placeholder untuk logo Google, Facebook, dan Apple
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("images/googlelogo.png", width: 80, height: 80,),
                      ],
                    ),

                    SizedBox(height: 20),

                    //sign up button
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Tambahkan aksi untuk sign up
                        },
                        child: Text(
                          'Not register yet ? Create Account',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
