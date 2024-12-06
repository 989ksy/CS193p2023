## Model and UI

- MVVM이란 UI에서 로직과 데이터를 분리하는 것. (디자인 패러다임)
- **Model**
    - 로직과 데이터는 모델로 칭함.
- **UI**
  - UI는 보여주는 부분을 칭함.
- SwiftUI는 모델의 값이 바뀌어서 UI가 변경 되었을 때 UI를 다시 그리도록 하고 있음.

### Connecting the Model to the UI

- 뷰에서 모델을 그냥 @State로 사용함. (최소 분리)
    - 간단한 데이터를 다루거나 로직이 거의 없을 경우 좋은 선택지
- “View Model”을 통해서 모델에 접근토록 함. (완전 분리)
    - SQL + Struct(s) + Something else으로 이루어질 경우 좋은 선택지
    - 완전분리와 같은 아키텍처를 MVVM이라고 함.
- View Model이 있으나, 여전히 모델에 직접적으로 접근할 수 있음 (부분 분리)
    - 하이브리드 형식에 가까운데, 앱이 커지면 유지보수가 힘들어서 추천하는 방식은 아님.

## MVVM
<img width="1171" alt="스크린샷 2024-12-06 오후 5 10 35" src="https://github.com/user-attachments/assets/db2cf8a6-d750-407a-946d-ad8116d90ca6">

- Model
    - UI 에서 독립적임
    - 데이터 + 로직으로 구성
- View
    - 모델 반영
    - 무상태
    - 선언적
    - 반응형
- ViewModel
    - 뷰와 모델을 바인딩
    - 모델의 Interpreter
    - gateKeeper 역할

#### MVVM 작동원리

1. Model에서 변경된 게 있으면 ViewModel에 알림
2. ViewModel은 “바뀐 값이 있다”고 View에 전달 (publishes)
3. View는 자동으로 바뀐 관찰값들을 반영해서 뷰를 다시 그림


## Architecture

### struct / class

차이점에 대한 정리 된 slide:

<img width="1171" alt="스크린샷 2024-12-06 오후 5 33 21" src="https://github.com/user-attachments/assets/89bc5cbc-d289-4f30-9e2b-2266b84b5e34">


### Generics

- "don't care" type
- Swift는 strongly-typed language이기 때문에 타입이 정해진 변수를 사용한다는 특징이 있음. 
  - 타입을 정하지 않은 변수를 사용할 때 활용 되는 게 제너릭 타입

### Protocol

- protocol은 단순한 형태의 struct/class의 형태다. 
  - 함수나 변수를 가지고 있으나, 구현이나 저장을 할 수 없음.
  - type임
  - struct, class, 또는 enum의 동작을 지정할 수 있음.
  - 다른 타입을 제한할 수 있음
    - 예시로, SwiftUI에서의 view는 var body를 반드시 구현해주야 해당 뷰가 작동함.
- 왜 사용할까?
  1. 타입의 특정 동작 정의를 위해
  2. 다른 코드가 특정 동작을 요구할 수 있도록.
  3. struct나 class인지 공개하지 않고 동작만 정의하기 위해 (코드의 유연성과 캡슐화!)

예시:
```swift
protocol Moveable {
    func move(by: Int)
    var hasMoved: Bool { get }
    var distanceFromStart: Int { get set }
}
```

### Functions as Types
- 함수는 타입에 속한다.
  - 변수, 파라미터, 반환값 등을 함수 타입으로 사용할 수 있음.
    - e.g.: (Int, Int) -> Bool
  - Clousers
