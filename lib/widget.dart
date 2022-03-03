import 'package:flutter/material.dart';

class MyContainer extends Container {
  MyContainer( {
    Key? key,
    required double width,
    required double height,
    alignment,
    child,
  } ) : super(
      key: key,
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
          border: Border.all( color: const Color( 0xff0000ff) ),
      ),
      child: child,
  );
}

class MyImage extends MyContainer {
  MyImage( String url, Widget? errorWidget, {
    Key? key,
    required double width,
    required double height,
    BoxFit fit = BoxFit.fill
  } ) : super(
      key: key,
      width: width,
      height: height,
      child: Image.network( url,
          fit: fit,
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
  MyImageFromAsset( String name, {
    Key? key,
    required double width,
    required double height,
    BoxFit fit = BoxFit.fill
  } ) : super(
      key: key,
      width: width,
      height: height,
      child: Image.asset( name, fit: fit )
  );
}
