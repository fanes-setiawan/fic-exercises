import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/ltfm_sign_up_controller.dart';

class LtfmSignUpView extends StatefulWidget {
  const LtfmSignUpView({Key? key}) : super(key: key);

  Widget build(context, LtfmSignUpController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmSignUp"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //! 1. Buatlah textfield email
              //! 2. Buatlah textfield password
              //! 3. Buatlah textfield confirm password
              //! 4. Buat sebuah tombol,
              //gunakan icon: Icons.login
              //atur text-nya: Login
              //ketika di klik, panggil:
              // controller.doLogin()
              //Jika dialog muncul ketika tombol di klik, tasks ini selesai
              QTextField(
                value: '@gmail.com',
                label: 'emai',
                hint: 'your email',
                onChanged: (value) {},
              ),
              QTextField(
                value: 'password',
                label: 'password',
                hint: 'your password',
                onChanged: (value) {},
                obscure: true,
              ),
              QTextField(
                value: 'password',
                label: 'confirm password',
                hint: 'your confirm password',
                onChanged: (value) {},
                obscure: true,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.login),
                label: Text('login'),
                onPressed: (){
                  controller.doLogin();
                }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmSignUpView> createState() => LtfmSignUpController();
}
