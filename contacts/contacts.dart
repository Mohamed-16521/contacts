import 'dart:io';

final List<Map<String, dynamic>> contacts =[
  {
    "id":0,
    "name": {
      "first_name": "mohammed",
      "last_name": "adel",
    },
    "numbers": {
      "01019063523",
      "01024355464"
    },
    "email": "m.adel@gmail.com"
  },
  {
    "id":1,
    "name": {
      "first_name": "ahmed",
      "last_name": "adel",
    },
    "numbers": {
      "01019063523",
      "01024355464"
    },
    "email": "a.adel@gmail.com"
  },
  {
    "id":2,
    "name": {
      "first_name": "adam",
      "last_name": "adel",
    },
    "numbers": {
      "01019063523",
      "01024355464"
    },
    "email": "d.adel@gmail.com"
  },
  {
    "id":3,
    "name": {
      "first_name": "azz",
      "last_name": "adel",
    },
    "numbers": {
      "01019063523",
      "01024355464"
    },
    "email": "z.adel@gmail.com"
  },
  {
    "id":4,
    "name": {
      "first_name": "ali",
      "last_name": "adel",
    },
    "numbers": {
      "01019063523",
      "01024355464"
    },
    "email": "l.adel@gmail.com"
  },

];

void displayContacts(){
  contacts.forEach((item) {
    item.forEach((key, value) {
      if(key =='name'){
        value.forEach((localKey, localValue){
          print('$localKey: $localValue');

        });
      }else if(key=='numbers') {
        value.forEach((localValue) {
          print('$key: $localValue');
        });
      }else {
        print('$key:$value');
      }
    });
  });
  showOptions();
}

void showOptions(){
  print("please choose option: \n 1.show\n2.add\n3.edit\n4.delete\n5.search\n6.sort");
  final String? option =stdin.readLineSync();
  if(option == '1'){
    displayContacts();
  }else if(option== '2'){
    addContact();
  }else if(option== '3'){
    editContacts();
  }else if(option== '4'){
    deleteContacts();
  }else if(option== '5'){
    searchContacts();
  }else if(option== '6'){
    sort();
  }else if(option!.toLowerCase()=='exit'){
    print('end');

  }else{
    print('invalid option');
  }
}

void addContact(){
  print("please enter first name: ");
  final String? firstName =stdin.readLineSync();
  print("please enter last name");
  final String? lastName =stdin.readLineSync();
  print("please enter email");
  final String? email =stdin.readLineSync();
  print("please enter number");
  String number =stdin.readLineSync()!;

  final Set numbers ={};

  while(number.isNotEmpty){
    numbers.add(number);
    print("please enter number");
    number =stdin.readLineSync()!;
  }
  contacts.add({
    "id":contacts.length +1,
    "name": {
      "first_name": firstName,
      "last_name": lastName,
    },
    "numbers": numbers,
    "email": email
  });
  displayContacts();
}

void editContacts(){
  print("please enter contact id: ");
  final int? id =int.tryParse(stdin.readLineSync()!);
  for(int i=0; i<contacts.length;i++) {
    if(id==contacts[i]['id']){
      print('Enter first name or skip: ');
      final String? firstName =stdin.readLineSync();
      if(firstName!.isNotEmpty){
        contacts[i]['name']['first_name'] = firstName;
      }
      print('Enter last name or skip: ');
      final String? lastName =stdin.readLineSync();
      if(lastName!.isNotEmpty) {
        contacts[i]['name']['last_name'] = lastName;
      }
        print('Enter email or skip: ');
        final String? email =stdin.readLineSync();
        if(email!.isNotEmpty){
          contacts[i]['email'] = email;
      } final Set localSet = contacts[i]['numbers'];
        for(int y=0; y< localSet.length;y++){
          print('selected number to edit: ${localSet.elementAt(y)}');
          print('Enter number or skip: ');
          final String? number =stdin.readLineSync();
          if(number!.isNotEmpty) {
            localSet.remove(localSet.elementAt(y));
            localSet.add(number);
          }
        }
      break;
    }
  }
  displayContacts();
}

void sort(){
  contacts.sort(
      (a, b)=>
        a['name']['first_name'].compareTo(b['name']['first_name']),
  );
  displayContacts();

}

void deleteContacts(){
  print("please enter contact id: ");
  final int? id =int.tryParse(stdin.readLineSync()!);
  contacts.removeWhere((element) => element==['id']);
  displayContacts();

}

void searchContacts(){
  print('please Enter contact name: ');
  final String? name =stdin.readLineSync();
  contacts.forEach((contact) {
    if(contact['name'].toString().toLowerCase().contains(name?.toLowerCase() as Pattern)){
      print(contact);
    }
  });
  displayContacts();
}