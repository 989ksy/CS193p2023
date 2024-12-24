# Lecture 6

## Layout
### HStack and VStack

#### Stacks
- 제공 된 공간을 하위 뷰들에 분배, 우선 순위는 사이즈 측면에서 가장 유연하지 않은 하위 뷰에게 먼저 공간을 제공해준다.
- 유연성의 예시

  1. 고정크기를 가지는 Image
  2. 텍스트 내용에 맞게 크기 조정이 되는 Text
  3. 제공된 모든 공간을 사용하는 RoundedRectangle

-  동작
   -  각 하위 뷰가 필요한 크기를 차지하면, 그 크기만큼 공간이 없어짐
   -  이후 스택은 다음으로 덜 유연한 뷰 순으로 공간 제공
   -  매우 유연한 뷰들이 남은 공간을 균등하게 나눔
   -  위 순서를 반복

- 스택 안의 뷰들이 자신의 크기를 결정하면 스택은 그 뷰들의 크기에 맞춰서 자체 크기를 조정
- 스택 안의 모든 뮤가 매우 유연할 경우 스택 역시 매우 유연하게 동작

#### Spacer (minLength: CGFloat)
- 주어진 모든 공간 차지
- 아무것도 그리지 않음
- minLength는 기본적으로 적절한 간격으로 설정됨

#### Divider()
- 스택 방향에 수직으로 구분선을 그림
  - e.g. HStack에서 사용시 세로선을 그림
- 선이 그려지기 위한 최소 공간만 차지

#### .layoutPriority(Double)
- 스택에서 어떤 뷰에 공간을 우선 배정할지를 지정할 수 있음
- layoutPriority는 가장 유연하지 않은 뷰에 우선권을 줌

``` swift
HStack {
    Text("Important").layoutPriority(100) // 우선순위가 높은 뷰
    Image(systemName: "arrow.up") // 기본 우선순위는 0
    Text("Unimportant") // 우선순위가 낮은 뷰
}
```

- 우선 순위 작동 방법:
  1. "Important" 텍스트 뷰가 가장 높은 우선순위를 가지기 때문에 먼저 공간을 차지
  2. 이미지가 공간 차지
  3. "Unimportant" 텍스트가 남은 공간에 맞춰서 배치
  4. 텍스트가 충분한 공간을 얻지 못하면 내용이 생략될 수 있음

#### alignment

- left 말고 .leading을 사용하는 이유
  - 스택은 자동으로 오른쪽에서 왼쪽으로 쓰이는 언어에도 적용됨 (e.g. 아랍어나 히브리어)

#### LazyHStack과 LazyVStack
- Lazy 스택들은 화면에 보이지 않는 뷰를 생성하지 않음
  - 효율적인 메모리 사용 / 성능 최적화
  - scrollView 사용 시 적합
  - 내부 뷰가 유연하더라도 제공 된 모든 공간차지 X

#### LazyHGrid and LazyVGrid
- 뷰를 열과 행으로 배치
- 뷰 크기는 Lazy*Grid 전달된 정보 (e.g. the columns)에 따라 지정
- 필요하지 않는 경우, 제공된 모든 공간을 차지하지 X

#### Grid
- 가로세로 모든 방향의 공간을 뷰에 할당
  - 이름에 H / V가 포함되어 있지않음에 유의
- 열과 행을 기준으로 정렬 옵션이 다양함 (.grid*())
- 자주 스프레드시트나 데이터 테이블뷰처럼 사용 됨

#### ScrollView
- 제공된 모든 공간 사용, 내부 뷰의 스크롤 축에 따라 조정
- 스크롤 가능한 컨텐츠를 구현할 때 사용

#### Group 및 DisclousreGroup
- Group: 여러 뷰를 묶어 하나의 뷰로 취급
  - 정렬, 스타일 적용 시 사용
- DisclousreGroup: 접을 수 있는 컨텐츠 구현
  - 스크롤, 선택, 계층적 데이터 표시 등에 적합

#### ZStack
- 자식 뷰의 크기에 맞춰 자신의 크기를 조정
  - 자식 뷰 중 하나라도 유연한 뷰가 있으면 ZStack도 유연하게 크기 조정

#### View Modifiers
- 모디파이어는 뷰를 반환, 수정하는 뷰를 포함하는 구조.
  - 크기나 레이아웃 등을 수정하여 반환함
  - e.g. padding(), .aspectRatio, .font, .foregroundColor ....