import 'package:exam_time_tracker/core/constants/app_strings.dart';
import 'package:exam_time_tracker/core/state/current_state.dart';
import 'package:exam_time_tracker/features/page_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentState = Provider.of<CurrentState>(context);
    final pages = PageProvider.pages(context);
    final strings = AppStrings(context);

    final currentPage = pages[currentState.currentIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage.title),
        centerTitle: true,
      ),

      body: currentPage.page,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentState.currentIndex,
        onTap: (index) => currentState.setPage(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: strings.history),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: strings.home),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: strings.settings),
        ],
      ),
    );
  }
}