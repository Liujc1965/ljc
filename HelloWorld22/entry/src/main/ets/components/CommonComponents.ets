import promptAction from '@ohos.promptAction';
@Component
export struct Header{
  private title:ResourceStr
  build(){
    Row(){
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .position({x:160,y:20})
      Image($r('app.media.ic_search'))
        .width(30)
        .borderRadius(10)
        .position({x:290,y:21})
      Image($r('app.media.ic_add'))
        .width(25)
        .borderRadius(20)
        .position({x:330,y:20})
    }
    .width('100%')
    .height(30)
  }
}
export  class juxing{
  public width:number
  public height:number

  constructor(width:number,height:number){
    this.width=width
    this.height=height
  }
}
export function mianji(juxing:juxing):number{
  return juxing.width*juxing.height
}
export function tanchuang(tishi:string):void{
  try {
    promptAction.showToast({
      message: tishi,
      duration: 2000,
    });
  } catch (error) {
    console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
  }
}
