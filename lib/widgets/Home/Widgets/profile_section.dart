import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProfilePicture(),
        // _ProfileInformation(),
      ],
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 250, maxWidth: 380),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        /*child: Image.network(
          "https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365",
        ),*/
        child: CachedNetworkImage(
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365",
          /*progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),*/
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.grey.shade500,
                  Colors.grey.shade400,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                  Colors.grey.shade100,
                  Colors.white,
                ],
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

//! Under Implementation
class _ProfileInformation extends StatelessWidget {
  const _ProfileInformation();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(minWidth: 350),
      color: Colors.red,
      child: Flexible(
        child: Expanded(
          child: Table(
            defaultColumnWidth: const IntrinsicColumnWidth(),
            border: TableBorder.all(),
            children: const [
              TableRow(
                children: <TableCell>[
                  TableCell(child: Center(child: Text("Role"))),
                  TableCell(child: Center(child: Text("Administrator"))),
                ],
              ),
              TableRow(
                children: <TableCell>[
                  TableCell(child: Center(child: Text("Role"))),
                  TableCell(child: Center(child: Text("Administrator"))),
                ],
              ),
              TableRow(
                children: <TableCell>[
                  TableCell(child: Center(child: Text("Role"))),
                  TableCell(child: Center(child: Text("Administrator"))),
                ],
              ),
              TableRow(
                children: <TableCell>[
                  TableCell(child: Center(child: Text("Role"))),
                  TableCell(child: Center(child: Text("Administrator"))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
