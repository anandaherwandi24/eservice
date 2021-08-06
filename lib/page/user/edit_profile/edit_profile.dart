import 'dart:convert';
import 'dart:io';

import 'package:e_service/models/constanta.dart';
import 'package:e_service/models/usermodel.dart';
import 'package:e_service/page/user/edit_profile/constans.dart';
import 'package:e_service/page/user/edit_profile/succes_page.dart';
import 'package:e_service/service/apiresponse.dart';
import 'package:e_service/service/userdataservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

// import 'list_item.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilepageState createState() => _EditProfilepageState();
  // This widget is the root of your application.
}

class _EditProfilepageState extends State<EditProfilePage> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _handphoneController = new TextEditingController();
  ApiResponse apiResponse;
  int selectedIndex = 0;

  Usermodel usermodel = new Usermodel();
  String key_id = "0";
  bool isLoading = true;
  File _imagefile;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": key_id,
    };
    var requestBody = jsonEncode(map);
    UserdataServices.getdatauser(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        usermodel = Usermodel.fromJson(result.content);
        _nameController.text = usermodel.name;
        _emailController.text = usermodel.email;
        _handphoneController.text = usermodel.handphone;
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }

  // uploadimage() async {
  //   try {
  //     var stream =
  //         http.ByteStream(DelegatingStream.typed(_imagefile.openRead()));
  //     var length = await _imagefile.length();
  //     var uri = Uri.parse(Constanta.updateuser);
  //     var request = http.MultipartRequest("POST", uri);

  //     request.files.add(http.MultipartFile("image", stream, length,
  //         filename: path.basename(_imagefile.path)));
  //     var response = await request.send();
  //     print(response);
  //     if (response.statusCode > 2) {
  //       print("image upload");
  //       setState(() {
  //         Navigator.pop(context);
  //       });
  //     } else {
  //       print("image failed");
  //     }
  //   } catch (e) {
  //     debugPrint("Error $e");
  //   }
  // }

  void updatedatauser() {
    String id;
    id = usermodel.id;
    Map map = {
      "id": id,
      "name": _nameController.text,
      "email": _emailController.text,
      "handphone": _handphoneController.text,
    };
    var requestBody = jsonEncode(map);
    print(_imagefile.path);
    UserdataServices.updatedatauser(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SucceseditScreen()),
        );
      } else {
        _handledVerifError(
            "Failed to Send Verification Code, message: " + result.message);
      }
    }).catchError((error) {
      _handledVerifError(
          "Failed to Send Verification Code, message: " + error.toString());
    });
    print(requestBody);
  }

  void _handledVerifError(String errorMessage) {
    print(errorMessage);
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  _pilihGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920.0, maxWidth: 1000.0);
    setState(() {
      _imagefile = image;
    });
  }

  _pilihCamera() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 1920.0, maxWidth: 1000.0);
    setState(() {
      _imagefile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w),
            child: Stack(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _pilihCamera();
                  },
                  child: CircleAvatar(
                    radius: kSpacingUnit.w * 5,
                    backgroundImage: _imagefile == null
                        ? AssetImage('image/ic_orang.png')
                        : FileImage(_imagefile),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    final name = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Full Name',
                prefixIcon: Icon(
                  Icons.perm_identity_sharp,
                  color: Colors.green,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ));

    final email = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.green,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ));
    final phone = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "phone",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            TextFormField(
              controller: _handphoneController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'phone',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: Colors.green,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ));

    final save = Padding(
      padding: EdgeInsets.only(left: 100, right: 100),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          updatedatauser();
        },
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        color: Colors.green,
        child:
            Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          ListView(
            // key: _formkey,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            children: <Widget>[
              SizedBox(height: kSpacingUnit.w * 5),
              header,
              SizedBox(height: kSpacingUnit.w * 2),
              name,
              SizedBox(height: kSpacingUnit.w * 2),
              email,
              SizedBox(height: kSpacingUnit.w * 2),
              phone,
              SizedBox(height: kSpacingUnit.w * 4),
              save,
            ],
          ),
        ],
      ),
    );
  }
}
