import 'package:flutter/material.dart';


typedef MyCallback = void Function(int param);

class NumberBox extends StatefulWidget {
  final int min;
  final bool disabledInput;
  final MyCallback onChange;


  const NumberBox({
    Key? key,
    required this.onChange,
    this.min = 1,
    this.disabledInput = true,
  }) : super(key: key);

  @override
  _NumberBoxState createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.min.toString(); // 初始化文本为最小值
  }

  void _increment() {
    int currentValue = int.parse(_controller.text);

    setState(() {

      currentValue++;
      widget.onChange(currentValue);
      _controller.text = currentValue.toString(); // 更新文本字段的值
    });
  }

  void _decrement() {
    int currentValue = int.parse(_controller.text);

    if (currentValue > widget.min) {
      setState(() {
        currentValue--;
        widget.onChange(currentValue);
        _controller.text = currentValue.toString(); // 更新文本字段的值
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove_circle_outline, color: Color(0xff333333)),
          onPressed: _decrement,
        ),
        // 如果你想禁止用户输入，可以将 TextField 替换为 Text
        widget.disabledInput
            ? Text(_controller.text)
            : Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide:BorderSide(color: Color(0xff333333), width: 1.0)),
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onChanged: (value) {
                    // 可以在这里添加额外的逻辑来处理输入值
                  },
                ),
              ),
        IconButton(
          icon: Icon(Icons.add_circle_outline, color: Color(0xff333333)),
          onPressed: _increment,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 不要忘记释放控制器资源
    super.dispose();
  }
}
