import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmSlidingFormView extends StatefulWidget {
  const LtfmSlidingFormView({Key? key}) : super(key: key);

  Widget build(context, LtfmSlidingFormController controller) {
    controller.view = this;
    TextEditingController _datenew = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmSlidingForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                width: controller.submitted
                    ? 160
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Apply Leave",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //! 1. buat datepicker, atur label-nya menjadi
                      //? "Leave Date"
                      TextField(
                        controller: _datenew,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          labelText: 'Leave Date',
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050),
                          );
                          if (pickedDate != null) {
                            print(pickedDate);
                            _datenew.text =
                                DateFormat('dd MMM yyyy').format(pickedDate);
                          }
                        },
                      ),

                      //! 2. Buat textarea, atur label-nya menjadi
                      //? "Reason"
                      TextField(
                        maxLines: 4,
                        maxLength: 400,
                        decoration: InputDecoration(
                          labelText: 'Reason',
                        ),
                      ),
                      //! 3. Tambahkan Divider
                      Divider(),
                      //! 4. Buat sebuah tombol:
                      //? width: MediaQuery.of(context).size.width,
                      //? height: 40

                      //! 5. Ketika di klik, tambahkan kode ini:
                      /*
                        controller.submitted = !controller.submitted;
                        controller.update();
                      */
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                            child: Text('Save'),
                            onPressed: () {
                              controller.submitted = !controller.submitted;
                              controller.update();
                            }),
                      )

                      //! 6. Jika Container mengecil ketika tombol di klik
                      //? maka task ini selesai!
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmSlidingFormView> createState() => LtfmSlidingFormController();
}
