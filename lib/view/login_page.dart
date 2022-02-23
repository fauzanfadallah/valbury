import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'widget/custom_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_loginForm');
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text('Login Akun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(
              'assets/images/logo.jpg',
              scale: 3,
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomField(
                      title: 'Nomor Handphone',
                      titleColor: Colors.black87,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.length > 10 || value.isEmpty) {
                          return 'Silahkan masukan nomor handphone Anda';
                        }
                        return null;
                      },
                      controller: _phoneController,
                      hintText: 'Masukan Nomor Handphone',
                    ),
                    CustomField(
                      title: 'Email',
                      titleColor: Colors.black87,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        if (!regex.hasMatch(value!)) {
                          return 'Silahkan masukan email yang valid';
                        }
                        return null;
                      },
                      controller: _emailController,
                      hintText: 'Masukan Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (route) => false);
                          }
                        },
                        child: const Text('MASUK',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
                    TextButton(
                        onPressed: () {},
                        child: const Text('DAFTAR',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.w700))),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
