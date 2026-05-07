import 'package:flutter/material.dart';

class Inherited extends InheritedModel {
  const Inherited({required super.child, super.key, required this.color});
  final Color color;

  static Inherited of(BuildContext context) {
    InheritedModel.inheritFrom(context,aspect: WidgetAspects());

    Inherited? inherited = context
        .dependOnInheritedWidgetOfExactType<
          Inherited
        >(); // return thing intherited from inherited widgets
    assert(inherited != null, "inherited widget not found in tree");
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant Inherited oldWidget) {
    return oldWidget.color != oldWidget.color;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant InheritedModel<dynamic> oldWidget,
    Set<dynamic> dependencies,
  ) {
    // TODO: implement updateShouldNotifyDependent
    throw UnimplementedError();
  }
}

class WidgetAspects {
  static const String colorBox = "color red";
  static const String color2Box = "color";

}
