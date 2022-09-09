import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stockkkkkk/application/adapters/tests/test_main.mocks.dart';
import 'package:stockkkkkk/domain/dto/stockDTO.dart';
import 'package:stockkkkkk/infra/adapters/tests/data_service.dart';

// import 'test_main.mocks.dart' as mock;

@GenerateMocks([DataService])
void main() {
  test("Verify get returns values", () async {
    var storeMock = MockDataService();
    var service = DataService();

    var saveValue = StockDTO(1, "Teste", 2);
    service.save(saveValue);

    var expected = <StockDTO>[saveValue];

    when(storeMock.findAll()).thenAnswer((_) => Future.value(expected));

    var dataFound = await service.findAll();

    expect(dataFound.first == expected.first, true);
    // verify(storeMock.findAll()).called(1);
  });
}
