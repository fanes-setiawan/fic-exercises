import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmFilterBottomSheetView extends StatefulWidget {
  const LtfmFilterBottomSheetView({Key? key}) : super(key: key);

  Widget build(context, LtfmFilterBottomSheetController controller) {
    controller.view = this;
    TextEditingController _date = TextEditingController();
    TextEditingController _date1 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmFilterBottomSheet"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.tune),
                label: const Text("Filter"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  //! 1. Buat datepicker:
                                  //? datepicker: "From"
                                  //? datepicker: "To"
                                  //! 2. Buat tombol dengan label "FILTER"
                                  //! 3. Ketika di klik, panggil Navigator.pop(context)
                                  TextField(
                                    controller: _date,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_month),
                                      labelText: 'For',
                                    ),
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2050),
                                      );
                                      if (pickedDate != null) {
                                        _date.text = DateFormat('dd MMM yyyy')
                                            .format(pickedDate);
                                      }
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 20.0)),
                                  TextField(
                                    controller: _date1,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_month),
                                      labelText: 'To',
                                    ),
                                    onTap: () async {
                                      DateTime? pinkedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(2050));
                                      if (pinkedDate != null) {
                                        _date1.text = DateFormat('dd MMM yyyy')
                                            .format(pinkedDate);
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        child: Text('Filter'),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmFilterBottomSheetView> createState() =>
      LtfmFilterBottomSheetController();
}
