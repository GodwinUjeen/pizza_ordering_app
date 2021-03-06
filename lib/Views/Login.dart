import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/Providers/Authentication.dart';
import 'package:pizzato/Views/HomePage.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Piz',
                  style: TextStyle(
                    fontSize: 56.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'z',
                      style: TextStyle(
                        fontSize: 56.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: 'ato',
                      style: TextStyle(
                        fontSize: 56.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.black54,
                    onPressed: () {
                      loginSheet(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.black54,
                    onPressed: () {
                      signInSheet(context);
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter E-mail',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.lightGreenAccent,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () =>
                          Provider.of<Authentication>(context, listen: false)
                              .loginIntoAccount(
                        emailController.text,
                        passwordController.text,
                      )
                              .whenComplete(() {
                        if (Provider.of<Authentication>(context, listen: false)
                                .getErrorMessage ==
                            '') {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.leftToRight),
                          );
                        }
                        if (Provider.of<Authentication>(context, listen: false)
                                .getErrorMessage !=
                            '') {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Login(),
                                type: PageTransitionType.leftToRight),
                          );
                        }
                      }),
                    ),
                  ),
                  Text(
                    Provider.of<Authentication>(context, listen: false)
                        .errorMessage,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  signInSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter E-mail',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.lightGreenAccent,
                      child: Text(
                        'SignIn',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () =>
                          Provider.of<Authentication>(context, listen: false)
                              .createNewAccount(
                        emailController.text,
                        passwordController.text,
                      )
                              .whenComplete(() {
                        if (Provider.of<Authentication>(context, listen: false)
                                .getErrorMessage ==
                            '') {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.leftToRight),
                          );
                        }
                        if (Provider.of<Authentication>(context, listen: false)
                                .getErrorMessage !=
                            '') {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Login(),
                                type: PageTransitionType.leftToRight),
                          );
                        }
                      }),
                    ),
                  ),
                  Text(
                    Provider.of<Authentication>(context, listen: false)
                        .errorMessage,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
