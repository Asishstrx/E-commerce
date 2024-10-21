// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:ecommerce/cart/cart.dart';
import 'package:ecommerce/Item/itemdetails.dart';
import 'package:ecommerce/Item/itempage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  List brandsimages = [
    AssetImage('lib/images/th (3).jpeg'),
    AssetImage('lib/images/th (4).jpeg'),
    AssetImage('lib/images/th (7).jpeg'),
    AssetImage('lib/images/th (8).jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Text(
          'Shoe Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenheight * 0.05,
                width: screenwidth * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(style: BorderStyle.none),
                    color: Colors.grey[100]),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            CircleBorder(),
                          ),
                          fixedSize: WidgetStatePropertyAll(
                              Size.fromWidth(screenwidth * 0.04)),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.lightBlueAccent)),
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                        width: screenwidth * 0.15, child: Text('Location')),
                    SizedBox(width: screenwidth * 0.34),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.lightBlueAccent),
                        fixedSize: WidgetStatePropertyAll(
                            Size.fromWidth(screenwidth * 0.27)),
                      ),
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: screenheight * 0.07,
                child: ListView.builder(
                  itemCount: brandsimages.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    height: 100,
                    width: screenwidth * 0.24,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: WidgetStatePropertyAll(0),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            CircleBorder(),
                          ),
                        ),
                        child: Image(image: brandsimages[index])),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: screenheight * 0.6,
                child: GridView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      height: screenheight * 0.30,
                      width: screenwidth * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Column(
                        children: [
                          Container(
                            height: screenheight * 0.125,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(item.imageurl),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          SizedBox(
                            height: screenheight * 0.08,
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ItemDetailPage(item: item),
                                        ));
                                  },
                                  child: Text(
                                    item.name,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Text(
                                  '${item.price}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
