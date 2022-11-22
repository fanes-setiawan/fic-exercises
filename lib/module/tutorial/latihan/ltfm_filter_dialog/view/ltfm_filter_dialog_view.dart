import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmFilterDialogView extends StatefulWidget {
  const LtfmFilterDialogView({Key? key}) : super(key: key);

  Widget build(context, LtfmFilterDialogController controller) {
    controller.view = this;
    TextEditingController dateInputController = TextEditingController();
    TextEditingController dateInputController1 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmFilterDialog"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey[500],
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              initialValue: null,
                              decoration: InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: "What are you craving?",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                hoverColor: Colors.transparent,
                              ),
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.tune),
                      label: const Text("Filter"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () async {
                        await showDialog<void>(
                          context: context,
                          builder: (BuildContext) {
                            return AlertDialog(
                              title: const Text('Filter'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'For',
                                        suffixIcon: Icon(Icons.calendar_today)
                                      ),
                                      controller: dateInputController,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2050));

                                        if (pickedDate != null) {
                                          dateInputController.text = DateFormat('dd-MMM-yyyy').format(pickedDate);
                                        }
                                      },
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'TO',
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      controller: dateInputController1,
                                      onTap: () async{
                                        DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2050)
                                        );
                                        if(pickedDate != null){
                                          dateInputController1.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Filter'),
                                ),
                              ],
                            );
                          },
                        );
                        //! 1. Tampilkan dialog, gunakan kode ini:
                        /*
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Filter'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Filter"),
                                ),
                              ],
                            );
                          },
                        );
                        */
                        //! 2. Di dalam children dari ListBody,
                        //! Tambahkan field2 ini:
                        //? datepicker dengan label "from"
                        //? datepicker dengan label "to"
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmFilterDialogView> createState() => LtfmFilterDialogController();
}
