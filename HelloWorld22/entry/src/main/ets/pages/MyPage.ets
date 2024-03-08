import router from '@ohos.router'
import {Header} from '../components/CommonComponents'
class Item{
  name:string    //姓名
  image:ResourceStr//头像
  /*默认构造函数,给类中属性赋值*/
  constructor(name:string,image:ResourceStr) {
    this.name=name
    this.image=image
  }
}
@Component
struct Ender{
  private img:ResourceStr
  private hang:string
  private url1:string
  build(){
    Column(){
      Image(this.img)
        .height(25)
        .onClick(()=>{
          this.img=$r('app.media.mate60')
          router.pushUrl({
            url:this.url1
          })
        })
      Text(this.hang)
        .fontSize(15)
        .onClick(()=>{
          this.img=$r('app.media.mate60')
          router.pushUrl({
            url:this.url1
          })
        })
    }
    .margin({left:35,right:15})

  }
}
@Builder function ItemCard(item:Item){
  Row({space:10}){
    /*图片*/
    Image(item.image)
      .width(30)
      .borderRadius(10)
    /*头像右侧信息,定义为列类型*/
    Column({space:4}){
      Text(item.name)  //聊天信息在下一行,放在row外
        .fontSize(20)
        .margin({top:10})
      Image($r('app.media.ic_next'))
        .width(20)
        .position({x:'80%',y:'30%'})
    }
    .height('100%')
    .alignItems(HorizontalAlign.Start)  //使字都靠左
  }
  .width('100%')
  .backgroundColor('#fff')
  .height(60)
  .padding(10)
}
@Entry
@Component
struct MyPage {
  @State items:Array<Item>= [
    new Item('服务',$r('app.media.01')),
    new Item('收藏',$r('app.media.02')),
    new Item('朋友圈',$r('app.media.03')),
    new Item('卡包',$r('app.media.05')),
    new Item('表情',$r('app.media.06')),
    new Item('设置',$r('app.media.07')),
  ]

  build() {
    Column({space:8}){
      Row(){
        Image($r("app.media.my"))
          .width(80)
        Column() {
          Text("ffgff")
            .fontSize(20)
            .margin({top:15})
          Text("微信号:")
            .fontColor(Color.Gray)
            .margin({top:10})
            .fontSize(12)
          Row(){
            Text("wxid_x2eadfadfsad")
              .fontSize(12)
              .fontColor(Color.Gray)
            Image($r('app.media.ic_qr_code'))
              .width(10)
              .position({x:'65%'})
            Image($r('app.media.ic_next'))
              .width(10)
              .position({x:'70%'})
          }
          Row(){
            Button("+ 状态")
              .backgroundColor(Color.White)
              .fontColor(Color.Gray)
              .height(30)
              .fontSize(10)
              .width(65)
              .borderColor(Color.Gray)
              .borderWidth(0.5)
              .margin({top:10})
          }

        }
        .alignItems(HorizontalAlign.Start)
        .margin({left:10})
      }
      .width('100%')
      .height(150)
      .backgroundColor(Color.White)


      List({space:8}){
        ForEach(
          this.items,
          (item:Item)=>{
            ListItem(){
              ItemCard(item)
            }
          }
        )
        ListItem(){
          ItemCard(this.items[2])
        }
        .margin({top:-10})
        .borderWidth({top: 1 })
      }
      .width('100%')
      .layoutWeight(1)


      Row(){
        Ender({img:$r('app.media.message'),hang:'微信',url1:'pages/wechat'})
        Ender({img:$r('app.media.book'),hang:'通讯录',url1:'pages/tongxunlu'})
        Ender({img:$r('app.media.find'),hang:'发现',url1:'pages/explore'})
        Ender({img:$r('app.media.my_chose'),hang:'我',url1:'pages/MyPage'})
      }
      .width('100%')
      .height(60)
      .backgroundColor('#fff')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#efefef')
  }
}