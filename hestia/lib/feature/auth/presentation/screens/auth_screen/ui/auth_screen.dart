import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smarthome/core/navigation/app_router/app_router.gr.dart';
import 'package:flutter_smarthome/feature/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter_smarthome/feature/auth/presentation/widgets/password_visibility_notifier.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget with AutoRouteWrapper {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider<PasswordVisibilityState>(
      create: (context) => PasswordVisibilityState(),
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormFieldState>();
  final _passwordFormKey = GlobalKey<FormFieldState>();
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: SafeArea(
            child: Stack(children: [
          pageBackground(),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Text(
                    "Hestia Home",
                    style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  logo(160, 175),
                  const SizedBox(height: 30),
                  signInForm(),
                  const SizedBox(height: 30),
                  Container(
                      padding:
                          const EdgeInsets.only(top: 30, left: 80, right: 80),
                      child: Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor:
                                    const Color.fromARGB(255, 102, 170, 247),
                                minimumSize: const Size.fromHeight(50),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate() ==
                                    _passwordFormKey.currentState!
                                        .validate()) {}
                              },
                              child: const Center(
                                  child: Text("Подтвердить",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Lexend",
                                          color: Colors.white)))))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      "Нет аккаунта?",
                      style: TextStyle(
                          fontFamily: "Lexend",
                          color: Color.fromARGB(255, 46, 78, 107)),
                    ),
                    TextButton(
                        onPressed: () {
                          AutoRouter.of(context).pushAll([
                            const AuthRouter(
                                children: [AuthRoute(), RegistrationRoute()])
                          ]);
                        },
                        child: const Text(
                          "Зарегистрироваться",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Lexend",
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 46, 78, 107)),
                        ))
                  ]),
                ],
              ),
            ),
          ),
        ])),
      ),
    );
  }

  Widget signInForm() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
      child: Form(
          child: Column(
        children: [emailField(), passwordField()],
      )),
    );
  }

  Widget emailField() {
    return TextFormField(
        key: _formKey,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Поле не должно быть пустым";
          } else if (value.length < 8) {
            return "Слишком короткое название";
          }
          return null;
        },
        controller: _usernameController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.grey.shade900,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 16),
          hintText: "Имя пользователя или почта",
          hintStyle: TextStyle(fontFamily: 'Lexend'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ));
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
          key: _passwordFormKey,
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          obscureText:
              context.watch<PasswordVisibilityState>().passwordVisibility,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Поле не должно быть пустым";
            } else if (value.length < 8) {
              return "Слишком короткое название";
            }
            return null;
          },
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.grey.shade900,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            suffixIcon: IconButton(
              icon: Icon(
                context.watch<PasswordVisibilityState>().visibilityIcon,
                color: const Color.fromARGB(255, 41, 40, 40),
              ),
              onPressed: () {
                bool newVisibilityValue = !Provider.of<PasswordVisibilityState>(
                        context,
                        listen: false)
                    .passwordVisibility;
                IconData newIcon = newVisibilityValue
                    ? Icons.visibility
                    : Icons.visibility_off;
                Provider.of<PasswordVisibilityState>(context, listen: false)
                    .changeVisibility(newVisibilityValue, newIcon);
              },
            ),
            hintText: "Пароль",
            hintStyle: const TextStyle(fontFamily: 'Lexend'),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.white),
            ),
          )),
    );
  }
}
