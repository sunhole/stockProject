# stockProject

프로젝트 소개
프로젝트명: MVVM + RxSwift 기반 실시간 주식 정보 앱

개발 기간: 2.5일

주요 목표: 현대자동차 채용 공고의 핵심 요구사항인 RxSwift와 MVVM 아키텍처에 대한 깊은 이해도를 보여주는 데 중점을 둔 프로젝트입니다.

2. 사용된 기술 스택
Language: Swift

Architecture: MVVM (Model-View-ViewModel)

Frameworks: UIKit (코드로 UI 구성), RxSwift, RxCocoa, Alamofire

Package Manager: Swift Package Manager (SPM)

3. 핵심 기능
관심 종목 추가/삭제: 사용자가 원하는 주식 종목을 검색하여 리스트에 추가하거나 삭제할 수 있습니다.

실시간 데이터 업데이트: 외부 API를 호출하여 관심 종목의 현재 가격, 등락률 등 데이터를 실시간으로 업데이트합니다.

상세 정보 보기: 종목을 탭하면 상세 정보를 보여주는 화면으로 전환됩니다.

4. 기술적 도전과 해결
RxSwift 도입: MVVM 패턴과 결합하여 데이터와 UI를 효율적으로 바인딩하고, 비동기 데이터 처리 로직을 선언적으로 구현했습니다. 복잡한 콜백 지옥을 피하고, 코드의 가독성을 높일 수 있었습니다.

API 통신 오류 처리: 네트워크 연결 끊김, 서버 응답 오류 등 다양한 예외 상황을 RxSwift의 연산자(catch, retry)를 활용해 안정적으로 처리했습니다.

상태 관리: ViewModel에서 데이터의 로딩 상태, 오류 상태 등을 관리하여 View가 오직 ViewModel의 상태 변화에만 반응하도록 구현했습니다.

5. 프로젝트를 통해 배운 점
Rx 패턴 숙련: RxSwift를 실무 수준으로 적용하며 반응형 프로그래밍에 대한 이해를 높였습니다.

아키텍처 설계: 대규모 프로젝트에서도 유지보수와 확장이 용이한 MVVM 아키텍처의 장점을 직접 경험했습니다.
