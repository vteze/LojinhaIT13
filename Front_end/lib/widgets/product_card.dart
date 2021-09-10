import 'package:flutter/material.dart';
import 'package:front_end/DTOs/Product.dart';
import 'package:front_end/pages/product_detail.dart';

// Constrói as imagens do gridView e aplica borderRadius nas mesmas
class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          product.urlImagem!,
          fit: BoxFit.cover,
        ));

    // Um Material() para conseguir elevar todo o GridTile() que tem um Container()
    // para controlar a altura do footer e o alinhamento do texto e dentro do Container()
    // temos um Material() para aplicar o borderRadius na parte de baixo do gridTile
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.antiAlias,
      child: GridTile(
        footer: Container(
          alignment: Alignment.centerLeft,
          height: 45,
          child: Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
            ),
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: _GridTitleText(product.nome!),
              subtitle: _GridTitleText('R\$ ' + product.precoUnitario!),
            ),
          ),
        ),
        child: InkResponse(
          enableFeedback: true,
          onTap: () {
            // Push para a área de detalhe do produto
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(product),
              ),
            );
          },
          child: image,
        ),
      ),
    );
  }
}

// Permite que o header/footer dentro das imagens se alinhe de acordo
// com o espaço relativo da imagem. Só é chamado nos tipos header e footer.
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}
