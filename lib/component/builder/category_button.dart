import 'package:flutter/material.dart';

class ReviewFilter extends StatefulWidget {
  ReviewFilter({Key? key}) : super(key: key);

  @override
  State<ReviewFilter> createState() => _ReviewFilterState();
  final List<String> _filterKeywordList = [
    '의류/패션',
    '마트/편의점',
    '자동차',
    '음식점',
    '취미',
    '부동산',
    '뷰티/미용',
    '공공기관',
    '스포츠/레처/취미',
    '반려동물',
    '의료/건강',
    '전자제품',
    '유아/아동',
    'Social/채팅',
    '생산성/유틸리티',
    '친환경/ESG',
    '비건/비건식품',
    '가구/인테리어',
    '문구/완구',
    '도서',
    '주방',
    '여행/숙박',
    '식품',
    '금융/재테크',
    '게임',
    '생활용품',
    '기타'
  ];
}

class _ReviewFilterState extends State<ReviewFilter> {
  final List<String> _selectedFilters = [];

  String _selectedFiltersString() {
    return _selectedFilters.join(', ');
  }

  void _applyFilters() {
    final selectedKeywords = _selectedFiltersString();
    // TODO: 선택된 키워드를 검색 키워드로 할당해주는 작업을 구현하세요.
    print('Selected filters: $selectedKeywords');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.filter_alt),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '필터 선택',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 580,
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: ReviewFilter()._filterKeywordList.map((filter) {
                  return CheckboxListTile(
                    title: Text(
                      filter,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _selectedFilters.contains(filter),
                    onChanged: (selected) {
                      setState(() {
                        if (selected == true) {
                          _selectedFilters.add(filter);
                        } else {
                          _selectedFilters.remove(filter);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                _applyFilters();
                Navigator.of(context).pop(_selectedFilters);
              },
              child: const Text('적용'),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDropDownButton extends StatefulWidget {
  const CategoryDropDownButton({super.key});
  @override
  State<CategoryDropDownButton> createState() => CategoryDropDownButtonState();
}
class CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  String? dropdownValue;

  void saveSelectedGategory() {
    final selectedCategory = dropdownValue;
    // TODO: 선택된 카테고리를 검색 카테고리로 할당해주는 작업을 구현하세요.
    print('Selected category: $selectedCategory');
  }


  @override
  Widget build(BuildContext context) {
    final reviewfilter = ReviewFilter();
    final List<String> uniqueFilterKeywords =
        reviewfilter._filterKeywordList.toSet().toList();
    return Column(
      children: [
        DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            hint: Text('상품의 카테고리를 선택해주세요'),
            underline: Container(
              height: 1,
              color: Colors.blueAccent,
            ),
            items: uniqueFilterKeywords
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              dropdownValue = newValue!;
              setState(() {});
            })
      ],
    );
  }
}
