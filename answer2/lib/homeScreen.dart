import "package:flutter/material.dart";
import "package:flutter_e_commerce_application_1/myCart.dart";
import "package:flutter_e_commerce_application_1/selected_provider.dart";
import "package:provider/provider.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> price = [
    31999,
    25999,
    17999,
    52999,
    24750,
    10999,
    15159,
    11999,
    24999,
    30750,
    23999,
    19999,
    12790,
    18379,
    8999
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Launch Screen"),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCartScreen()));
              },
              child: Icon(Icons.shopping_cart)),
          SizedBox(width: 40)
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Consumer<SelectedItemProvider>(
                    builder: (context, value, child) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            radius: 50,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/iphone${index + 1}.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text("Harshit Samsung Phone ${index + 1}"),
                          subtitle: Text("Rs. ${price[index]}"),
                          trailing: IconButton(
                              icon: value.selectedItem.contains(index)
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.done,
                                                color: Colors.blue,
                                              )),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                value.removeItem(index);
                                              },
                                              icon: value.selectedItem
                                                      .contains(index)
                                                  ? Icon(Icons.remove,
                                                      color: Colors.red)
                                                  : Icon(Icons.shopping_cart))
                                        ])
                                  : const Icon(Icons.shopping_cart),
                              onPressed: () {
                                value.addItem(index);
                              })));
                });
              }),
        )
      ]),
    );
  }
}
