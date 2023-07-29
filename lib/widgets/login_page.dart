import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/models/login_model.dart';
import 'package:online_order_app/models/user_models.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/utils/app_constants.dart';
import 'package:online_order_app/utils/show_custom_snackbar.dart';
import 'package:online_order_app/widgets/register_page.dart';
import '../controllers/auth_contloller.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  // AuthController authController=Get.find();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserModel?> _login() async {
    var authController = Get.find<AuthController>();

    String username = emailController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty) {
      showCustomSnackBar("Enter email", title: "Email");
    } else if (!GetUtils.isEmail(username)) {
      showCustomSnackBar("Enter valid email", title: "Email");
    } else if (password.isEmpty) {
      showCustomSnackBar("Enter password", title: "Pasword");
    } else {
      UserLogin userLogin = UserLogin(username: username, password: password);
      var userModel = await authController.login(userLogin);
      print(userModel);

      return userModel; // var userModel =await
    }
    return null;
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100),
            // color: Colors.grey[300],
            child: Column(children: [
              Container(
                  child: Icon(
                Icons.lock,
                // color: Colors.black12,
                size: 100,
                // static const IconData cases_rounded = IconData(0xf61e, fontFamily: 'MaterialIcons'),
              )),
               SizedBox(height: MediaQuery.of(context).size.height*0.05875),
              Text(
                "Welcome back you\'ve been missed!",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.0235),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      // prefixIcon: const Icon(Icons.search, color: Colors.black54,),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height*0.0235,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      // prefixIcon: const Icon(Icons.search, color: Colors.black54,),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.01175),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height*0.01762,
              ),
              GestureDetector(
                onTap: () async {
                  var user = await _login();
                  if (user != null) {
                    Get.toNamed(RouteHelper.homeScreen);
                    print("This is " + AppConstants.TOKEN);
                  } else {
                    showCustomSnackBar("invalid credentials");
                    return;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height*0.05875,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height*0.05875,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      "assets/images/apple.png",
                      height: MediaQuery.of(context).size.height*0.0470,
                    ),
                  ),
                   SizedBox(
                    width: MediaQuery.of(context).size.width*0.06361,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      "assets/images/google.png",
                      height: MediaQuery.of(context).size.height*0.047,
                    ),
                  )
                ],
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height*0.05875,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                   SizedBox(width: MediaQuery.of(context).size.width*0.01017),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterPage());
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
