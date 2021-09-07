import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProduct = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha loja"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProduct.length,
        itemBuilder: (ctx, i) => ProductItem(product: loadedProduct[i]),
        //sliver é uma área de algo que pode ser rolado
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //dois produtos por linha
          crossAxisCount: 2,
          //relação entre altura e largura
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
