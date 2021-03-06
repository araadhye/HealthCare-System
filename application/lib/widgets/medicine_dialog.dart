import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_ui/widgets/medicine_timeslot.dart';
import 'package:sizer/sizer.dart';


class _MedicineDialog extends StatefulWidget {

  const _MedicineDialog({Key? key}) : super(key: key);

  @override
  State<_MedicineDialog> createState() => __MedicineDialogState();
}

class __MedicineDialogState extends State<_MedicineDialog> {

  String? countValue;
  final DateTime _selectedDate = DateTime.now();

  Widget _buildMedicineTimeSlotRow() {
    if (countValue == null) return const SizedBox(height: 0);
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < int.parse(countValue!); ++i)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w,),
                child: const MedicineTimeSlot(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: const NeumorphicBoxShape.stadium(),
        ),
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: const TextField(
          decoration: InputDecoration.collapsed(hintText: 'name'),
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 3.w),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: const NeumorphicBoxShape.stadium(),
        ),
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: const TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration.collapsed(hintText: 'description'),
          maxLines: 3,
        ),
      ),
    );
  }

  Widget _buildDateTimeRow() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NeumorphicButton(
              onPressed: ()   {
                setState(() {
                  showDatePicker(context: context, initialDate: _selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
                });
              },
              style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.flat,
              ),
              child: FaIcon(FontAwesomeIcons.calendarPlus, size: 4.5.w, color: Colors.deepPurple),
            ),
            SizedBox(width: 2.w),
            Text("Choose Dates", style: GoogleFonts.roboto(
              fontSize: 8.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
            ),
            const Spacer(),
            Neumorphic(
                child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      onChanged: (String? value){
                        setState(() {
                          countValue = value;
                        });
                      },
                      customButton: const FaIcon(FontAwesomeIcons.circleArrowDown, color: Colors.deepPurple),
                      items: ['1', '2', '3', '4'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child:   Text(val),
                          );
                        },
                      ).toList(),
                      itemHeight: 2.5.h,
                      dropdownElevation: 2.4.h.floor(),
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                          color: Colors.white60,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white70,
                              spreadRadius: .05.h,
                              blurRadius: .2.h,
                              offset: Offset(.1.h, -.3.h),
                              blurStyle: BlurStyle.normal,
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: .1.h,
                              blurRadius: .8.h,
                              offset: Offset(.8.h, .8.h),
                              blurStyle: BlurStyle.normal,
                            )
                          ]
                      ),
                      dropdownWidth: 12.w,
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.5.w, right: 1.w),
              child: Text(
                "times",
                style: GoogleFonts.roboto(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.h)),
        child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5.h)),
          ),
          child: Container(
            height: 50.h,
            width: 75.w,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeumorphicButton(
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle()
                  ),
                  child: const FaIcon(FontAwesomeIcons.arrowLeft),
                ),

                _buildNameField(),
                const Spacer(),
                _buildDateTimeRow(),
                const Spacer(),
                _buildMedicineTimeSlotRow(),
                const Spacer(),
                _buildDescriptionField(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicButton(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(1.h)),
                          color: Colors.lightBlue,
                        ),
                        onPressed: (){},
                        child: SizedBox(
                          height: 3.h,
                          width: 20.w,
                          child: Center(
                            child: Text(
                                "Save",
                                style: GoogleFonts.poppins(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                )
                            ),
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

Future<dynamic> buildDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const _MedicineDialog();
      }
  );
}

