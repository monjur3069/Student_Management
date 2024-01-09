import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'login_page_controller.dart';


class LoginPageView extends StatefulWidget{
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isObscureText = true;
  final formKey = GlobalKey<FormState>();

  late AnimationController _animationController;
  late Animation<double> _logoAnimation;
  late Animation<double> _emailAnimation;
  late Animation<double> _passwordAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _logoAnimation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );
    _emailAnimation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 0.4, curve: Curves.easeInOut),
      ),
    );
    _passwordAnimation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 0.5, curve: Curves.easeInOut),
      ),
    );

    _widthAnimation = Tween<double>(begin: 1.0, end: 260).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.7, 0.9, curve: Curves.easeInOutCubic),
    ));
    _heightAnimation = Tween<double>(begin: 1.0, end: 50.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.5, 0.7, curve: Curves.easeInOutCubic),
    ));

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context,child) {
                      return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, 10),
                            end: Offset(0, 0),
                          ).animate(_logoAnimation),
                          child: Center(child: Image.asset('images/logo.png',height: 200,width: 200,)));
                    }
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 35,
                    left: 35,),
                  child: Column(children: [
                    AnimatedBuilder(
                        animation: _animationController,
                        builder: (context,child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-1, 0),
                              end: Offset(0, 0),
                            ).animate(_emailAnimation),
                            child: TextFormField(
                              controller: emailController,
                              style: TextStyle(color: theme.primaryColor,),
                              decoration: InputDecoration(
                                fillColor: theme.cardColor,
                                filled: true,
                                hintStyle: TextStyle(color: theme.primaryColor,),
                                labelStyle: TextStyle(color: theme.primaryColor,),
                                hintText: 'Email',
                                labelText: 'abc@mail.com',
                                prefixIcon: Icon(Icons.mail_outline,color: theme.primaryColor,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field must not be empty';
                                }else if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          );
                        }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AnimatedBuilder(
                        animation: _animationController,
                        builder: (context,child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset(0, 0),
                            ).animate(_passwordAnimation),
                            child: TextFormField(
                              controller: passController,
                              obscureText: isObscureText,
                              style: TextStyle(color: theme.primaryColor,),
                              decoration: InputDecoration(
                                fillColor: theme.cardColor,
                                filled: true,
                                hintStyle: TextStyle(color: theme.primaryColor,),
                                labelStyle: TextStyle(color: theme.primaryColor,),
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock_open_outlined,color: theme.primaryColor,),
                                suffixIcon: IconButton(
                                  icon: Icon(isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,color: theme.primaryColor,),
                                  onPressed: () => setState(() {
                                    isObscureText = !isObscureText;
                                  }),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field must not be empty';
                                }
                                return null;
                              },
                            ),
                          );
                        }
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Get.find<LoginPageController>().signInAuthenticate(
                            emailController.text,
                            passController.text,
                            context,
                            formKey);
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context,child) {
                              return Container(
                                height: _heightAnimation.value,
                                width: _widthAnimation.value,
                                decoration: BoxDecoration(
                                    color: theme.cardColor,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Center(child: Text('Sign In',style: TextStyle(color: theme.primaryColor,fontSize: 20,fontWeight: FontWeight.w600),)),
                              );
                            }
                        ),
                      ),
                    ),
                  ]),
                )
              ]),
        ),
      ),
    );
  }
}
