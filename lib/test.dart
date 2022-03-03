import 'package:flutter/material.dart';

import 'widget.dart';

class Test1 extends SingleChildScrollView {
  Test1( double width, {Key? key} ) : super(key: key,
      child: Column( children: [
        Row( children: [
          Image.network( "http://www5d.biglobe.ne.jp/~satis/flutter_test.jpg", width: width * 0.7, height: width * 0.7, fit: BoxFit.fill,
              errorBuilder: ( BuildContext context, Object exception, StackTrace? stackTrace ){
                return const Icon( Icons.error, color: Colors.grey );
              }
          ),
        ] ),
        Row( children: [
          Image.asset( "assets/test.jpg", width: width, height: width, fit: BoxFit.fill )
        ] ),
      ] )
  );
}

class Test2 extends Column {
  static String url = "http://www5d.biglobe.ne.jp/~satis/flutter_test.jpg";

  Test2( double width, {Key? key} ) : super(key: key,
      children: [
        Row( children: [
          MyImage( url, null, width: width / 2, height: width / 3, fit: BoxFit.none ),
          MyImage( url, null, width: width / 2, height: width / 3, fit: BoxFit.contain )
        ] ),
        Row( children: [
          MyImage( url, null, width: width / 2, height: width / 3, fit: BoxFit.cover ),
          MyImage( url, null, width: width / 2, height: width / 3, fit: BoxFit.fill )
        ] ),
        Row( children: [
          MyImage( url, null, width: width / 2, height: width / 3, fit: BoxFit.fitHeight ),
          MyImage( url, null, width: width / 2, height: width / 3, fit: BoxFit.fitWidth )
        ] )
      ]
  );
}

class Test3 extends Column {
  static String name = "assets/test.jpg";

  Test3( double width, {Key? key} ) : super(key: key,
      children: [
        Row( children: [
          MyImageFromAsset( name, width: width / 2, height: width / 3, fit: BoxFit.none ),
          MyImageFromAsset( name, width: width / 2, height: width / 3, fit: BoxFit.contain )
        ] ),
        Row( children: [
          MyImageFromAsset( name, width: width / 2, height: width / 3, fit: BoxFit.cover ),
          MyImageFromAsset( name, width: width / 2, height: width / 3, fit: BoxFit.fill )
        ] ),
        Row( children: [
          MyImageFromAsset( name, width: width / 2, height: width / 3, fit: BoxFit.fitHeight ),
          MyImageFromAsset( name, width: width / 2, height: width / 3, fit: BoxFit.fitWidth )
        ] )
      ]
  );
}
