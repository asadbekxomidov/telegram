// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:telegram/controllers/auth_controller.dart';
// import 'package:telegram/utils/messages.dart';
// import 'package:telegram/views/widgets/my_text_field.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final nameController = TextEditingController();
//   final surnameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final passwordConfirmationController = TextEditingController();

//   void submit() {
//     if (formKey.currentState!.validate()) {
//       Messages.showLoadingDialog(context);
//       Provider.of<AuthController>(context, listen: false).register(
//         nameController.text,
//         surnameController.text,
//         emailController.text,
//         passwordController.text,
//         context,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     nameController.dispose();
//     surnameController.dispose();
//     passwordController.dispose();
//     passwordConfirmationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ro‘yxatdan o‘tish'),
//         backgroundColor: Colors.purple.shade300,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/image.png', height: 260, width: 260),
//                 const SizedBox(height: 40),
//                 Text(
//                   "TIZIMGA KIRISH",
//                   style: Theme.of(context).textTheme.displaySmall!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                 ),
//                 const SizedBox(height: 20),
//                 MyTextField(
//                   controller: emailController,
//                   label: "Email",
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Iltimos email kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   controller: surnameController,
//                   label: "Familiya",
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Iltimos familiya kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   controller: nameController,
//                   label: "Ism",
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Iltimos ism kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   controller: passwordController,
//                   label: "Parol",
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Iltimos parol kiriting";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   controller: passwordConfirmationController,
//                   label: "Parolni tasdiqlang",
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return "Iltimos parol tasdiqlang";
//                     }
//                     if (passwordController.text !=
//                         passwordConfirmationController.text) {
//                       return "Parollar mos kelmadi";
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: FilledButton(
//                     onPressed: submit,
//                     style: FilledButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                     ),
//                     child: const Text("R O' Y X A T D A N  O' T I S H"),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Tizimga Kirish"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegram/controllers/auth_controller.dart';
import 'package:telegram/utils/messages.dart';
import 'package:telegram/views/widgets/my_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  void submit() {
    if (formKey.currentState!.validate()) {
      Messages.showLoadingDialog(context);
      Provider.of<AuthController>(context, listen: false).register(
        nameController.text,
        surnameController.text,
        emailController.text,
        passwordController.text,
        context,
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ro‘yxatdan o‘tish'),
        backgroundColor: Colors.purple.shade300,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/image.png', height: 260, width: 260),
                const SizedBox(height: 40),
                Text(
                  "TIZIMGA KIRISH",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: nameController,
                  label: "Ism",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos ism kiriting";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: surnameController,
                  label: "Familiya",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos familiya kiriting";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  label: "Elektron pochta",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos pochta kiriting";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  label: "Parol",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos parol kiriting";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordConfirmationController,
                  label: "Parolni tasdiqlang",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Iltimos parol tasdiqlang";
                    }
                    if (passwordController.text != passwordConfirmationController.text) {
                      return "Parollar mos kelmadi";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: submit,
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text("R O' Y X A T D A N  O' T I S H"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Tizimga Kirish"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
