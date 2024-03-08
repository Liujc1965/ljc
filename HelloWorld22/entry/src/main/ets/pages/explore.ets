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
      .width(40)
      .borderRadius(10)
    /*头像右侧信息,定义为列类型*/
    Column({space:4}){
      Text(item.name)  //聊天信息在下一行,放在row外
        .fontSize(20)
        .position({y:'20%'})
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
struct Explore {
  @State items1:Array<Item>= [
    new Item('朋友圈',$r('app.media.pengyouquan')),
    new Item('直播',$r('app.media.zhibo')),
    new Item('扫一扫',$r('app.media.saoyisao')),
    new Item('听一听',$r('app.media.tingyiting')),
  ]
  @State items2:Array<Item>=[
    new Item('搜一搜',$r('app.media.souyisou')),
    new Item('小程序',$r('app.media.xiaochengxu')),
  ]
  build() {
    Column({space:8}){
      Row(){
        Header({title:'发现'})
          .margin({bottom:20})
      }
      .width('100%')
      .height(50)

      List({space:8}){
        ForEach(
          this.items1,
          (item:Item)=>{
            ListItem(){
              ItemCard(item)
            }
          }
        )
      }
      .width('100%')

      List({space:8}){
        ForEach(
          this.items2,
          (item:Item)=>{
            ListItem(){
              ItemCard(item)
            }
          }
        )
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      Row(){
        Ender({img:$r('app.media.message'),hang:'微信',url1:'pages/wechat'})
        Ender({img:$r('app.media.book'),hang:'通讯录',url1:'pages/tongxunlu'})
        Ender({img:$r('app.media.find_chose'),hang:'发现',url1:'pages/explore'})
        Ender({img:$r("app.media.MyPage"),hang:'我',url1:'pages/MyPage'})
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