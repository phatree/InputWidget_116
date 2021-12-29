import 'dart:html';

import 'package:flutter/material.dart';
import 'package:inputwidgets/models/drink.dart';
import 'package:inputwidgets/models/food.dart';

class InputHomePage extends StatefulWidget {
  const InputHomePage({ Key? key }) : super(key: key);

  @override
  _InputHomePageState createState() => _InputHomePageState();
}

class _InputHomePageState extends State<InputHomePage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _pasw = TextEditingController();

  // Radio
  String? groupFood;
  List<Food>? foods;

  // Checkbox
  List checkedDrink = []; // เก็บค่าที่เลือก
  List<Drink>? drinks; // เก็บรายการเครื่องดื่มจากคลาส

  // Dropdown
  List<ListItem> types = ListItem.getItem();
  late  List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItme;

// get item => null;

  @override
  void initState() {
    super.initState();
    foods = Food.getFood();
    drinks = Drink.getDrink();

    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectedTypeItme = _dropdownMenuItem.first.value!;


  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
    List<ListItem>? types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var type in types!) {
      items.add(
        DropdownMenuItem(
          child: Text(type.name!),
          value: type,
        )
      ); 
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                child: TextFormField(
                controller: _username,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Please Enter Username";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3,
                    )
                  )
                ),
                ),
              ),
            ),
            

            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                child: TextFormField(
                controller: _pasw,
                obscureText: true,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Please Enter Password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3,
                    )
                  )
                ),
                ),
              ),
            ),
            // Text(_username.text),

            Column(
              children: createRadioFood(),
              
            ),
            Text('Radio Selected: $groupFood'),
            const SizedBox(height: 16),
            Column(
              children: createCheckboxDrink(),
            ),
            const SizedBox(height: 16),
            DropdownButton(
              value: _selectedTypeItme,
              items: _dropdownMenuItem,
               onChanged: (ListItem? value) {
                 setState(() {
                   _selectedTypeItme = value!;
                 });
                },
               ),
               Text('Dropdown selected:  ${_selectedTypeItme.value}'),

            ElevatedButton(onPressed: (){
              
              if(_formKey.currentState!.validate()){
                print(_username.text);
                print(_pasw.text);
              }
            }, 
            child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createRadioFood() {
    List<Widget> listFood = [];

    for (var food in foods!) {
      listFood.add(
        RadioListTile<dynamic>(
                    title: Text(food.thName!),
                    subtitle: Text(food.enName!),
                    secondary: Text('${food.price} บาท' ),
                    value: food.foodValue,
                    groupValue: groupFood,
                    onChanged: (value) {
                      setState(() {
                        groupFood = value;
                      });  
                    },
                  ),
      );
      // print(food.thName);
    }
    return listFood;
  }

  List<Widget> createCheckboxDrink() {
      List<Widget> listDrink = [];

      for (var drink in drinks!) {
        listDrink.add(CheckboxListTile(
          value: drink.checked,
          title: Text(drink.thName!),
          subtitle: Text('${drink.price} บาท'), 
          onChanged: (value){
            setState(() {
              drink.checked = value;
            });

            if (value!) {
              checkedDrink.add(drink.thName);
            }
            print(checkedDrink);

          },
        ));
        
      }
        return listDrink;
  }      
}

class ListItem {
  int? value;
  String? name;

//Construtor
  ListItem(this.value, this.name);

  static getItem() {
    return[
      ListItem(1, 'เครื่องดื่ม'),
      ListItem(2, 'อาหารอีสาน'),
      ListItem(3, 'อาหารจานเดียว'),
      ListItem(4, 'ขนมหวาน'),
    ];
  }
}

