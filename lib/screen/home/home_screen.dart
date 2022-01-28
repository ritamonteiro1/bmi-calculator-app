import 'package:calculator/constants/constant_colors.dart';
import 'package:calculator/constants/constant_images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Image.asset(ConstantImages.logoHomeIoasys),
                const Padding(
                  padding: EdgeInsets.only(top: 129),
                ),
                const Text(
                  'Seja bem vindo!',
                  style: TextStyle(
                    fontSize: 31,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Calculadora IMC',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Usuário',
                      hintStyle: const TextStyle(
                          color: ConstantColors.colorTextHintForm),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: const TextStyle(
                          color: ConstantColors.colorTextHintForm),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
