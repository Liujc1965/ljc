import {juxing,mianji} from '../components/CommonComponents'
@Entry
@Component
struct ModulePage {
  @State message: string = 'Hello World'
  @State count:number=0
  @State text: string = ''
  controller: TextInputController = new TextInputController()
  build() {
    Row() {
      Column() {
        Text(this.message+this.count)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider().color('#fff80202').strokeWidth(8)
        Button("点击")   /*当点击时可以改变上面text的值*/
          .margin({top:10,bottom:20})
          .onClick((event: ClickEvent) => {
          this.count++
        })

        Row(){
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        TextInput({placeholder:"请输入",})
          .width(150)
          .backgroundColor('#FFF')
          .type(InputType.Normal)
          .onChange((value:string)=>{
            this.message=value.toString()
          })
        }
        Image($r('app.media.mate60'))
          .height(100)
        Image('https://img0.baidu.com/it/u=110176915,621401482&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=665')
          .height(100)
      }
      .width('100%')

    }
    .height('100%')
  }
}