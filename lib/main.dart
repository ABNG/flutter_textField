import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();   // TextEditingController _nameController = TextEditingController(text:"initial text"); 
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Complete"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: 100.0,
                color: Colors.purple,
                child: Center(
                  child: Text(
                    "TO HIDE KEYBOARD CLICK HERE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Container(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  controller: _nameController,
                  autofocus: true, // to focus the textField
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "enter your name",
                    labelText: "enter name",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter name";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "enter your email",
                labelText: "enter email",
              ),
              maxLines: 4,
            ),
            SizedBox(
              height: 5.0,
            ),
            Theme(
              data: ThemeData(
                primaryColor: Colors.black,
              ),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "enter your password",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: show
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                  ),
                ),
                obscureText: show,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  //we can also use setState() here if needed,
                  print("${_nameController.text}");
                }
              },
              child: Text("Validate"),
            ),
          ],
        ),
      ),
    );
  }
}
