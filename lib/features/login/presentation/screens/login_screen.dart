
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind/core/routes.dart';
import 'package:mind/features/login/presentation/cubit/login_cubit.dart';
import 'package:mind/features/login/presentation/cubit/login_state.dart';
import 'package:mind/features/login/presentation/widgets/login_button.dart';
import 'package:mind/features/login/presentation/widgets/new_text_filed.dart';
import '../widgets/register_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginState>(
     builder: (context, state) {
       var cubit=BlocProvider.of<LoginCubit>(context);
       return Directionality(
         textDirection: TextDirection.rtl,
         child: Form(
           key: cubit.fromKey,
           child: Scaffold(
             body: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     const SizedBox(
                       height: 60,
                       width: double.infinity,
                     ),
                     Image.asset('assets/images/Login.png'),
                     const SizedBox(
                       height: 50,
                       child: Text(
                         'مرحبا بك',
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 25,
                         ),
                       ),
                     ),
                     NewTextFiled(
                       controller: cubit.email,
                       function: (value) {
                         if(value=='')
                           {
                             return 'required';
                           }
                       },
                       iconData: Icons.email,
                       label: 'البريد الالكترونى',
                     ),
                     NewTextFiled(
                       controller: cubit.password,
                       function: (value) {
                         if(value=='')
                         {
                           return 'required';
                         }
                       },
                       iconData: Icons.lock_outline_rounded,
                       label: 'كلمه المرور',
                     ),
                     Padding(
                       padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width/2),
                       child: TextButton(
                         onPressed: () {
                         },
                         child: const Text(
                           'نسيت كلمه المرور',
                           style: TextStyle(color: Colors.grey, fontSize: 20),
                         ),
                       ),
                     ),
                     LoginButton(
                       function: () {
                           if(cubit.fromKey.currentState!.validate())
                             {
                               cubit.login(email: cubit.email.text, password: cubit.password.text).then((value) {
                                 cubit.password.clear();
                                 cubit.email.clear();
                                 Navigator.pushNamed(context, Routes.home);
                               });

                             }
                       },
                     ),
                     if(state is LoginLoadingState)
                       const CircularProgressIndicator(color: Colors.brown,),

                     RegisterButton(
                       function: (){

                       },
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                     const Text(
                       'or sign in with',
                       style: TextStyle(color: Colors.grey, fontSize: 20),
                     ),
                     const Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Icon(Icons.facebook),
                         ),
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Icon(Icons.apple),
                         ),
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Icon(Icons.chrome_reader_mode),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
       );
     },
    );
  }
}


