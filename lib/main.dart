import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/forgot': (context) => ForgotPage(),
        '/reset': (context) => ResetPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailError = "";
  String passwordError = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ToDo App',
              textAlign: TextAlign.center,
              style: TextStyle(height: -1, fontSize: 30),
            ),
            Icon(
              Icons.login,
              size: 100.0,
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
                errorText: emailError,
              ),
              controller: emailController,
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                errorText: passwordError,
              ),
              controller: passwordController,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  emailError = _emailValidator(emailController.text);
                  passwordError = _contrasenaValidator(passwordController.text);
                });
                if (emailError.isEmpty && passwordError.isEmpty) {
                  // Realiza la autenticación aquí
                }
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('¿No tienes una cuenta? Regístrate aquí.'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot');
              },
              child: Text('¿Olvidaste la contraseña?'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String nameError = "";
  String emailError = "";
  String passwordError = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ToDo App',
              textAlign: TextAlign.center,
              style: TextStyle(height: -1, fontSize: 30),
            ),
            Icon(
              Icons.person_add,
              size: 100.0,
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Nombre',
                errorText: nameError,
              ),
              controller: nameController,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
                errorText: emailError,
              ),
              controller: emailController,
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                errorText: passwordError,
              ),
              controller: passwordController,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nameError = _nombreValidator(nameController.text);
                  emailError = _emailValidator(emailController.text);
                  passwordError = _contrasenaValidator(passwordController.text);
                });
                if (nameError.isEmpty &&
                    emailError.isEmpty &&
                    passwordError.isEmpty) {
                  // Realiza el registro aquí
                }
              },
              child: Text('Registrarse'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('¿Ya tienes una cuenta? Inicia sesión aquí.'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String emailError = "";

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Contraseña'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ToDo App',
              textAlign: TextAlign.center,
              style: TextStyle(height: -1, fontSize: 30),
            ),
            Icon(
              Icons.restart_alt,
              size: 100.0,
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo Electrónico',
                errorText: emailError,
              ),
              controller: emailController,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  emailError = _emailValidator(emailController.text);
                });
                if (emailError.isEmpty) {
                  // Enviar correo de recuperación de contraseña
                }
              },
              child: Text('Enviar'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Ya la recordé'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String passwordError = "";
  String newPasswordError = "";
  String confirmPasswordError = "";

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Contraseña'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ToDo App',
              textAlign: TextAlign.center,
              style: TextStyle(height: -1, fontSize: 30),
            ),
            Icon(
              Icons.restart_alt,
              size: 100.0,
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                errorText: passwordError,
              ),
              controller: passwordController,
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Nueva Contraseña',
                errorText: newPasswordError,
              ),
              controller: newPasswordController,
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirmar Contraseña',
                errorText: confirmPasswordError,
              ),
              controller: confirmPasswordController,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  passwordError = _contrasenaValidator(passwordController.text);
                  newPasswordError =
                      _contrasenaValidator(newPasswordController.text);
                  if (newPasswordController.text !=
                      confirmPasswordController.text) {
                    confirmPasswordError = 'Las contraseñas no coinciden';
                  } else {
                    confirmPasswordError = '';
                  }
                });
                if (passwordError.isEmpty &&
                    newPasswordError.isEmpty &&
                    confirmPasswordError.isEmpty) {
                  // Cambiar la contraseña
                }
              },
              child: Text('Cambiar'),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

String _emailValidator(String value) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_´{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (!emailValid) {
    return "Introduce una dirección de correo electrónico válida";
  } else {
    return "";
  }
}

String _nombreValidator(String value) {
  if (value.isEmpty) {
    return 'Este campo no puede estar vacío';
  }

  if (RegExp(r'[0-9]').hasMatch(value)) {
    return 'El nombre no debe contener números';
  }

  return "";
}

String _contrasenaValidator(String value) {
  if (value.isEmpty) {
    return 'Este campo no puede estar vacío';
  }

  if (value.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  }

  bool hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  bool hasNumber = RegExp(r'[0-9]').hasMatch(value);

  if (!hasSpecialChar || !hasNumber) {
    return 'La contraseña debe contener al menos un carácter especial y un número';
  }

  return "";
}
