@Entry
@Component
struct ImagePage {
  @State imageWidth: number = 150

  build() {
    Column() {
      Row(){
        Image($r('app.media.icon'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height(400)
      .justifyContent(FlexAlign.Center)

      Row(){
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        TextInput({placeholder: '请输入图片宽度',text: this.imageWidth.toString()})
          .width(150)
          .backgroundColor('#FFF')
          .type(InputType.Number)
          .onChange((value:string)=>{
            this.imageWidth=parseInt(value)
          })
      }
      .width('100%')
      .padding({left:14,right:14})
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .width('90%')

      Row(){
        Button('缩小')
          .width(80)
          .fontSize(20)
          .type(ButtonType.Capsule)
          .onClick( () => {
            if(this.imageWidth>=10){
              this.imageWidth = this.imageWidth-10
            }

          })

        Button('放大')
          .width(80)
          .fontSize(20)
          .type(ButtonType.Capsule)
          .onClick( () => {
            if(this.imageWidth<=300) {
              this.imageWidth = this.imageWidth + 10
            }
          })
      }
      .width('100%')
      .margin(30)
      .justifyContent(FlexAlign.SpaceEvenly)

      Slider({
        min:100,
        max:300,
        value:this.imageWidth,
        step:10
      })
        .width('90%')
        .blockColor('#36d')
        .trackThickness(8)
        .showTips(true)
        .onChange(value=>{
          this.imageWidth=value
        })
    }
    .width('100%')
    .height('100%')
  }
}