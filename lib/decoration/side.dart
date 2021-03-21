import 'package:flutter/material.dart';
import 'package:poke_dec/const.dart';
import 'package:flutter/cupertino.dart';

BorderSide pokeDialogBorder() => BorderSide(color: kPokeBlack, width: 2);

class PokeMessegeContainer extends StatelessWidget {
  const PokeMessegeContainer({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 2, color: kPokeBlack)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 3, color: kPokeBlack),
        ),
        padding: const EdgeInsets.only(top: 12, bottom: 6, right: 6, left: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            child,
            Spacer(),
            RotatedBox(
                quarterTurns: 90,
                child: Icon(
                  CupertinoIcons.triangle_fill,
                  color: kPokeBlack.withOpacity(0.8),
                  size: 16,
                ))
          ],
        ),
      ),
    );
  }
}
