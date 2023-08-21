import 'package:flutter/material.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.black12),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ListTile(
                  leading: Image.network(
                    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/29abad8d7ae64654b001adb90136819e_9366/RUNMAGICA_SHOES_Blue_EY2972_01_standard.jpg',
                  ),
                  title: Text(
                    'Nike Air Zoom Pegasus 36 Miami',
                    style: TextStyle(
                      color: Colors.black12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '\$299',
                    style: TextStyle(
                      color: Colors.black12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline_outlined),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Icon(Icons.remove),
                        ),
                        Container(
                          child: Text('1'),
                        ),
                        Container(
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Coupon code',
              suffixIcon: ElevatedButton(
                onPressed: () {},
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
            ),
          ),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('items'),
                  Text('600 USD'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('items'),
                  Text('600 USD'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('items'),
                  Text('600 USD'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('items'),
                  Text('600 USD'),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
        Container(
          height: 2,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: 8,
                margin: EdgeInsets.symmetric(horizontal: 2),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Check out'),
            style: ElevatedButton.styleFrom(),
          ),
        ),
      ],
    ));
  }
}
