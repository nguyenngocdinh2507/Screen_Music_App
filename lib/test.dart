import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expandable Text Example'),
        ),
        body: Center(
          child: ExpandableText(
            text: 'This is a very long text that should be initially displayed in a short form and expand when clicked.',
          ),
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({required this.text});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isExpanded ? widget.text : _getShortText(widget.text),
            style: TextStyle(fontSize: 16),
          ),
          if (!_isExpanded)
            Text(
              '...read more',
              style: TextStyle(color: Colors.blue),
            ),
        ],
      ),
    );
  }

  String _getShortText(String text) {
    const int limit = 50;
    return text.length > limit ? text.substring(0, limit) : text;
  }
}
