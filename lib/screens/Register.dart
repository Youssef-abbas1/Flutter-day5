import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _regst = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: FormBuilder(
        key: _regst,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(100),
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
              ),
              width: double.infinity,
              // height: 200,
              child: Icon(Icons.workspaces_outlined),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(
                  labelText: 'name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "Are you kidding with me !",
                  ),
                  FormBuilderValidators.min(
                    7,
                    errorText: "please enter more than 7 char ",
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormBuilderTextField(
                name: "email",
                decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.g_mobiledata),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormBuilderTextField(
                name: "password",
                decoration: InputDecoration(
                  labelText: "password",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.remove_red_eye),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "type here please!",
                  ),
                  FormBuilderValidators.min(
                    5,
                    errorText: "please enter more than 5 char",
                  ),
                ]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _regst.currentState?.saveAndValidate();
                debugPrint(_regst.currentState?.value.toString());
                if (_regst.currentState!.isValid) {}
                ;
              },
              child: Text("Login"),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("do not have any Account?"),
                  Gap(10),
                  InkWell(onTap: (){
                    Navigator.pushReplacementNamed(context, "/login");
                  },child: Text("Register now ",style: TextStyle(color: Colors.blue),)),
                ] 
              ),
            )
            
          ],
        ),
      ),
    );
  }
}