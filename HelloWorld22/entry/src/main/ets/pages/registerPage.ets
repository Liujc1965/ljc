import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { tanchuang } from '../components/CommonComponents'
@Entry
@Component
struct LoginPage {
  @State message: string = '欢迎注册遥遥领先APP'
  @State name:string=''
  @State yan:number=0
  @State phone:string=''
  build() {
    Row() {
      Column() {
        Image($r('app.media.icon'))
          .height(100)
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({bottom:50})
        Row(){
          Text("手机号: ")
            .margin({top:20,left:30,bottom:20})
          TextInput({placeholder:'请输入手机号码'})
            .type(InputType.PhoneNumber)
            .margin({top:20,right:30,bottom:20})
            .width(250)
            .onChange((value:string)=>{
              this.phone=value
            })
        }
        Row(){
          Text("验证码: ")
            .margin({left:5})
          TextInput()
            .type(InputType.Normal)
            .width(180)
            .onChange((value:string)=>{
              this.yan=parseInt(value)
            })
          Button("发送")
            .height(30)
            .onClick(()=>{
              let reg:RegExp= /[0-9]{11}/
              if(reg.test(this.phone)){
                tanchuang('验证码发送成功，注意接受！')
              }
              else {
                tanchuang('手机号输入错误！')
              }
              })
        }
        Row(){
        Button("确认注册")
          .height(50)
          .width(100)
          .margin({top:30,right:50})
          .onClick(
            ()=>{
              if(this.yan==6666){
                tanchuang('验证码输入正确！')
              }
              else {
                tanchuang('验证码输入错误！')
              }}
          )
          Button("去登录")
            .height(50)
            .width(100)
            .margin({top:30})
            .onClick(()=>{
                router.pushUrl({
                  url:'pages/logininPage'
                })
            }
            )
      }
      }
      .width('100%')
    }
    .height('100%')
  }
}