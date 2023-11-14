// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ChangeProfileData extends StatelessWidget {
  const ChangeProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: const SingleChildScrollView(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsWidget(
                      ExpansionPanelTile: 'Change Your Phone Number',
                      ExpansionPanelContent: Text("Hello 1"),
                    ),
                    DetailsWidget(
                      ExpansionPanelTile: 'Change Your Username',
                      ExpansionPanelContent: Text("Hello 1"),
                    ),
                    DetailsWidget(
                      ExpansionPanelTile: 'Change Your Password',
                      ExpansionPanelContent: Text("Hello 1"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsWidget extends StatefulWidget {
  final String ExpansionPanelTile;
  final Widget ExpansionPanelContent;

  const DetailsWidget({
    super.key,
    required this.ExpansionPanelTile,
    required this.ExpansionPanelContent,
  });

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String title = widget.ExpansionPanelTile;
    Widget content = widget.ExpansionPanelContent;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionPanelList(
            elevation: 2,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                this.isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool _) {
                  return ListTile(
                      title: Text(title),
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      });
                },
                body: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      color: Colors.amber[900],
                      child: content,
                    ),
                  ],
                ),
                isExpanded: isExpanded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
