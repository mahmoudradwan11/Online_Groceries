import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/layout/home.dart';
import 'package:online_groceries/modules/login/login.dart';
import 'package:online_groceries/modules/signIn/sign_cubit.dart';
import 'package:online_groceries/modules/signIn/sign_states.dart';
import 'package:online_groceries/shared/components/components.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
        if (state is CreateUserSuccessState) {
          navigateAndFinish(context, const Home());
          showToast('User Created Successfully', ToastStates.SUCCESS);
        }
      }, builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: const [
                        Image(
                          image: AssetImage('images/login_and_signup.png'),
                        ),
                        Image(image: AssetImage('images/Group.png'))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Enter your credentials to continue',
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
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name Must not be Empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'UserName',
                          labelStyle:
                              TextStyle(fontFamily: 'Jannah', fontSize: 17),
                        ),
                        keyboardType: TextInputType.text,
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
                            suffixIcon: Icon(
                              Icons.check_outlined,
                              color: Colors.green,
                            )),
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
                          labelText: 'password',
                          labelStyle:
                              TextStyle(fontFamily: 'Jannah', fontSize: 17),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'By continuing you agree to our Terms of Service and Privacy Policy.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  if (state is RegisterLoad) const LinearProgressIndicator(),
                  Align(
                      alignment: AlignmentDirectional.center,
                      child: defButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: 'Sign Up',
                          width: 364,
                          heigth: 55,
                          isUpper: false)),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account ?'),
                      textButton(
                        text: 'Login',
                        function: () {
                          navigateTo(context, Login());
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
