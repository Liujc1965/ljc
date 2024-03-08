import promptAction from '@ohos.promptAction';
import router from '@ohos.router'
import {tanchuang} from '../components/CommonComponents'
@Entry
@Component
struct LogininPage {
  @State message: string = '欢迎登录遥遥领先APP'
  @State password:number=0
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
          TextInput({placeholder:'请输入手机号'})
            .type(InputType.Normal)
            .margin({top:20,right:30,bottom:20})
            .width(250)
            .onChange((value:string)=>{
              this.phone=value
            })
        }
        Row(){
          Text("密码:    ")
            .margin({left:35})
          TextInput({placeholder:'请输入密码'})
            .type(InputType.Password)
            .margin({right:30})
            .width(250)
            .onChange((value:string)=>{
              this.password=parseInt(value)
            })
        }
        Row(){
        Button("登录")
          .height(50)
          .width(100)
          .onClick(()=>{
            let rep:RegExp=/[0-9]{11}/
            if(rep.test(this.phone)){
            if(this.password==8888){
              tanchuang('密码输入正确，登录成功！')
            }
            else {
              tanchuang('密码输入错误，登录失败！')
            }}
            else{
              tanchuang('手机号格式错误，请重新输入！')
            }
          })
          .margin({top:30,right:50})
        Button("去注册")
          .height(50)
          .width(100)
          .margin({top:30})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/registerPage'
            })
          })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}