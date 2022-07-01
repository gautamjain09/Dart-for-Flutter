// <------------------------ Learning Dart ----------------------------------->

// <-------------------------- Functions ------------------------------->

String getFullString(String firstName, String lastName) {
  // return firstName + ' ' + lastName;
  return '$firstName $lastName';
}

String getString(String firstName, String lastName) => '$firstName $lastName';

// <---------------------------- if else ------------------------------->

void ifElse(int value) {
  if (value == 10) {
    print('It is 10');
  } else if (value == 0) {
    print('It is 0');
  } else {
    print('It\'s not 10 & 0');
//  print("It's not 10 & 0");
  }
}

// <---------------------------- Lists ------------------------------->

void lists() {
  // Storing a bunch of element
  final names = ['One', 'Two', 'Three'];
  print(names[0]);
  print(names[1]);
  print(names[2]);
  print(names.length);
  names.add('Four');
  names.remove('One');
  names.removeAt(0);
  print(names);
}

// <---------------------------- Sets ------------------------------->

void sets() {
  // Sets is used for storing unique elements
  final names = {'One', '2', 'Three'};
  names.add('One');
  names.add('2');
  names.add('Three');
  print(names);
}

// <---------------------------- Map ------------------------------->

void maps() {
  // Key value storing elements
  var person = {'age': 20, 'gender': 'Male', 'weight': 80.4};
  print(person);
  person['age'] = 21;
  print(person);
  person['height'] = 155;
  print(person);

  var details = new Map();
  details['Usrname'] = 'admin';
  details['Password'] = 'admin@123';
  print(details);
}

void nullSafety() {
  // By appyying ? after datatype you tell the complier that it is nullable Type
  String? name = null;
  print(name);
  name = 'Gautam';
  print(name);
  name = null;
  print(name);

  List<String>? names0 = null;
  List<String>? names1 = ['Foo', 'bar'];
  List<String?>? names2 = ['Foo', 'bar', null];
  print(names1);
  print(names2);

  // int? lineCount;
  // assert(lineCount == null);

  // < ------------------------ Null Aware Assignment Operator --------------------- >

  const String? firstName = null;
  const String? middleName = 'Gautam';
  const String? lastName = 'Jain';

  // const firstNonNullName = firstName ?? middleName ?? lastName;
  // print(firstNonNullName);
  // print('\n');

  // var firstNonNullName_ = firstName;
  // firstNonNullName_ ??= middleName;
  // firstNonNullName_ ??= lastName;
  // print(firstNonNullName_);
}

//Use ?. syntax to conditionally invoke a method or property while dealing with null
void conditionalInvocation() {
  List<String>? names = null;

  // final int length;
  // if (names != null) {
  //   length = names.length;
  // } else {
  //   length = 0;
  // }

  // final length = names?.length; // will give null
  final length = names?.length ?? 0;
  names?.add('Foo');

  print(length);
}

// <---------------------------------- Enum ----------------------------- >

//In enum first name should be Capital letter
enum PersonProperties { flat, house, bunglow, farmhouse }

void Enumeration(PersonProperties propertytype) {
  switch (propertytype) {
    case PersonProperties.flat:
      {
        print("Flat");
        break;
      }
    case PersonProperties.bunglow:
      {
        print("bunglow");
        break;
      }
    case PersonProperties.farmhouse:
      {
        print("farmhouse");
        break;
      }
    case PersonProperties.house:
      {
        print("house");
        break;
      }
  }
}

// <---------------------------- Classes and Objects ------------------------->

class PersonActivity {
// Constructor
  final String name;
  PersonActivity(this.name);

  void printName() {
    print(this.name);
  }

  // void run() {
  //   print("Running");
  // }

  // void breathe() {
  //   print("Breathing");
  // }

}

void Classes() {
  // Classes & Object
  // final person = PersonActivity();
  // person.run();
  // person.breathe();

  //Constructor
  final person_name = PersonActivity("Gautam");
  print(person_name.name); // Gautam
  person_name.printName(); // Gautam
}

// <---------------- Inheritance & Subclassing ----------------------->

class LivingThings {
  void move() {
    print("I am moving");
  }

  void breathe() {
    print("Living thing is breathing");
  }
}

class Cattt extends LivingThings {}

void Inheritance() {
  final fluffers = Cattt();
  fluffers.move();
  fluffers.breathe();
}
//  < ---------------- factory Constructor ------------------- >

// <---------------- Custom Operator ----------------------->
// Can return instance that are not of same classes

class dog {
  final String name;
  dog(this.name);

  // To Make Custom Operator work properly
  @override
  bool operator ==(covariant dog other) => other.name == name;

  // hash provide hash value not necessary to use there
  @override
  int get hashcode => name.hashCode;
}

void CustomOperator() {
  final dog1 = dog('husky');
  final dog2 = dog('husky');
  if (dog1 == dog2) {
    print("Equal");
  } else {
    print('Unequal');
  }
}

// < --------------------------------- Extensions ---------------------------- >

class Cat {
  final String name;
  Cat(this.name);
}

// Extensions are just Adding logic to exsisting class
extension Run on Cat {
  void run() {
    print("Cat $name is running");
  }
}

void Extension() {
  final meow = Cat("Fluffers");
  meow.run();
  print(meow.name);
}

// < --------------------------------- Future ---------------------------- >
// Data to be returned in the future It si a part of asynchronous
// Asynchronised task is a task whose results are not appear immedeately

Future<int> futureMultiplybytwo(int a) {
  return Future.delayed(const Duration(seconds: 5), () {
    return a * 2;
  });
}

// async is for delaying  && await is telling to wait for result till delayed
void Futureee() async {
  final result = await futureMultiplybytwo(20);
  print(result);
}

// <----------------------------- Streams --------------------------------->
// An asynchronous "pipe" of data
// Can Return infinite data at periodic duration type

Stream<String> getName() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return 'Yippie';
  });
  // return Stream.value("foo");
}

void Streamm() async {
  await for (final value in getName()) {
    print(value);
  }
  print("Stream Finished Working");
}

// < --------------------------------- Generating ---------------------------- >

Iterable<int> getOneTwoThree() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void Generators() {
  print(getOneTwoThree());
  for (final value in getOneTwoThree()) {
    print(value);
    if (value == 2) {
      break;
    }
  }
}

// < --------------------------------- Generics---------------------------- >
// Template in c++ ~ Generics in dart

class Pair<A, B> {
  final A value1;
  final B value2;
  Pair(this.value1, this.value2);
}

void Generics() {
  final names = Pair('gautamjain', '09');
  print(names.value1);
  print(names.value2);
}

void main() {
  print(getString('foo', 'bar'));
//   print(getFullString('foo', 'bar'));
//   print('foobaar');

//   ifElse(20);
//   lists();
//   sets();
//   maps();

//   nullSafety();
//   conditionalInvocation();

//   Enumeration(PersonProperties.flat);
//   Classes();
//   Inheritance();
//  CustomOperator();

//  Extension();
//  Futureee();
//  Streamm();
//  Generators();
  // Generics();
}
