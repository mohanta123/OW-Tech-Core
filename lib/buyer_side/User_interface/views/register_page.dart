import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../blocs/images_data.dart';
import '../../blocs/user_authentication.dart';
import '../../models/user.dart';
import '../../models/user_validation.dart';
import '../widgets/animated_avatar.dart';
import '../widgets/animated_row.dart';
import '../widgets/hr.dart';
import '../widgets/layout_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with UserValidation {
  TextEditingController nameTFieldController = TextEditingController();
  TextEditingController lastNameTFieldController = TextEditingController();
  TextEditingController dniTFieldController = TextEditingController();
  TextEditingController emailTFieldController = TextEditingController();
  TextEditingController typeTFieldController = TextEditingController();
  String imageFileController = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameTFieldController.dispose();
    lastNameTFieldController.dispose();
    dniTFieldController.dispose();
    emailTFieldController.dispose();
    typeTFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const hr(),
                  const Text(
                    'Registro gratuito',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const hr(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.photo),
                        onPressed: () async {
                          imageFileController =
                              await ImageData().saveImage(context) ?? '';
                          setState(() {});
                        },
                      ),
                      AnimatedAvatar(imageSrc: imageFileController),
                      IconButton(
                        onPressed: () async {
                          imageFileController =
                              await ImageData().savePhoto(context) ?? '';
                          setState(() {});
                        },
                        icon: const Icon(Icons.camera_alt),
                      )
                    ],
                  ),
                  const hr(),
                  const Text(
                    'Información',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const hr(),
                  AnimatedRow(
                    title: 'Nombre',
                    validator: (value) =>
                        isName(value) ? 'Nombre con sintax incorrecta' : null,
                    controller: nameTFieldController,
                    isEditable: false,
                  ),
                  AnimatedRow(
                    title: 'Apellidos',
                    validator: (value) => isName(value)
                        ? 'Apellidos con sintax incorrecta'
                        : null,
                    controller: lastNameTFieldController,
                    isEditable: false,
                  ),
                  AnimatedRow(
                    title: 'DNI',
                    validator: (value) =>
                        isDNI(value) ? 'DNI con sintax incorrecta' : null,
                    controller: dniTFieldController,
                    isEditable: false,
                  ),
                  AnimatedRow(
                    title: 'Correo',
                    controller: emailTFieldController,
                    validator: (value) =>
                        isEmail(value) ? 'Correo con sintax incorrecta' : null,
                    isEditable: false,
                  ),
                  AnimatedRow(
                    title: 'Contraseña',
                    controller: typeTFieldController,
                    validator: (value) => isPassword(value)
                        ? 'Contraseña con sintax incorrecta'
                        : null,
                    isEditable: false,
                  ),
                  const hr(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: mainBackupColor),
                    ),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainBackupColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async => await LoginValidation().registerUser(
                        User(
                            fecha: '',
                            image: imageFileController,
                            lastname: lastNameTFieldController.text,
                            id: 0,
                            dni: dniTFieldController.text,
                            name: nameTFieldController.text,
                            email: emailTFieldController.text,
                            pass: typeTFieldController.text),
                        _formKey,
                        context)
                    ? Navigator.pop(context)
                    : '',
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
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
}
