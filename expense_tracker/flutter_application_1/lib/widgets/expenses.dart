import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/widgets/expenses_list/expense_item.dart';
import 'package:flutter_application_1/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_application_1/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Expense Deleted"),
        action: SnackBarAction(label: "Undo", onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
        ),
      ),
    );
  }

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Pizza',
      amount: 3.50,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Bus ticket',
      amount: 3.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No expeenses. Click + to add one"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? 
      Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ) :
      Row(children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent),
      ],)
    );
  }
}