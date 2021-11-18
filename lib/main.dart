import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/screens/shopping.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ShoppingCart()),
    ],
    child: MyApp(),
    )
   
    
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
debugShowCheckedModeBanner: false,
home: HomePage(),
title: "provider",
    );
    
    
    
    
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
         appBar: AppBar(
           title: Text("Car dealer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
           backgroundColor: Colors.green[500],
           actions: <Widget>[
             IconButton(onPressed: (){},
              icon: Icon(Icons.shopping_cart,size:20,color: Colors.white)
              )
           ],
         ),
         bottomNavigationBar: BottomNavigationBar(
           items: [
             BottomNavigationBarItem(
               icon: Icon(Icons.car_rental),
               label: "car rental"
               ),
               BottomNavigationBarItem(
               icon: Icon(Icons.car_repair_outlined),
               label: "Car Repair"
               ),
               BottomNavigationBarItem(
               icon: Icon(Icons.call_end),
               label: "Call Us"
               )
           ],
         ),
         body: Column(
           children:<Widget> [
            ListTile(
              title: Text("bmw"),
              subtitle: Text("800"),
              trailing: Icon(Icons.add),
              onTap: ()=>context.read<ShoppingCart>().addItem("bmw 800"),
            ),
            ListTile(
              title: Text("bmw"),
              subtitle: Text("x6"),
              trailing: Icon(Icons.add_box_rounded),
              onTap: ()=>context.read<ShoppingCart>().addItem("bmw x6"),
            ),
            ListTile(
              title: Text("ford"),
              subtitle: Text("ranger"),
              trailing: Icon(Icons.add),
              onTap: ()=>context.read<ShoppingCart>().addItem("ford ranger"),
            ),
            Column(
            
              children: [
                ElevatedButton(onPressed: ()=>context.read<ShoppingCart>().removeItem("bmw 800"),  
                child: Text("remove bmw 800"),
                
                style: ElevatedButton.styleFrom(
                  
                  primary: Colors.green[500]
                
                ),
                ),
                 ElevatedButton(onPressed: ()=>context.read<ShoppingCart>().removeItem("bmw x6"),  
                child: Text("remove bmw x6"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[500]
                ),
                ),
                
                 ElevatedButton(onPressed: ()=>context.read<ShoppingCart>().removeItem("ford ranger"),  
                child: Text("remove ford ranger"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[500],
                  
                ),
                ),
              ],
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Text("(${context.watch<ShoppingCart>().cart})",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.black,))
                ],
              ),
            )
           ],
          
         ),
    );
  }
}