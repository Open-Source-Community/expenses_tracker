import 'package:expense_tracker/view/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../components/constants/constants.dart';
import '../../../components/constants/imageassets.dart';
import '../../../cubit/login_cubit/login_cubit.dart';
import '../../../cubit/login_cubit/login_states.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbody.dart';
import '../../widgets/auth/customtextfieldform.dart';
import '../../widgets/auth/customtextsign.dart';
import '../../widgets/auth/customtitle.dart';
import '../home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit, LoginStates>(builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return Scaffold(
        backgroundColor: const Color(0xff1f1f1f),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  CustomTitleAuth(
                    height: height,
                    width: width,
                    text: "Welcome\nBack to ",
                  ),
                  const Positioned(
                      right: 130,
                      child: Icon(
                        Icons.monetization_on_outlined,
                        color: ColorManager.yellow,
                        size: 50,
                      ))
                ],
              ),
              const SizedBox(height: 60),
              Form(
                key: cubit.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextBodyAuth(
                        textitle: "Login",
                        textbody:
                            "Enter your email & valid password to continue"),
                    const SizedBox(height: 50),
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      validate: (val) {
                        return validInput(val!, 5, 15, "username");
                      },
                      labeltext: "Username",
                      hinttext: "Enter username",
                      mycontroller: cubit.username,
                      suffix: IconButton(
                          icon: const Icon(Icons.person),
                          onPressed: () {},
                          color: ColorManager.yellow),
                    ),
                    CustomTextField(
                      labeltext: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      validate: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      hinttext: "Enter your password",
                      mycontroller: cubit.password,
                      isPassword: cubit.isPassword,
                      suffix: IconButton(
                          icon: Icon(cubit.visible
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_sharp),
                          onPressed: () {
                            cubit.showPassword();
                          },
                          color: ColorManager.yellow),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 190,
                      ),
                      child: const Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomButtonAuth(
                      text: "Log In",
                      onPressed: () {
                        cubit.login();
                      },
                    ),
                    const SizedBox(height: 25),
                    CustomTextSign(
                      text: "Don't have an account? ",
                      sign: "Sign Up",
                      onTap: () {
                        cubit.goToSignUp();
                      },
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is LoginSuccessState) {
        showToast(text: "Login Successfully", color: Colors.green);

        navigateToReplacement(context, HomeScreen());
      }
      if (state is LoginGoToSignUpState) {
        navigateToReplacement(context, const SignUpScreen());
      }
      // if (state is LoginWithGoogleState) {
      //   showToast(text: "Login Successfully", color: Colors.green);
      //   navigateToReplacement(context, HomeScreen());
      // }
    });
  }
}
