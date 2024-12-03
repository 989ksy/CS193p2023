# Lecture1

### SwiftUI
- 선언형 UI

### View
- View 프로토콜을 따르는 구조체로, UI를 만드는 역할
- computed property(연산 프로퍼티)이며, body의 some view를 반환하여 뷰를 만든다.
    
### @ViewBuilder
- body 프로퍼티에서 뷰를 선언적으로 작성할 수 있게 하는 속성
- ResultBuilder를 사용해 뷰를 구성
  
### ViewModifier
- 뷰를 서포트하는 역할.
- view를 커스텀하거나, 재사용할 수 있게 함

### VStack
- 수직 정렬 뷰 컨테이너

 ### HStack
- 수평 정렬 뷰 컨테이너

### ZStack
- 뷰를 쌓는 뷰 컨테이너
- Leading → Trailing 방향 디폴트
