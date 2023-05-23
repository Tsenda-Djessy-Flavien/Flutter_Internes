import 'package:flutter/material.dart';

import 'package:flutter_internals/keys/todo_item.dart';

// model de données
class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  var _order = 'asc'; // pripriète qui peut être modifier

  // _order => qui defini dans quel ordre les todos seront affichées
  final _todos = [
    const Todo(
      'Learn Flutter',
      Priority.urgent,
    ),
    const Todo(
      'Practice Flutter',
      Priority.normal,
    ),
    const Todo(
      'Explore other courses',
      Priority.low,
    ),
  ];

  // trier la liste de todos à l'aide de la methode 'sort'
  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      // comparer les textes de todos entre eux
      final bComesAfterA = a.text.compareTo(b.text);
      // enuite comparer les todos pour effectuer une comparasion alphabetique
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  // modifier l'Etat de _order.
  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // for (final todo in _orderedTodos) TodoItem(todo.text, todo.priority),
              for (final todo in _orderedTodos)
                TodoItem(
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        ),
      ],
    );
  }
}