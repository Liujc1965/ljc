@Entry
@Component
export struct Hello {
  @State message: string = 'Hello World'

  build() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
  }
}