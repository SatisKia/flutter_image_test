import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends Container {
  MyContainer( {Key? key, required double width, required double height, alignment, child}) : super(
      key: key,
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
          border: Border.all( color: const Color( 0xff0000ff) )
      ),
      child: child
  );
}

class MyImage extends MyContainer {
  MyImage( String url, Widget? errorWidget, { Key? key, required double width, required double height, BoxFit fit = BoxFit.fill } ) : super(
      key: key,
      width: width,
      height: height,
      child: Image.network( url, fit: fit,
          errorBuilder: ( BuildContext context, Object exception, StackTrace? stackTrace ){
            if( errorWidget == null ){
              return const Icon( Icons.error, color: Colors.grey );
            }
            return errorWidget;
          }
      )
  );
}

class MyImageFromAsset extends MyContainer {
  MyImageFromAsset( String name, { Key? key, required double width, required double height, BoxFit fit = BoxFit.fill } ) : super(
      key: key,
      width: width,
      height: height,
      child: Image.asset( name, fit: fit )
  );
}

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
