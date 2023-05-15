import 'package:critiqo3/component/builder/category_button.dart';
import 'package:critiqo3/component/builder/category_radio_button,dart.dart';
import 'package:critiqo3/component/builder/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'image_picker.dart';
import 'dart:io';

class ReviewInputField extends StatefulWidget {
  const ReviewInputField({Key? key}) : super(key: key);

  @override
  State<ReviewInputField> createState() => _ReviewInputFieldState();
}

class _ReviewInputFieldState extends State<ReviewInputField> {
  String placeType = '';
  String placeName = '';
  String category = '';
  String urlLink = '';
  String productName = '';
  String brand = '';
  String option = '';
  Image picture = Image.network('');
  String goodComment1 = '';
  String goodComment2 = '';
  String badComment1 = '';
  String badComment2 = '';
  int score = 0;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _urlLinkController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _optionController = TextEditingController();
  final TextEditingController _goodCommentController1 = TextEditingController();
  final TextEditingController _goodCommentController2 = TextEditingController();
  final TextEditingController _badCommentController1 = TextEditingController();
  final TextEditingController _badCommentController2 = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  final TextEditingController _storeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final CategoryDropDownButtonState categoryDropDownButtonState =
      CategoryDropDownButtonState();
  final CustomRadioButtonRowState customRadioButtonRowStage =
      CustomRadioButtonRowState();

  String formatPrice(String price) {
    final intValue = int.tryParse(price.replaceAll(',', ''));
    final formatter = NumberFormat('###,###,###원');
    if (price == null) {
      return '';
    }
    return formatter.format(int.parse(price));
  }

  String? _errorMessage;

  _inputLengthCheck() {
    final text = _goodCommentController1.text;
    if (text.length > 40) {
      setState(() => _errorMessage = '40자 이하로 입력해 주세요');
    } else {
      setState(() => _errorMessage = null);
    }
  }

  @override
  void initState() {
    super.initState();
    _goodCommentController1.addListener(_inputLengthCheck);
  }

  File? imageFile;
  final picker = ImagePicker();

  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          const Text(
            '제품/서비스를 구매하거나 사용한 날짜를 선택해주세요.',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const DatePicker(),
          const SizedBox(height: 40),
          const Text('상품/서비스를 사용한 경로를 선택해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
          const CustomRadioButtonRow(),
          const SizedBox(
            height: 40,
          ),
          const Text('상품/서비스의 카테고리를 선택해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
          const CategoryDropDownButton(),
          const SizedBox(height: 40),
          const Text(
            '참고사진 업로드 (선택사항)',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const ImagePickerScreen(),
          const SizedBox(height: 40),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '상호 또는 상점명',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _storeController,
                    keyboardType: TextInputType.multiline,
                    validator: (newValue) {
                      if (newValue == null) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '예 : 당근마켓 , 맥도날드 양재점',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        final String placeName = newValue;
                      });
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    '상품 및 서비스명',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _productNameController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '예 : 나랑드 사이다',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // productName
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('브랜드 또는 회사명',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _brandController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '예 : 동아오츠카',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // brand
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                      '상품의 자세한 옵션을 입력 해주세요. (선택)\n(예 : 색상,사이즈,무게,용량,재질 등)',
                      style: TextStyle(fontWeight: FontWeight.bold)), //
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _optionController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '예 : 검정색, 미디움, 알루미늄',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // option
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('URL',
                      style: TextStyle(fontWeight: FontWeight.bold)), //
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _urlLinkController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText:
                          'https://brand.naver.com/donga-otsuka/products/7436684963?N',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // urlLink
                  const SizedBox(height: 35),
                  const Text('금액',
                      style: TextStyle(fontWeight: FontWeight.bold)), //
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.multiline,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: '',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '182,000원',
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 10,
                    onChanged: (value) {
                      final formattedPrice = formatPrice(value);
                      if (value.length > 13) {
                        final previousValue =
                            formatPrice(_priceController.text);
                        _priceController.value = TextEditingValue(
                          text: previousValue,
                          selection: TextSelection.fromPosition(
                            TextPosition(offset: previousValue.length-1),
                          ),
                        );
                      } else if (formattedPrice != value) {
                        _priceController.value = TextEditingValue(
                          text: formattedPrice,
                          selection: TextSelection.fromPosition(
                            TextPosition(offset: formattedPrice.length-1),
                          ),
                        );
                      }
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // price
                  const SizedBox(height: 35),
                  const Text('상품/서비스에서 가장 만족한 두가지 중 첫번째를 알려주세요',
                      style: TextStyle(fontWeight: FontWeight.bold)), //
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _goodCommentController1,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (_errorMessage != null) {
                        return _errorMessage!;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '첫번째 좋은점',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _inputLengthCheck();
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // good1
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('상품/서비스에서 가장 만족한 두가지 중 두번째를 알려주세요.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _goodCommentController2,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '두번째 좋은점',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // good2
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('상품/서비스에서 가장 아쉬웠던 두가지 중 첫번째를 알려주세요.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _badCommentController1,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '첫번째 불만족',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // bad1
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('상품/서비스에서 가장 아쉬웠던 두가지 중 첫번째를 알려주세요.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _badCommentController2,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '두번째 불만족',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // bad2
                  const SizedBox(
                    height: 35,
                  ),
                  const Text('최종점수',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _scoreController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '필수 항목입니다';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: '점수 : 100점 만점 중 몇점인지 적어주세요',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ), // score
                ],
              )),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                categoryDropDownButtonState.saveSelectedGategory();
                customRadioButtonRowStage.saveSelectedDropDown();
              }
            },
            child: const Text('리뷰 업로드'),
          ),
          const SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final File? selectedImage;

  FullScreenImage({required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: Center(
        child: Image.file(selectedImage!, fit: BoxFit.cover),
      ),
    );
  }
}
