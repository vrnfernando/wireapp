import 'package:flutter/material.dart';

//Model
import 'Model/product.dart';

//Network
import 'Network/ProductService.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    setState(() {
      _products = ProductService.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),

      body: Center(
        child: FutureBuilder<List<Product>>(
          future: _products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(product.mainImage),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              // child: Container(
                              //   margin: EdgeInsets.all(10),
                              //   padding: EdgeInsets.all(5),
                              //   // decoration: BoxDecoration(
                              //   //   color: Colors.white,
                              //   //   borderRadius: BorderRadius.circular(5.0),
                              //   // ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text(
                              //         '\$${product.price}',
                              //         textAlign: TextAlign.right,
                              //         style: TextStyle(
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w700,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${product.price.currency}: ${product.price.amount}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       product.name,
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w700,
                            //       ),
                            //     ),
                            //     Text(
                            //       '\$${product.price}',
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w700,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Text(
                            //   product.description,
                            //   maxLines: 2,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.w400,
                            //     color: Colors.black54,
                            //   ),
                            // ),
                            SizedBox(height: 5.0),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}