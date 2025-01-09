import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/form_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';

class RegisterForm extends ConsumerStatefulWidget {
  final Map<String, TextEditingController> controllers;
  final GlobalKey<FormState> formKey;

  const RegisterForm(
      {Key? key, required this.controllers, required this.formKey})
      : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
   @override
  Widget build(BuildContext context) {
    final gender = ref.watch(genderProvider);
    final showOtherGenderField = ref.watch(showOtherGenderFieldProvider);
    final passwordVisible = ref.watch(passwordVisibilityProvider);
    final confirmPasswordVisible = ref.watch(confirmPasswordVisibilityProvider);
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    final currentStep = ref.watch(stepProvider);
        final stepNotifier = ref.read(stepProvider.notifier); // ใช้สำหรับควบคุมสถานะ

    User newUser = User();
    return    Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1: Email, Password, Confirm Password
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black38,
                          thickness: 2, // ความหนาของเส้น
                        ),
                      ),
                      Text(
                        " Account Details ",
                        style: GoogleFonts.prompt(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black38,
                          thickness: 2, // ความหนาของเส้น
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Email
                TextFormField(
                  controller: widget.controllers['email'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'อีเมล',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
      // Password
                TextFormField(
                  controller: widget.controllers['password'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        ref.read(passwordVisibilityProvider.state).state =
                            !passwordVisible;
                      },
                    ),
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
      
                // Confirm Password
                TextFormField(
                  controller: widget.controllers['confirmPassword'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  obscureText: confirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'ยืนยันรหัสผ่าน',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(
                        confirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        ref.read(confirmPasswordVisibilityProvider.state).state =
                            !confirmPasswordVisible;
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value != widget.controllers['password']?.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
      
                // Section 2: Personal Information
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black38,
                          thickness: 2, // ความหนาของเส้น
                        ),
                      ),
                      Text(
                        " Personal Information ",
                        style: GoogleFonts.prompt(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black38,
                          thickness: 2, // ความหนาของเส้น
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
      
                // First Name
                TextFormField(
                  controller: widget.controllers['firstName'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'ชื่อ',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
      
                    return null;
                  },
                ),
                const SizedBox(height: 16),
      
                // Last Name
                TextFormField(
                  controller: widget.controllers['lastName'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'นามสกุล',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
      // Phone Number
                TextFormField(
                  controller: widget.controllers['age'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'อายุ',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                // Phone Number
                const SizedBox(height: 16),
      
                TextFormField(
                  controller: widget.controllers['phoneNumber'],
                  style: GoogleFonts.kanit(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'หมายเลขโทรศัพท์',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
      
                // Gender
                DropdownButtonFormField<String>(
                  value: 'Male',
                  decoration: InputDecoration(
                    labelText: 'เพศ',
                    labelStyle: GoogleFonts.kanit(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(
                              gender,
                              style: GoogleFonts.kanit(color: Colors.black),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == "Other") {
                      ref.read(showOtherGenderFieldProvider.notifier).state =
                          true;
                    } else {
                      ref.read(genderProvider.notifier).state = value ?? 'Male';
                      ref.read(showOtherGenderFieldProvider.notifier).state =
                          false;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
      // Show TextField if "Other" is selected
                // Show TextField if "Other" is selected
                showOtherGenderField
                    ? TextFormField(
                        controller: widget
                            .controllers['gender'], // Reusing the same controller
                        decoration: InputDecoration(
                          labelText: 'โปรดระบุเพศ',
                          labelStyle: GoogleFonts.kanit(color: Colors.black45),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black38, width: 2.0),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please specify your gender';
                          }
                          return null;
                        },
                      )
                    : Container(), // Empty container when not visible
                const SizedBox(height: 32),
      
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF0D2B5B),
                      disabledBackgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      if (widget.formKey.currentState?.validate() ?? false) {
                        // Submit the form
                        final user = User(
                          email: widget.controllers['email']!.text,
                          password: widget.controllers['password']!.text,
                          firstName: widget.controllers['firstName']!.text,
                          lastName: widget.controllers['lastName']!.text,
                          phoneNumber: widget.controllers['phoneNumber']!.text,
                          age: int.parse(widget.controllers['age']!.text),
                          gender: widget.controllers['gender']!.text,
                        );
                        print(user);
                        print('Form is valid');
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}
