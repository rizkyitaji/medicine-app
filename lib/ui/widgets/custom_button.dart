part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;
  final Function onTap;
  final Color color;
  final Color textColor;
  final borderColor;

  CustomButton({
    this.text,
    this.margin,
    this.onTap,
    this.color,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color ?? blue,
          onPrimary: textColor ?? white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text),
        onPressed: onTap,
      ),
    );
  }
}
