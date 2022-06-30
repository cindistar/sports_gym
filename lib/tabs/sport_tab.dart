import 'package:abas_flutter/models/sport.dart';
import 'package:abas_flutter/resources/strings.dart';
import 'package:flutter/material.dart';

class SportTab extends StatelessWidget {
  final Sport sport;
  const SportTab({Key? key, required this.sport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.network(
            sport.cover,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              return loadingProgress != null ? const Center(child: CircularProgressIndicator()) : child;
            },
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          flex: 2,
          child: cardSection(theme, Strings.news),
        ),
        const SizedBox(height: 15),
        Expanded(
          flex: 2,
          child: cardSection(theme, Strings.videos),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Padding cardSection(ThemeData theme, String header) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            header,
            style: theme.textTheme.subtitle1,
          ),
          Expanded(
            child: Row(
              children: List.generate(
                4,
                (index) {
                  return Expanded(
                    child: Card(
                      child: Center(
                        child: Text('$index'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
