import router from '@ohos.router'
import {Header} from '../components/CommonComponents'
//列表类，定义每个微信消息中的组件信息
class Item{
  name:string    //姓名
  image:ResourceStr//头像
  dialog:string  //聊天信息
  date:string    //发送日期
  we:string      //是否是个人消息
  /*默认构造函数,给类中属性赋值*/
  constructor(name:string,image:ResourceStr,dialog:string,date:string,we?:string) {
    this.name=name
    this.image=image
    this.dialog=dialog
    this.date=date
    this.we=we
  }
}
//列表卡片属性,这里构建了一个组件ItemCard
@Builder function ItemCard(item:Item){   //@Builder可以
  Row({space:10}){
    /*头像图片*/
    Image(item.image)
      .width(60)
    .borderRadius(10)
    /*头像右侧信息,定义为列类型*/
    Column({space:4}){
      Row(){     //因为名称,是否是个人信息,日期都在一行,此处定义一个row来包含
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(item.we)
          .fontColor('#ff73ff66')
          .fontSize(18)
        Text(item.date)
          .fontColor('#ffeae9e9')
          .fontSize(18)
          .position({x:220})
      }
        Text(item.dialog)  //聊天信息在下一行,放在row外
          .fontColor(20)
          .fontColor('#ccc')
      }
    .height('100%')
    .alignItems(HorizontalAlign.Start)  //使字都靠左
  }
  .width('100%')
  .backgroundColor('#fff')
  .height(80)
  .padding(10)
}
//这里定义了一个微信下方导航框
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

@Entry
@Component
struct Wechat {
  /*列表消息添加*/
  @State items:Array<Item>=[
    new Item('雷依',$r('app.media.leiyi'),'好的','昨天','@微信'),
    new Item('张啸天',$r('app.media.zhangxiaotian'),'[3月5日学雷锋日弘扬雷锋精神主题团会.pptx]','昨天','@微信'),
    new Item('杨冰翌',$r('app.media.yangbingyi'),'set NODE OPTIONS=--openssl-legacy-provid...','昨天','@微信'),
    new Item('行业资讯',$r('app.media.hangyezhixun'),'同事们在看《关于绿盟科技与亿赛通业务整','昨天'),
    new Item('客户联系',$r('app.media.kehulianxi'),'联系客户统计 3.5','昨天'),
    new Item('张祥福',$r('app.media.zhangxiangfu'),'嗯嗯','星期二','@微信'),
    new Item('接收微信中的工作消息',$r('app.media.kehulianxi'),'选择微信中的工作群，用企业微信收发群消息','星期日'),
    new Item('一周小结',$r('app.media.yizhouxiaojie'),'查收你的企业微信一周小结','星期五'),
    new Item('彭梦瑶',$r('app.media.pengmengyao'),'好的','2/28','@微信'),
    new Item('刘德麒',$r('app.media.liudeqi'),'好','2/28','@微信'),

  ]
  build() {
    Column({space:8}){
      Row(){
      Header({title:'消息'})
        .margin({bottom:20})
      }
      .width('100%')
      .height(50)

      List({space:8}){
        ForEach(
          this.items,
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
        Ender({img:$r('app.media.message_chosse'),hang:'微信',url1:'pages/wechat'})
        Ender({img:$r('app.media.book'),hang:'通讯录',url1:'pages/tongxunlu'})
        Ender({img:$r('app.media.find'),hang:'发现',url1:'pages/explore'})
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