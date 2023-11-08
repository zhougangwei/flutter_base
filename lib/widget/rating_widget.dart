import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final double initialRating;
  final double size;

  RatingWidget({this.size = 24.0, required this.initialRating});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void _handleRatingChanged(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          child: Icon(
            index < _rating.floor() ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: widget.size,
          ),
        );
      }),
    );
  }
}
