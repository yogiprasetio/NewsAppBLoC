part of 'shared.dart';

Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();
const secondaryColor = Color(0xFF6838F8);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);
TextStyle blackFontStyle6 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400);
TextStyle greyFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontSize: 22, fontWeight: FontWeight.w400);

const double defaultMargin = 24;
