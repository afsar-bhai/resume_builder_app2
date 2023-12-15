import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
final  TextEditingController mobileController = TextEditingController();
 final TextEditingController graduationController = TextEditingController();
 final TextEditingController passGController = TextEditingController();
 final TextEditingController percentGController = TextEditingController();
final  TextEditingController percentIController = TextEditingController();
  final TextEditingController percentHController = TextEditingController();
  final TextEditingController achivmentController = TextEditingController();
  final TextEditingController extraActivityController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Form Data Example'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ClipPath(
              clipper: ContainerCliper(),
              child: Container(
                color: Colors.green,
                height: 180,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: const [
                Text(
                  "Resume",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Build Resume",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: detailController,
                decoration: InputDecoration(labelText: 'Persional Detail'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: mobileController,
                decoration: InputDecoration(labelText: 'Mobile'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller:graduationController,
                decoration: InputDecoration(labelText: 'Graduation'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller:  passGController,
                decoration: InputDecoration(labelText: 'Passing year'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: percentGController,
                decoration: InputDecoration(labelText: 'Percent in Graduation'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: percentIController,
                decoration: InputDecoration(labelText: 'Percent in 12th'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: percentHController,
                decoration: InputDecoration(labelText: 'Percent in 10th'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: achivmentController,
                decoration: InputDecoration(labelText: 'Any Achivment'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: TextField(
                controller: extraActivityController,
                decoration: InputDecoration(labelText: 'Extra Activity'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: ElevatedButton(
                onPressed: _saveForm,
                child: Text('Save'),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: ElevatedButton(
                onPressed: _loadForm,
                child: Text('Submit'),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  void _saveForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save form details
    prefs.setString('name', nameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('detail', detailController.text);
    prefs.setString('mobile', mobileController.text);
    prefs.setString('graduation', graduationController.text);
    prefs.setString(' passG', passGController.text);
    prefs.setString('percentG', percentGController.text);
    prefs.setString('percentI', percentIController.text);
    prefs.setString('percentH', percentIController.text);
    prefs.setString('achivment', achivmentController.text);
    prefs.setString('extraActivity', extraActivityController.text);



    // Optionally, show a snackbar or navigate to another screen
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Form data saved successfully!'),
    ));
  }

  void _loadForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load form details
    String name = prefs.getString('name') ?? '';
    String email = prefs.getString('email') ?? '';
    String detail = prefs.getString('detail') ?? '';
    String mobile = prefs.getString('mobile') ?? '';
    String graduation = prefs.getString('graduation ') ?? '';
    String passG = prefs.getString('passG') ?? '';
    String percentG = prefs.getString('percentG') ?? '';
    String percentI= prefs.getString('percentI') ?? '';
    String percentH = prefs.getString('percentH') ?? '';
    String achiment = prefs.getString('achivment') ?? '';
    String extraActivity = prefs.getString('extraActivity') ?? '';



    // Display the loaded data
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          //contentPadding: EdgeInsets.zero,

          title: Column(
            children: [
              ClipPath(
                clipper: ContainerCliper(),
                child: Container(
                  color: Colors.green,
                  height: 180,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text('Finally Build Resume',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ],
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: TextSpan(text: 'Name :',
                    style:TextStyle(fontSize:15,fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(text: '$name', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                ]),),
                RichText(text: TextSpan(text: 'Email :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$email', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Detail :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$detail', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Mobile :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$mobile', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Graduation :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$graduation', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Passing Year :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$passG', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Percentage in Graaduation :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$percentG', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Percent in 12th:',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$percentI', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Percent in 10th :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$percentH', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Achivment:',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$achiment', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),
                RichText(text: TextSpan(text: 'Extra Activity :',style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.black),
                    children: [
                      TextSpan(text: '$extraActivity', style: TextStyle(fontSize:12, fontWeight: FontWeight.normal,color: Colors.black) )
                    ]),),

               // Text('Name: $name',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
                //Text('Email: $email'),
               // Text('Detail: $detail'),
                //Text('Mobile: $mobile'),
               // Text('Graduation $graduation'),
               // Text('Passing Year: $passG'),
               // Text('Percentage in Graduation: $percentG'),
               //  Text('Percent in 12th: $percentI'),
               //  Text('Percent in 10th: $percentH'),
               //
               //  Text('Achivment: $achiment'),
               //  Text('Extra Activity: $extraActivity'),


              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
class ContainerCliper extends CustomClipper<Path> {
  var path = Path();
  @override
  Path getClip(Size size) {
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height - 100,
        size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}