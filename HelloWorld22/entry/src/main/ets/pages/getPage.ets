import { Hello } from './hello'
@Entry
@Component
struct GetPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text('123123')
        Hello({message:'你好世界'})
      }
      .width('100%')
    }
    .height('100%')
  }
}