### **Substring**

- Substring은 String에서 일부 추출할 때 생성 된, 별개의 Substring의 인스턴스이다.
- String의 메서드와 거의 흡사하지만 문자열과 달리 문자열을 사용하는 짧은 시간동안만 사용하도록 설계 되었다.
- Substring은 원본 String이나 Substring을 수정하기 전까지 복사가 이루어지지 않아 성능이 최적화된다.
- Substring은 일반적으로 짧은 기간 동안만 사용해야 하며, 장기적으로 사용하려면 String으로 변환해야 한다. → Substring이 원본 String의 메모리를 공유하기 때문에, 원본 String이 해제되면 Substring도 유효하지 않게 될 수 있기 때문.