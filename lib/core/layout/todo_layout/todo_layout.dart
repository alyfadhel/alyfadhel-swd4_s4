import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/features/todo/archive/presentation/screens/archive_screen.dart';
import 'package:swd4_s4/features/todo/done/presentation/screens/done_screen.dart';
import 'package:swd4_s4/features/todo/new/presentation/screens/new_screen.dart';

class TodoLayout extends StatelessWidget {
  const TodoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataFromDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppInsertDataFromDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blue,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomShow) {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.insertDataFromDataBase(
                      title: cubit.titleController.text,
                      date: cubit.dateController.text,
                      time: cubit.timeController.text,
                    );
                    cubit.changeFabIcon(isShow: false, icon: Icons.edit);
                  }
                } else {
                  cubit.scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[300],
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MyFormField(
                                  controller: cubit.titleController,
                                  type: TextInputType.text,
                                  prefix: Icons.title,
                                  text: 'title',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Title must be not empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20.0),
                                MyFormField(
                                  controller: cubit.dateController,
                                  type: TextInputType.datetime,
                                  prefix: Icons.calendar_today,
                                  text: 'date',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date must be not empty';
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2025-12-31'),
                                    ).then((value) {
                                      if (value != null) {
                                        cubit.dateController.text =
                                            DateFormat.yMMMd().format(value);
                                        debugPrint(
                                          DateFormat.yMMMd().format(value),
                                        );
                                      }
                                    });
                                  },
                                ),
                                SizedBox(height: 20.0),
                                MyFormField(
                                  controller: cubit.timeController,
                                  type: TextInputType.datetime,
                                  prefix: Icons.watch_later_outlined,
                                  text: 'time',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Time must be not empty';
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      if (value != null) {
                                        if (context.mounted) {
                                          cubit.timeController.text = value
                                              .format(context);
                                          debugPrint(value.format(context));
                                        }
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                        cubit.changeFabIcon(isShow: false, icon: Icons.edit);
                      });
                  cubit.changeFabIcon(isShow: true, icon: Icons.add);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: Colors.blue,
              child: Icon(cubit.fabIcon, color: Colors.white),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
