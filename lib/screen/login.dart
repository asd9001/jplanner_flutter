import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = "";
  var pw = "";
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(" ============ 2. Login ============");
    var idController = TextEditingController(text:"asd9001@naver.com");
    var pwController = TextEditingController(text: "chang");
    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("ID"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: idController,
                      onSaved: (val) {
                        if (val != null) {
                          setState(() {
                            this.email = val;
                          });
                        }
                      },
                      validator: (val) {
                        if (val != null && val.length < 1) {
                          return '필수 입력 사항입니다.';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text("PASSWORD"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: pwController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      onSaved: (val) {
                        if (val != null) {
                          setState(() {
                            this.pw = val;
                          });
                        }
                      },
                      validator: (val) {
                        if (val != null && val.length < 1) {
                          return '필수 입력 사항입니다.';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState == null) {
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                        print(email);
                        print(pw);
                        final users = await GetIt.I<LocalDatabase>().selectUser(this.email, this.pw);
                        if (users.length < 1) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Alert'),
                                content: const Text('ID 또는 PW 가 틀렸습니다.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ),
                          );
                          return;
                        }
                        // Navigator.of(context).pop(users[0].userName);
                        Navigator.of(context).pushNamed('/select_country',arguments: users[0]);
                        return;
                      },
                      child: Text("Login"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
