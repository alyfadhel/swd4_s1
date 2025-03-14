import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: 20.0,
        title: Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Login to browse hot offer',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      print(emailController);
                    },
                    onChanged: (value) {
                      print(emailController);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email address must be not empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      print(passwordController);
                    },
                    onChanged: (value) {
                      print(passwordController);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password must be not empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){

                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?!',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
