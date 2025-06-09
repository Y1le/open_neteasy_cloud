import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';
import Resource from '@ohos.app.ability.common'; // 鸿蒙14版本 Resource 的导入路径


interface GeneratedTypeLiteralInterface_1 {
  data?: Resource;
}

@Entry
@Component
struct HomePage { // 同样适用于 IndexPage 和 DailyRecommendPage
  @State titleParam: Resource = $r('app.string.detail_default_title'); // 确保有默认值

  aboutToAppear() {
    // 1. 获取原始参数对象
    let rawParams = router.getParams();

    // 2. 检查原始参数对象是否存在
    if (rawParams) {
      // 3. 将原始参数对象断言为一个明确包含 'data' 属性的匿名类型
      //    因为 CommonConstants.KEY_PARAM_DATA 的值是 "data"
      //    这里我们假设 'data' 属性的值是 Resource 类型
      //    使用可选属性 '?' 更安全，因为路由参数可能不总是包含这个键
      const params = rawParams as GeneratedTypeLiteralInterface_1;

      // 4. 检查 'data' 属性是否存在且不为 undefined
      if (params.data !== undefined) {
        // 5. 赋值给 titleParam，并再次断言为 Resource 类型以确保类型匹配
        this.titleParam = params.data as Resource;
      }
    }
  }

  build() {
    Column() {
      Image($r('app.media.logo'))
        .width('62')
        .height('62')
        .borderRadius('32')
        .margin({top:134})
      Column(){
        Button('手机号登录')
          .width(282)
          .height(38)
          .borderRadius(50)
          .fontColor('#C20C0C')
          .backgroundColor('#fff')
        Button('立即体验')
          .width(282)
          .height(38)
          .borderRadius(50)
          .fontColor('#fff')
          .backgroundColor('transparent')
          .border({
            width:1,
            color:"#fff"
          })
          .margin({
            top:25
          })
          .onClick(()=>{
            router.pushUrl({
              url: CommonConstants.INDEX_PAGE
            });
            console.log('ok')
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .position({
         x:0,
         y:'80%'
      })

    }
    .width('100%')
    .height(CommonConstants.DETAIL_COLUMN_HEIGHT_PERCENT)
    .backgroundColor($r('app.color.theme_background'))
  }
}