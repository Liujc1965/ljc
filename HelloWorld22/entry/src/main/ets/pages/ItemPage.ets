
class Item{
  name:string
  image:ResourceStr
  price:number
  discount:number

  constructor(name:string,image:ResourceStr,price:number,discount:number=0) {
    this.name=name
    this.image=image
    this.price=price
    this.discount=discount
  }
}

import {Header} from '../components/CommonComponents'


//全局自定义构建函数
@Builder function ItemCard(item:Item){
  Row({space:10}){
    Image(item.image)
      .width(100)
    Column({space:4}){
      if(item.discount){
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('原价:￥ '+item.price)
          .fontColor(20)
          .fontColor('#ccc')
          .decoration({type:TextDecorationType.LineThrough})
        Text('折扣价:￥ '+(item.price-item.discount))
          .fontColor('#F36')
          .fontSize(18)
        Text('补贴:￥ '+item.discount)
          .fontColor('#F36')
          .fontSize(18)
      }else{
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('￥ '+item.price)
          .fontColor('#F36')
          .fontSize(18)
      }

    }
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
  .width('100%')
  .backgroundColor('#fff')
  .borderRadius(20)
  .height(120)
  .padding(10)
}

//这个页面用来学习foreach和if。。else两个循环
@Entry
@Component
struct ItemPage {

  private items:Array<Item>=[
    new Item('华为mate60',$r('app.media.mate60'),6999,500),
    new Item('华为mate601',$r('app.media.mate60'),6999),
    new Item('华为mate602',$r('app.media.mate60'),6999),
    new Item('华为mate603',$r('app.media.mate60'),6999),
    new Item('华为mate604',$r('app.media.mate60'),6999),
    new Item('华为mate602',$r('app.media.mate60'),6999),
    new Item('华为mate603',$r('app.media.mate60'),6999),
    new Item('华为mate604',$r('app.media.mate60'),6999),
    new Item('华为mate602',$r('app.media.mate60'),6999),
    new Item('华为mate603',$r('app.media.mate60'),6999),
    new Item('华为mate604',$r('app.media.mate60'),6999)
  ]

  build() {
    Column({space:8}){
      Header({title:'商品列表'})
        .margin({bottom:20})
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


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#efefef')
    .padding(20)
  }
}