part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction action;
  final TextInputType inputType;
  final TextCapitalization caps;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double width;
  final String hintText;
  final int maxLines;
  final String type;

  CustomTextField({
    this.controller,
    this.action = TextInputAction.next,
    this.inputType,
    this.caps = TextCapitalization.none,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.width = double.infinity,
    this.hintText,
    this.maxLines = 1,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      init: TextFieldController(),
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              margin: EdgeInsets.only(
                left: marginLeft,
                top: marginTop,
                right: marginRight,
                bottom: marginBottom,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: controller,
                obscureText: type == 'password' ? state.obscureText : false,
                textInputAction: action,
                textCapitalization: caps,
                keyboardType: inputType,
                maxLines: maxLines,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: greyFont,
                  suffixIcon: type == 'password'
                      ? InkWell(
                          onTap: () {
                            if (state.obscureText) {
                              state.obscureText = false;
                            } else {
                              state.obscureText = true;
                            }
                            state.update();
                          },
                          child: Icon(
                            state.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: black,
                          ),
                        )
                      : SizedBox(),
                  suffixIconConstraints: BoxConstraints(),
                  contentPadding: EdgeInsets.fromLTRB(
                      0, 10, type == 'password' ? 10 : 0, 10),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    state.isValid = true;
                    state.update();
                  }
                },
              ),
            ),
            !state.isValid && state.type == type
                ? errorText(state.message)
                : SizedBox()
          ],
        );
      },
    );
  }

  Widget errorText(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          SizedBox(width: marginLeft),
          Icon(Icons.error, color: red, size: 12),
          SizedBox(width: 4),
          Text(
            text,
            style: redFont.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
