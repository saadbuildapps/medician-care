import 'package:flutter/material.dart';
import 'package:testing/features/Auth/screens/login_screen.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
           const  Text('Select Your Role', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold,)),
           const  SizedBox(height: 30,),
        
            GestureDetector(
              onTap: () {
                // Handle Admin button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoleScreen()),
                );
              },
                // Handle tap event for the 
              child: Container(
              height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: Colors.white ,
                  border: 
                  Border.all(color: Colors.grey, width: 2),
                  // boxShadow: [
                  //   BoxShadow(
                  //     // color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(17)
                ), 
                child:  const Center(child: Text('Admin', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold,))),
                
              ),
            ),

    const   SizedBox(height: 20,),
             GestureDetector(

              onTap: () {
                // Handle Customer button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
               child: Container(
                height: 94,
                width: double.infinity,
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: Colors.white ,
                  border: 
                  Border.all(color: Colors.grey, width: 2),
               
                                    
                  // boxShadow: [
                  //   BoxShadow(
                  //     // color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(17)
                ), 
                child:  const Center(child: Text('Customer', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold,))),
                
                           ),
             ),
       const    SizedBox(height: 20,),
             Container(
              height: 94,
              width: double.infinity,
              decoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                color: Colors.white ,
                border: 
                Border.all(color: Colors.grey, width: 2),

                                  
                // boxShadow: [
                //   BoxShadow(
                //     // color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
                borderRadius: BorderRadius.circular(17)
              ), 
              child:  const Center(child: Text('AI/pharmacist', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold,))),
              
            ),
        
        //     ElevatedButton(
              
              
        //       onPressed: ()
        //     {
        
        //     }, 
        // style : ElevatedButton.styleFrom(
        //     elevation: 1,
        //       backgroundColor: Colors.white ,
        //       minimumSize: const Size(double.infinity, 60),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        // ),
        
            
            
            
            
        //     child: Text('Customer' ,style: TextStyle(  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), ),
        
            
        //     ),
        
        
          ],
        ),
      )
    );
  }
}