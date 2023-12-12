import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MyCallback = void Function(int param);

class NumberBox extends StatefulWidget {
  final int min;
  final int defaultValue;
  final bool disabledInput;
  final MyCallback onChange;

  const NumberBox({
    Key? key,
    required this.onChange,
    this.defaultValue = 1,
    this.min = 1,
    this.disabledInput = true,
  }) : super(key: key);

  @override
  _NumberBoxState createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  TextEditingController _controller = TextEditingController();
  int currentValue = 1;

  @override
  void didUpdateWidget(covariant NumberBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentValue = widget.defaultValue;
    _controller.text = widget.defaultValue.toString();
  }

  @override
  void initState() {
    super.initState();
    currentValue = widget.defaultValue;
    _controller.text = widget.defaultValue.toString(); // 初始化文本为最小值
  }

  void _increment() {
    currentValue = int.parse(_controller.text);
    setState(() {
      currentValue++;
      widget.onChange(currentValue);
      _controller.text = currentValue.toString(); // 更新文本字段的值
    });
  }

  void _decrement() {
    currentValue = int.parse(_controller.text);

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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _decrement();
          },
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Icon(
              Icons.remove_circle_outline,
              color: Color(0xff999999),
              size: 58.w,
            ),
          ),
        ),

        // 如果你想禁止用户输入，可以将 TextField 替换为 Text
        Container(
          alignment: Alignment.center,
          width: 58.h,
          height: 58.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: Color.fromRGBO(102, 102, 102, 0.3),
            ),
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Text(
            currentValue.toString(),
            style: TextStyle(
              fontSize: 28.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _increment();
          },
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Icon(Icons.add_circle_outline,
                color: Color(0xff999999), size: 58.w),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 不要忘记释放控制器资源
    super.dispose();
  }
}
