      // ElevatedButton(
                  //   onPressed: () async {
                  //     DbUtils dbUtils = await DbUtils.singlrTonClass();
                  //     List<Student> l = await dbUtils.getdata(low: false);
                  //     setState(() {
                  //       Currentstudent = l;
                  //     });
                  //   },
                  //   child: Text(
                  //     "Lowest Mark",
                  //     style: TextStyle(
                  //         color: const Color.fromARGB(255, 2, 137, 248)),
                  //   ),
                  //   style: ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStateProperty.all(Colors.blue[50])),
                  // ),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       DbUtils dbUtils = await DbUtils.singlrTonClass();
                  //       List<Student> l = await dbUtils.getdata();
                  //       setState(() {
                  //         Currentstudent = l;
                  //       });
                  //     },
                  //     child: Text(
                  //       "Rifresh",
                  //       style: TextStyle(
                  //           color: const Color.fromARGB(255, 2, 138, 250)),
                  //     ),
                  //     style: ButtonStyle(
                  //         backgroundColor:
                  //             MaterialStateProperty.all(Colors.blue[50]))),




// date time function

                   // DateTime? selectDate;

  // Future selectBirthDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectDate ?? DateTime.now(),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectDate) {
  //     setState(() {
  //       selectDate = picked;
  //     });
  //   }
  // }


    // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: GestureDetector(
            //     onTap: () => selectBirthDate(context),
            //     child: AbsorbPointer(
            //       child: TextField(
            //         keyboardType: TextInputType.datetime,
            //         controller: BODController,
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           label: Text('Birth Of Date'),
            //           suffixIcon: Icon(Icons.calendar_today),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),