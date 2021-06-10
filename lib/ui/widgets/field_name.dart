part of 'widgets.dart';

class FieldName extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;

  FieldName({this.text, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      child: Text(
        text,
        style: blackFont,
      ),
    );
  }
}
