import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smarthome/feature/auth/presentation/widgets/auth_widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _passwordFocusNode = FocusNode();
  final _repeatPasswordFieldFocusNode = FocusNode();
  final _formKey = GlobalKey<FormFieldState>();
  late final _repeatPasswordFieldController = TextEditingController();
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _repeatPasswordFieldController.dispose();
    _repeatPasswordFieldFocusNode.dispose();
    _emailController.dispose();
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
              child: Stack(
            children: [
              pageBackground(),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: [
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
                    logo(130, 140),
                    const SizedBox(height: 20),
                    signInForm(),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 40, left: 100, right: 100),
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
                                  if (_formKey.currentState!.validate()) {}
                                },
                                child: const Center(
                                    child: Text("Подтвердить",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Lexend",
                                            color: Colors.white)))))),
                  ]),
                ),
              )
            ],
          )),
        ));
  }

  Widget signInForm() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              usernameField(),
              emailField(),
              passwordField(),
              repeatPasswordField()
            ],
          )),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
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
          controller: _emailController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.grey.shade900,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 16),
            hintText: "Эл. почта",
            hintStyle: TextStyle(fontFamily: 'Lexend'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Colors.white),
            ),
          )),
    );
  }

  Widget usernameField() {
    return TextFormField(
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
          hintText: "Имя пользователя",
          hintStyle: TextStyle(fontFamily: 'Lexend'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ));
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
          controller: _passwordController,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          obscureText: true,
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
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            hintText: 'Пароль',
            hintStyle: TextStyle(fontFamily: 'Lexend'),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(25))),
          )),
    );
  }

  Widget repeatPasswordField() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
          controller: _repeatPasswordFieldController,
          focusNode: _repeatPasswordFieldFocusNode,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          obscureText: true,
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
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            hintText: 'Повторите пароль',
            hintStyle: TextStyle(fontFamily: 'Lexend'),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(25))),
          )),
    );
  }
}
