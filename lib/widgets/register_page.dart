import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_order_app/controllers/auth_contloller.dart';
import 'package:online_order_app/models/registration_model.dart';
import 'package:online_order_app/models/user_models.dart';
import 'package:online_order_app/routes/rout_helper.dart';
import 'package:online_order_app/utils/show_custom_snackbar.dart';
import 'package:online_order_app/widgets/login_page.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();


     Future<UserModel?> _registration() async{
      var authController=Get.find<AuthController>();
      


      String email = emailController.text.trim();
      String name = nameController.text.trim();
      String password = passwordController.text.trim();
      String passwordConfirm = confirmPasswordController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar("Enter Email", title: "Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Enter a valid Email", title: "Email");
      }else if(name.isEmpty){
        showCustomSnackBar("Type in your name", title: "Name");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in password", title: "Password");
      }else if(password!=passwordConfirm){
        showCustomSnackBar("password didn't match", title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("password should't be less than 6 characters", title: "Password");
      }
      else{
        // showCustomSnackBar("Valid credentials", title: "Password");

        RegisterUser registerUser=RegisterUser(
          email: email, 
          name: name, 
          password: password, 
          passwordConfirm: passwordConfirm);
          // print(registerUser.toString());
          var userModel=await authController.registration(registerUser);
          print(userModel);
        //  return   await authController.registration(registerUser);
        return userModel;

      }
      return null;

    }
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Container(
          padding: EdgeInsets.only(top: 50),
          // color: Colors.grey[300],
          child: Column(
            children: [
            Container(
              child:  Icon(
                Icons.app_registration_sharp,
                // color: Colors.black12,
                size: 100,
                // static const IconData cases_rounded = IconData(0xf61e, fontFamily: 'MaterialIcons'),
              )
            ),
             SizedBox(height: MediaQuery.of(context).size.height*0.03525),
            Text("Welcome  here!",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16
            ),),
            const SizedBox(height: 20),
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
                      prefixIcon: const Icon(Icons.email, color: Colors.orange,),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                    ),
                  ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height*0.023501,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: const Icon(Icons.verified_user, color: Colors.orange,),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                    ),
                  ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height*0.023501,),
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
                      prefixIcon: const Icon(Icons.password, color: Colors.orange,),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                    ),
                  ),
                ),
              
             SizedBox(height: MediaQuery.of(context).size.height*0.0235,),
            Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: const Icon(Icons.confirmation_num_outlined, color: Colors.blue,),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)
                      )
                    ),
                  ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height*0.01175),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         Text(
                //           'Forgot Password?',
                //           style: TextStyle(color: Colors.grey[600]),
                //         ),
                //       ],
                //     ),
                //   ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.01762,),
                  GestureDetector(
                    onTap: (){
                      
                    },
                    child: GestureDetector(
                      onTap: ()async{
                       var user= await _registration();
                       if(user!=null){
                        Get.toNamed(RouteHelper.homeScreen);
                        showCustomSnackBar("Registration Successfull", backgroundColor: Colors.green, title: "success");
                       }else{
                        showCustomSnackBar("Email or Username already taken");
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
                                      "Register",
                            style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                      ),
                                  
                                  ),
                                ),
                              ),
                    ),
                  ),
              
           SizedBox(height: MediaQuery.of(context).size.height*0.03525,),
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
                            'Or register with',
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
              
                   SizedBox(height: MediaQuery.of(context).size.height*0.03525,),
                  
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
                        child: Image.asset("assets/images/apple.png",
                        height: MediaQuery.of(context).size.height*0.047,),
                      ),
                       SizedBox(width: MediaQuery.of(context).size.width*0.06361,),
                                        Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset("assets/images/google.png",
                        height: MediaQuery.of(context).size.height*0.047,),
                      )
                      
                    ],
                  ),
                                 SizedBox(height: MediaQuery.of(context).size.height*0.02937,),
                                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'A member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                       SizedBox(width: MediaQuery.of(context).size.width*0.01017),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> LoginPage());
                        },
                        child: const Text(
                          'Sign in',
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
  