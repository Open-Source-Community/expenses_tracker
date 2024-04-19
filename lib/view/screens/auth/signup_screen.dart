import 'package:expense_tracker/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components/components.dart';
import '../../../components/constants/constants.dart';
import '../../../cubit/signup_cubit/signup_cubit.dart';
import '../../../cubit/signup_cubit/signup_states.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbody.dart';
import '../../widgets/auth/customtextfieldform.dart';
import '../../widgets/auth/customtextsign.dart';
import '../../widgets/auth/customtitle.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xff1f1f1f),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CustomTitleAuth(
                          height: height,
                          width: width,
                          text: "Welcome\nto ",
                        ),
                        const Positioned(
                            left: 175,
                            child: Icon(
                              Icons.monetization_on_outlined,
                              color: ColorManager.yellow,
                              size: 50,
                            ))
                      ],
                    ),
                    const SizedBox(height: 60),
                    Form(
                      key: cubit.keystate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextBodyAuth(
                              textitle: "Sign Up",
                              textbody:
                                  "Enter username & valid password to create account "),
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
                            keyboardType: TextInputType.visiblePassword,
                            validate: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            labeltext: "Password",
                            hinttext: "Enter your password",
                            isPassword: cubit.isPassword,
                            mycontroller: cubit.password,
                            suffix: IconButton(
                                icon: Icon(cubit.visible
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off_sharp),
                                onPressed: () {
                                  cubit.showPassword();
                                },
                                color: ColorManager.yellow),
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.visiblePassword,
                            validate: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            labeltext: "Confirm Password",
                            hinttext: "Confirm password",
                            isPassword: cubit.isPassword,
                            mycontroller: cubit.confirmPassword,
                            suffix: IconButton(
                                icon: Icon(cubit.visible
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off_sharp),
                                onPressed: () {
                                  cubit.showPassword();
                                },
                                color: ColorManager.yellow),
                          ),
                          CustomButtonAuth(
                            text: "Sign Up",
                            onPressed: () async {
                              cubit.signUp();
                            },
                          ),
                          const SizedBox(height: 25),
                          CustomTextSign(
                            text: "Already have an account? ",
                            sign: "Log In",
                            onTap: () {
                              cubit.goToLogin();
                            },
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast(text: "Sign Up Successfully", color: Colors.green);
          navigateToReplacement(context, const LoginScreen());
        } else if (state is SignUpErrorState) {
          showToast(text: "Not the same password!", color: Colors.red);
        } else if (state is SignUpGoToLogin) {
          navigateToReplacement(context, const LoginScreen());
        }
      },
    );
  }
}
