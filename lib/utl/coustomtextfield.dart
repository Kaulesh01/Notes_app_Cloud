import 'package:flutter/material.dart';

class coustomtextfeild extends StatefulWidget {
  coustomtextfeild({
    required this.controller,
    this.hint,
    this.textFocusNodeEmail,
  });
  final TextEditingController controller;
  final String? hint;

  final FocusNode? textFocusNodeEmail;

  @override
  State<coustomtextfeild> createState() => _coustomtextfeildState();
}

class _coustomtextfeildState extends State<coustomtextfeild> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: <Widget>[
            Flexible(
                child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              autofocus: false,
              focusNode: widget.textFocusNodeEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: widget.controller,
              onSaved: (newValue) {
                widget.controller.text = newValue!;
              },
              decoration: InputDecoration(
                hintText: widget.hint,
                border: InputBorder.none,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class coustomtextfeild_password extends StatefulWidget {
  coustomtextfeild_password({
    required this.controller,
    this.hint,
    this.obscureText,
  });
  final TextEditingController controller;
  final String? hint;
  late bool? obscureText;

  @override
  State<coustomtextfeild_password> createState() =>
      _coustomtextfeild_passwordState();
}

class _coustomtextfeild_passwordState extends State<coustomtextfeild_password> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: TextFormField(
                obscureText: widget.obscureText!,
                controller: widget.controller,
                onSaved: (newValue) {
                  widget.controller.text = newValue!;
                },
                decoration: InputDecoration(
                    hintText: widget.hint, border: InputBorder.none),
              ),
            ),
            Flexible(
              child: IconButton(
                icon: Icon(widget.obscureText!
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
