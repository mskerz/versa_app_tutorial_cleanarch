import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/form_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';

class RegisterForm extends ConsumerStatefulWidget {
  final Map<String, TextEditingController> controllers;
  final GlobalKey<FormState> formKey;
  final void Function(User userCreate) onRegister;

  const RegisterForm(
      {Key? key,
      required this.controllers,
      required this.formKey,
      required this.onRegister})
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
    final stepNotifier = ref.read(stepProvider.notifier);
    User newUser = User();

    return Expanded(
      child: Form(
        key: widget.formKey, // ฟอร์มครอบทั้งหมด
        child: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.orange,
                  secondary: Colors.white,
                ),
          ),
          child: Stepper(
            currentStep: currentStep,
            onStepContinue: () {
              stepNotifier.nextStep();
            },
            onStepCancel: () {
              if (currentStep == 1) {}
              stepNotifier.previousStep();
            },
            type: StepperType.vertical,
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // จัดตำแหน่งปุ่มให้ห่างกัน
                children: [
                  currentStep == 1
                      ? TextButton.icon(
                          onPressed: controls.onStepCancel,
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Colors.orange // ตั้งค่าสีข้อความในปุ่ม
                              ), // เรียกใช้งานฟังก์ชัน onStepContinue เมื่อกดปุ่มถัดไป
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Previous",
                            style: GoogleFonts.prompt(),
                          ),
                        )
                      : Container(),
                  ElevatedButton.icon(
                    onPressed: currentStep == 1
                        ? () {
                            print("Submitted");
                            if (widget.formKey.currentState?.validate() ??
                                false) {
                              // Submit the form
                              final user = User(
                                email: widget.controllers['email']!.text,
                                password:
                                    widget.controllers['password']!.text,
                                firstName:
                                    widget.controllers['firstName']!.text,
                                lastName:
                                    widget.controllers['lastName']!.text,
                                phoneNumber:
                                    widget.controllers['phoneNumber']!.text,
                                age: int.parse(
                                    widget.controllers['age']!.text),
                                gender: widget.controllers['gender']!.text,
                              );
                              widget.onRegister(user);
                              print('Form is valid');
                            }
                          }
                        : controls.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Color(0xFF0D2B5B), // ตั้งค่าสีข้อความในปุ่ม
                    ),
                    icon: Icon(
                      currentStep == 1
                          ? Icons.create
                          : FontAwesomeIcons.arrowRight,
                      color: Colors.white,
                    ),
                    label: currentStep == 1
                        ? Text('Sign Up')
                        : Text('Next'), // เปลี่ยนปุ่มเมื่อถึงขั้นตอนสุดท้าย
                  )
                ],
              );
            },
            steps: [
              // Step 1: Account Data
              Step(
                title: Text("Account Details", style: GoogleFonts.kanit()),
                content: Column(
                  children: [
                    const SizedBox(height: 16),
                    // Email
                    TextFormField(
                      controller: widget.controllers['email'],
                      style: GoogleFonts.kanit(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'อีเมล',
                        labelStyle: GoogleFonts.kanit(color: Colors.black),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกอีเมล';
                        }
                        // ใช้ Regex ในการตรวจสอบรูปแบบอีเมล
                        const emailRegex =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        if (!RegExp(emailRegex).hasMatch(value)) {
                          return 'กรุณากรอกอีเมลที่ถูกต้อง ';
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
                        labelStyle: GoogleFonts.kanit(color: Colors.black),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            ref
                                .read(passwordVisibilityProvider.notifier)
                                .state = !passwordVisible;
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }

                        // ตรวจสอบความยาว
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }

                        // ตรวจสอบรูปแบบด้วย regex
                        const passwordRegex =
                            r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@]).*$';
                        if (!RegExp(passwordRegex).hasMatch(value)) {
                          return 'รหัสผ่านต้องประกอบด้วยตัวอักษร ตัวเลข และสัญลักษณ์ @';
                        }

                        return null; // Password is valid
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
                        suffixIcon: IconButton(
                          icon: Icon(
                            confirmPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            ref
                                .read(confirmPasswordVisibilityProvider.state)
                                .state = !confirmPasswordVisible;
                          },
                        ),
                        labelStyle: GoogleFonts.kanit(color: Colors.black),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                      ),
                      validator: (value) {
                        if (value != widget.controllers['password']?.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                isActive: currentStep == 0,
              ),

              // Step 2: Personal Information
              Step(
                title: Text("Personal Information", style: GoogleFonts.kanit()),
                content: Column(
                  children: [
                    // First Name
                    TextFormField(
                      controller: widget.controllers['firstName'],
                      style: GoogleFonts.kanit(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'ชื่อ',
                        labelStyle: GoogleFonts.kanit(color: Colors.black),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
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
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
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
                    // Age
                    TextFormField(
                      controller: widget.controllers['age'],
                      style: GoogleFonts.kanit(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'อายุ',
                        labelStyle: GoogleFonts.kanit(color: Colors.black),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
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
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2), // Error border color
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
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
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
                          ref
                              .read(showOtherGenderFieldProvider.notifier)
                              .state = true;
                        } else {
                          widget.controllers['gender']?.text = value ??
                              'Male'; // ถ้า value เป็น null กำหนดให้เป็น 'Male'

                          ref
                              .read(showOtherGenderFieldProvider.notifier)
                              .state = false;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Show TextField if "Other" is selected
                    showOtherGenderField
                        ? TextFormField(
                            controller: widget.controllers[
                                'gender'], // Reusing the same controller
                            decoration: InputDecoration(
                              labelText: 'โปรดระบุเพศ',
                              labelStyle:
                                  GoogleFonts.kanit(color: Colors.black45),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2), // Error border color
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 2.0),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2), // Error border color
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please specify your gender';
                              }
                              return null;
                            },
                          )
                        : Container(),
                  ],
                ),
                isActive: currentStep == 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
