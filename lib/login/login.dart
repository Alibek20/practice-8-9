import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_8_9/login/repository/auth_repository.dart';
import 'package:practice_8_9/navigation_bar/navigation_bar.dart';
import 'bloc/auth_bloc.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _hidePass = true;

    return Scaffold(
        // backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
          SizedBox(),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: (BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50))),
            height: 380,
            width: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "login",
                    prefixIcon: Icon(Icons.mail),
                    // ignore: unnecessary_const
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    // ignore: unnecessary_const
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // validator: _validateEmail,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Пароль",
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon:
                          // ignore: dead_code
                          Icon(_hidePass
                              ? Icons.visibility
                              // ignore: dead_code
                              : Icons.visibility_off),
                      onPressed: () {
                        _hidePass = !_hidePass;
                      },
                    ),
                    prefixIcon: const Icon(Icons.security),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                    ),
                    // ignore: unnecessary_const
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 194, 243, 33), width: 2.0),
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => LoginBloc(
                    AuthRepository(),
                  ),
                  child: Center(
                      child: BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                    if (state is LoginSuccess) {
                      final snackBar = SnackBar(
                        content:  Container(
                          color: Color.fromARGB(255, 100, 22, 22),
                          child: Text(
                                      "Вы авторизованы под токеном ${state.token.token}",
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 24, 125, 27),
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                        ),
                               
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => MainPagee()));
                    }
                    if (state is LoginError) {
                      final snackBar = SnackBar(
                        content: Text(
                                    state.error,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                
                        
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }, builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                              strokeWidth: 4,
                            )),
                      );
                    }
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 17, 145, 83),
                          fixedSize: Size(180, 50),
                        ),
                        onPressed: () async {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressed(_emailController.text,
                                  _passwordController.text));
                        },
                        child: const Text(
                          'Войти',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 20),
                        ));
                  })),
                ),
              ],
            ),
          )
        ])))));
  }
}
