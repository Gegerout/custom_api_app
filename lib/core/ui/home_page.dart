import 'package:custom_api_app/dummy/presentation/pages/edit_employee_page.dart';
import 'package:custom_api_app/dummy/presentation/pages/employees_page.dart';
import 'package:custom_api_app/reqres/presentation/pages/recources_page.dart';
import 'package:custom_api_app/reqres/presentation/pages/users_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [
    const EmployeesPage(),
    const UsersPage(),
    const ResourcesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentPage),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: "Employees"),
          NavigationDestination(icon: Icon(Icons.person), label: "Users"),
          NavigationDestination(icon: Icon(Icons.color_lens), label: "Resources")
        ],
        onDestinationSelected: (index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
      floatingActionButton: currentPage == 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditEmployeePage()));
        },
        child: const Icon(Icons.edit),
      ) : null,
    );
  }
}
