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
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/forgot': (context) => ForgotPage(),
        '/reset': (context) => ResetPage(),
        '/menu': (context) => MenuPage(),
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
              style: TextStyle(height: 1, fontSize: 30),
            ),
            Icon(
              Icons.login,
              size: 100.0,
              color: Colors.blue,
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
                  Navigator.pushNamed(context, '/menu');
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
              style: TextStyle(height: 1, fontSize: 30),
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
              style: TextStyle(height: 1, fontSize: 30),
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
                  Navigator.pushNamed(context, '/reset');
                });
              },
              child: Text('Enviar'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {},
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
              style: TextStyle(height: 1, fontSize: 30),
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
                    Navigator.pushNamed(context, '/');
                  }
                });
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

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<String> list = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nombre de tarea',
              textAlign: TextAlign.left,
              style: TextStyle(height: 5, fontSize: 25),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Tarea',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Descripcion',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String description = descriptionController.text;
                if (name.isNotEmpty) {
                  setState(() {
                    list.add("Nombre: $name:\n$description");
                  });
                  nameController.clear();
                  descriptionController.clear();
                }
              },
              child: Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: checkboxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  },
                  title: const Text('name'),
                  subtitle: const Text('Supporting text'),
                  //title: Text(list[index]),
                );
              },
            ),
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
