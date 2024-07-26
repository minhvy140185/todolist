import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/const/colors.dart';
import 'package:todolist/data/auth_data.dart';

class Login_Screen extends StatefulWidget {
  final VoidCallback show;

  const Login_Screen(this.show, {super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener((){
        setState((){});
      }      
    );

    _focusNode2.addListener((){
        setState((){});
      }      
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const image(),
              const SizedBox(height: 50,),
              textfield(controller:  email, focusNode: _focusNode1,typeName:  'Email', iconName: Icons.email,),
              const SizedBox(height: 10,),
              textfield(controller: password, focusNode: _focusNode2,typeName:  'Password', iconName: Icons.password,),
              const SizedBox(height: 8,),
              account(),
              const SizedBox(height: 20,),
              login_button(),
            ],
          ),
        )
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Don't have a count?", 
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 14
          ),),
          const SizedBox(width: 5,),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],                
      ),
    );
  }

  
Widget login_button() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),    
    child: GestureDetector(
      onTap: (){
        AuthenticationRemote().login(email.text.trim(), password.text.trim());
      },
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: custom_green,
          borderRadius: BorderRadius.circular(10)
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
  }
}





class textfield extends StatelessWidget {
  const textfield({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.typeName,
    required this.iconName,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String typeName;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(                    
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(                      
            prefixIcon: Icon(
              iconName,
              color: focusNode.hasFocus ? 
                  custom_green : 
                const Color(0xffc5c5c5)
              ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: typeName,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(
                color: custom_green,
                width: 2.0,
              )
            ),                      
          ),
        ),
      ),
    );
  }
}

class image extends StatelessWidget {
  const image({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/7.png'),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}