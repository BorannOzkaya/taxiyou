import 'package:com.example.Taxi4You/constants.dart';
import 'package:com.example.Taxi4You/screens/RegisterScreen/register.dart';
import 'package:com.example.Taxi4You/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _passwordController = TextEditingController();
  var _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              "LOGIN WITH YOUR ACCOUNT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 125),
          RoundedInputField(
            hintText: "E-Mail",
            onchanged: (value) {},
          ),
          RoundedPasswordField(onChanged: (value) {}),
          SizedBox(height: 30),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              // ignore: deprecated_member_use
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage(
                        placeId: '',
                      );
                    }));
                    // login();
                  },
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kPrimaryColor,
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account ?   "),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SignUpScreen();
                  }));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//   Future<void> login() async {
//     if (_passwordController.text.isNotEmpty &&
//         _emailController.text.isNotEmpty) {
//       var response = await post(
//           Uri.parse("https://jsonplaceholder.typicode.com/users"),
//           body: ({
//             'email': _emailController.text,
//             'username': _passwordController.text
//           }));
//       if (response.statusCode == 200) {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) {
//           return HomePage(
//             placeId: '',
//           );
//         }));
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Invalid Credentails.")));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("Black field Not Allowed")));
//     }
//   }
}

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: _passwordController,
      onChanged: widget.onChanged,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none),
    ));
  }
}

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onchanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onchanged,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: _emailController,
        onChanged: widget.onchanged,
        decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            hintText: "E-Mail",
            border: InputBorder.none),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
      ),
    );
  }
}


// https://documenter.getpostman.com/view/10350662/TzK17FbP#ad10f02f-f6f0-4968-8446-29e8c586293d