import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';
// import { DetailListComponent } from '../view/DetailListComponent';
import Resource from '@ohos.app.ability.common'; // 鸿蒙14版本 Resource 的导入路径
import { DetailListComponent } from '../view/DetailListComponent'; // 确保这个导入是需要的，如果不需要可以移除

// 定义路由参数接口，与 HomePage.ets 中的 GeneratedTypeLiteralInterface_1 相同
interface RouterParams {
  data?: Resource; // 假设 CommonConstants.KEY_PARAM_DATA 的值为 "data"
}

/**
 * Detail page to display more information.
 */
@Entry
@Component
struct DailyRecommendPage {
  @State titleParam: Resource = $r('app.string.detail_default_title');

  aboutToAppear() {
    // 1. 获取原始参数对象
    let rawParams = router.getParams();

    // 2. 检查原始参数对象是否存在
    if (rawParams) {
      // 3. 将原始参数对象断言为 RouterParams 接口类型
      const params = rawParams as RouterParams;

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