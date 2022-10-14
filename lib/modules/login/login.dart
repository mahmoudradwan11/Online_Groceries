import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/layout/home.dart';
import 'package:online_groceries/modules/login/login_cubit.dart';
import 'package:online_groceries/modules/login/login_states.dart';
import 'package:online_groceries/modules/signIn/signIn.dart';
import 'package:online_groceries/shared/components/components.dart';
import 'package:online_groceries/shared/network/local/cache_helper.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uid,
          ).then((value) {
            showToast('Login Successfully', ToastStates.SUCCESS);
            navigateAndFinish(context, const Home());
          });
        }
      }, builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0.0,
                    margin: const EdgeInsets.all(0.8),
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          Image(
                            image: AssetImage(
                              'images/login_and_signup.png',
                            ),
                            height: 220,
                            width: double.infinity,
                          ),
                          Image(
                            image: AssetImage('images/Group.png'),
                          )
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Loging',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Enter Your emails and password',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Must not be Empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(fontFamily: 'Jannah', fontSize: 17),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password Must not be Empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(fontFamily: 'Jannah', fontSize: 17),
                            suffixIcon: Icon(Icons.visibility_off)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Text('Forgot Password?')],
                    ),
                  ),
                  Align(
                      alignment: AlignmentDirectional.center,
                      child: defButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: 'Log In',
                          width: 364,
                          heigth: 55,
                          isUpper: false)),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ?'),
                      textButton(
                        text: 'Signup',
                        function: () {
                          navigateTo(context, SignIn());
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
