#Qr_flutter_app_with_xml_dataBase


##NOTE:
###IN ORDER FOR THE APP TO WORK PROPERLY, YOU NEED TO USE THE SCANNER WITH MY  GENERATED QR CODE IN THE FILE /images/qr/

SEE BELLOW FOR MORE DETAILS

![316312651_1367797493961830_4907080402489578174_n](https://user-images.githubusercontent.com/76242620/203385328-0e40aaa0-04fb-4f52-b05e-e3f7754b5435.jpg)



![315350140_446234607647458_2687135081932474930_n](https://user-images.githubusercontent.com/76242620/203384882-308347f9-882a-493e-9925-7a4598b23464.jpg)


![316397928_1728821144156688_225265145874692515_n](https://user-images.githubusercontent.com/76242620/203385362-c9eec002-b03b-4640-84ea-ad6d3a213c5b.jpg)



The problem above is because of that my own qr code  consists of five lines so the scan.dart class  after scanning the code  navigate to the form.dart page and write immediately 5 line of my qr code result in the 5 textField in the form.dart page in the same order, So it may throw some errors if the result was less or grater than five lines (However, you can change that with your specific qr code or general scanning)

trim five lines of the result and pass theme as a Parameters to the form page(the result need to consists of five lines or it will throw error)

![scan_push](https://user-images.githubusercontent.com/76242620/203383961-329fcc22-cdae-43c7-9e62-7635e86207a5.png)
