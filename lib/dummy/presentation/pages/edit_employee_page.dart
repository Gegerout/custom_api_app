import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/employees_provider.dart';

class EditEmployeePage extends ConsumerWidget {
  EditEmployeePage({Key? key}) : super(key: key);

  final PageController pageController = PageController();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController salaryCont = TextEditingController();
  final TextEditingController ageCont = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit employee"),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: TextField(
                    onSubmitted: (value) {
                      if(value.isNotEmpty) {
                        pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Employee id",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                  ),
                ),
              ),
              const Center(child: Text("Don't have id?")),
              FilledButton(onPressed: () {
                showBottomSheet(context: context,
                    constraints: const BoxConstraints(
                      maxHeight: 500
                    ),
                    builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                nameCont.text = value;
                              });
                              ref.read(editEmployeeController.notifier).checkEmployeeCreate(value, salaryCont.text, ageCont.text);
                            },
                            decoration: InputDecoration(
                                hintText: "Employee name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                salaryCont.text = value;
                              });
                              ref.read(editEmployeeController.notifier).checkEmployeeCreate(nameCont.text, value, ageCont.text);
                            },
                            decoration: InputDecoration(
                                hintText: "Employee salary",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                ageCont.text = value;
                              });
                              ref.read(editEmployeeController.notifier).checkEmployeeCreate(nameCont.text, salaryCont.text, value);
                            },
                            decoration: InputDecoration(
                                hintText: "Employee age",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Consumer(builder: (context, watch, child) {
                          if(ref.watch(editEmployeeController).isValid) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: FilledButton(onPressed: () {
                                ref.read(editEmployeeController.notifier).createEmployee(nameCont.text, salaryCont.text, ageCont.text);
                                Navigator.pop(context);
                              }, child: const Text("Create", style: TextStyle(fontSize: 20),)),
                            );
                        }
                          else {
                            return const Padding(
                              padding: EdgeInsets.all(20),
                              child: FilledButton(onPressed: null, child: Text("Create", style: TextStyle(fontSize: 20),)),
                            );
                          }
                        })
                      ],
                    ),
                  );
                });
              }, child: const Text("Create"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                onSubmitted: (value) {
                  if(value.isNotEmpty) {
                    pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                  }
                },
                decoration: InputDecoration(
                    hintText: "Employee name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                onSubmitted: (value) {
                  if(value.isNotEmpty) {
                    pageController.animateToPage(3, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                  }
                },
                decoration: InputDecoration(
                    hintText: "Employee salary",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Employee age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
            ),
        ],
      )
    );
  }
}
