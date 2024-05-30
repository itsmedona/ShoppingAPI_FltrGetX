import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        product.imageLink,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Obx(() => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                product.isFavorite.toggle();
                              },
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.rating.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 32, fontFamily: 'avenir'),
            ),
          ],
        ),
      ),
    );
  }
}
