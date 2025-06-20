import router from '@ohos.router';
import { CommonConstants } from '../common/constants/CommonConstants';
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
struct IndexPage {
  @State titleParam: Resource = $r('app.string.detail_default_title');
  private controller: TabsController = new TabsController();
  private swiperController: SwiperController = new SwiperController();
  @State currentIndex: number = 0;

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

  @Builder TabTextBuilder(text: string,index:number) {
    Text(text)
      .fontSize(this.currentIndex===index?18:16)
      .fontColor(this.currentIndex===index?'#000':'#888')
      .fontWeight(this.currentIndex===index?800:400)
  }

  @Builder TabMyContent(){
    Scroll(){
      Column(){
        Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceAround,alignItems:ItemAlign.Center }){
          Column(){
            Image($r('app.media.my_nav_icon1'))
              .width(38)
              .height(38)
              .margin({bottom:9})
            Text('私人FM').fontSize(12).fontColor('#000')
          }
          Column(){
            Image($r('app.media.my_nav_icon1'))
              .width(38)
              .height(38)
              .margin({bottom:9})
            Text('心动模式').fontSize(12).fontColor('#000')
          }
          Column(){
            Image($r('app.media.my_nav_icon1'))
              .width(38)
              .height(38)
              .margin({bottom:9})
            Text('私人电台').fontSize(12).fontColor('#000')
          }
          Column(){
            Image($r('app.media.my_nav_icon1'))
              .width(38)
              .height(38)
              .margin({bottom:9})
            Text('跑步FM').fontSize(12).fontColor('#000')
          }
          Column(){
            Image($r('app.media.my_nav_icon1'))
              .width(38)
              .height(38)
              .margin({bottom:9})
            Text('心动模式').fontSize(12).fontColor('#000')
          }
        }
        .height(86)
        Column(){
          Row(){
            Image($r('app.media.music_icon'))
              .width(21)
              .height(25)
            Text('本地音乐')
              .fontSize(16)
              .fontColor('#000')
              .margin({left:8})
          }
          .width('100%')
          .height(47)
          .alignItems(VerticalAlign.Center)
          .border({width:{bottom:1},color:'#dcdcdc',})
          .padding({left:13})
          Row(){
            Image($r('app.media.music_icon'))
              .width(21)
              .height(25)
            Text('最近播放')
              .fontSize(16)
              .fontColor('#000')
              .margin({left:8})
          }
          .width('100%')
          .height(47)
          .alignItems(VerticalAlign.Center)
          .border({width:{bottom:1},color:'#dcdcdc',})
          .padding({left:13})
          Row(){
            Image($r('app.media.music_icon'))
              .width(21)
              .height(25)
            Text('下载管理')
              .fontSize(16)
              .fontColor('#000')
              .margin({left:8})
          }
          .width('100%')
          .height(47)
          .alignItems(VerticalAlign.Center)
          .border({width:{bottom:1},color:'#dcdcdc',})
          .padding({left:13})
          Row(){
            Image($r('app.media.music_icon'))
              .width(21)
              .height(25)
            Text('我的电台')
              .fontSize(16)
              .fontColor('#000')
              .margin({left:8})
          }
          .width('100%')
          .height(47)
          .alignItems(VerticalAlign.Center)
          .border({width:{bottom:1},color:'#dcdcdc',})
          .padding({left:13})
          Row(){
            Image($r('app.media.music_icon'))
              .width(21)
              .height(25)
            Text('我的收藏')
              .fontSize(16)
              .fontColor('#000')
              .margin({left:8})
          }
          .width('100%')
          .height(47)
          .alignItems(VerticalAlign.Center)
          .border({width:{bottom:1},color:'#dcdcdc',})
          .padding({left:13})
        }
        Divider()
        .strokeWidth(9)
        .color('#dcdcdc')
        Column(){
          Text('创建的歌单')
            .fontSize(16)
            .fontColor('#000')
            .fontWeight(800)
            .margin({bottom:4})
          Row(){
            Image('http://p1.music.126.net/mENtBPo_dYhMgsv0_3ae9A==/109951165448009459.jpg')
              .width(56)
              .height(56)
              .margin({right:12})
            Column(){
              Text('linwu-hi喜欢的音乐')
                .fontSize(14)
                .fontColor('#000')
              Text('14首')
                .fontSize(12)
                .fontColor('#666')
                .margin({top:4})
            }
            .alignItems(HorizontalAlign.Start)
          }
        }
        .width('100%')
        .padding({left:13,top:6})
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)
      }
    }
  }

  build() {
    Column() {
        Image($r("app.media.menu"))
        .width(22)
        .height(22)
        .position({
          x:10,
          y:14
        })
        Tabs({index:this.currentIndex,controller: this.controller }) {
          TabContent() {
             this.TabMyContent()
          }
          .tabBar(this.TabTextBuilder('我的',0))
          .align(Alignment.TopStart)

          TabContent() {
            Text('首页的内容')
          }
          .tabBar(this.TabTextBuilder('云村',1))

          TabContent() {
            Text('推荐的内容').fontSize(35).fontColor('#888')
          }
          .tabBar(this.TabTextBuilder('推荐',2))

          TabContent() {
            Scroll(){
              Column(){
                Swiper(this.swiperController) {
                  Image('http://p1.music.126.net/lP1H_mfrmEeO0A9_oi-4WA==/109951169072752079.jpg')
                    .width(349)
                    .height(145)
                  Image('http://p1.music.126.net/lP1H_mfrmEeO0A9_oi-4WA==/109951169072752079.jpg')
                    .width(349)
                    .height(145)
                  Image('http://p1.music.126.net/lP1H_mfrmEeO0A9_oi-4WA==/109951169072752079.jpg')
                    .width(349)
                    .height(145)
                }
                .width(349)
                .height(145)
                .loop(true)
                .autoPlay(true)
                Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceAround,alignItems:ItemAlign.Center }){
                  Column(){
                    Image($r('app.media.nav_icon1'))
                      .width(43)
                      .height(43)
                      .margin({bottom:9})
                    Text('每日推荐').fontSize(12).fontColor('#000')
                  }
                  Column(){
                    Image($r('app.media.nav_icon1'))
                      .width(43)
                      .height(43)
                      .margin({bottom:9})
                    Text('歌单').fontSize(12).fontColor('#000')
                  }
                  Column(){
                    Image($r('app.media.nav_icon1'))
                      .width(43)
                      .height(43)
                      .margin({bottom:9})
                    Text('排行榜').fontSize(12).fontColor('#000')
                  }
                  Column(){
                    Image($r('app.media.nav_icon1'))
                      .width(43)
                      .height(43)
                      .margin({bottom:9})
                    Text('电台').fontSize(12).fontColor('#000')
                  }
                }
                .height(98)
                .margin({top:9})
                Column(){
                  Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center }){
                    Text('推荐歌单')
                      .fontSize(16)
                      .fontColor('#000')
                      .fontWeight(800)
                    Text('歌单广场')
                      .padding({top:2,right:6,bottom:2,left:2})
                      .border({width:1,color:'#ccc'})
                      .borderRadius(18)
                      .fontSize(10)
                      .fontColor('#000')
                  }
                  .padding({left:9,right:9})
                  Flex({ direction: FlexDirection.Row,wrap:FlexWrap.Wrap,justifyContent:FlexAlign.SpaceAround }){
                    Column(){
                      Image('https://p1.music.126.net/LIhxL7p5UkYX5NmHL8vhzQ==/18869818556322650.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('听一首把自己感动的歌').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/zpmOTZw533nltCQJtXC8Rg==/109951168215962168.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('我知道风里有诗，那正是民谣的歌').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/qA0W0aER7LxB99iTOMQZcA==/109951166153828602.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('[国电新势力] 网易电子音乐人精选').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/LIhxL7p5UkYX5NmHL8vhzQ==/18869818556322650.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('听一首把自己感动的歌').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/zpmOTZw533nltCQJtXC8Rg==/109951168215962168.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('我知道风里有诗，那正是民谣的歌').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/qA0W0aER7LxB99iTOMQZcA==/109951166153828602.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('[国电新势力] 网易电子音乐人精选').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                  }
                  .margin({top:13})
                }

                Column(){
                  Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center }){
                    Text('新碟')
                      .fontSize(16)
                      .fontColor('#000')
                      .fontWeight(800)
                    Text('更多新碟')
                      .padding({top:2,right:6,bottom:2,left:2})
                      .border({width:1,color:'#ccc'})
                      .borderRadius(18)
                      .fontSize(10)
                      .fontColor('#000')
                  }
                  .padding({left:9,right:9})
                  Flex({ direction: FlexDirection.Row,wrap:FlexWrap.Wrap,justifyContent:FlexAlign.SpaceAround }){
                    Column(){
                      Image('https://p1.music.126.net/Ik30xAtj2MQgCU5jE6K6Ww==/109951169052034633.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('暗流').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/UGP6oPJ35Ab_mvBljtzoPA==/109951169067369971.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('도화').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                    Column(){
                      Image('https://p1.music.126.net/AWcDI5wc9fkS2bZt6wIm-Q==/109951163212638897.jpg')
                        .width(107)
                        .margin({bottom:4})
                      Text('Practice Make Perfect').fontSize(12).fontColor('#000')
                    }
                    .width(107)
                    .margin({bottom:13})
                  }
                  .margin({top:13})
                }

                Column(){
                  Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center }){
                    Text('最新MV')
                      .fontSize(16)
                      .fontColor('#000')
                      .fontWeight(800)
                    Text('查看更多')
                      .padding({top:2,right:6,bottom:2,left:2})
                      .border({width:1,color:'#ccc'})
                      .borderRadius(18)
                      .fontSize(10)
                      .fontColor('#000')
                  }
                  .padding({left:9,right:9})
                  Column(){
                    Image('https://p1.music.126.net/qA0W0aER7LxB99iTOMQZcA==/109951166153828602.jpg')
                      .width(337)
                      .height(213)
                      .margin({top:9,bottom:4})
                      .borderRadius(12)
                    Text('덤더럼(Dumhdurum)')
                      .fontSize(16)
                      .fontColor('#000')
                      .fontWeight(800)
                      .height(42)
                      .margin({left:12})
                  }
                  .borderRadius({topLeft:12,topRight:12})
                  .backgroundColor('#efefef')
                  .alignItems(HorizontalAlign.Start)
                  .width(337)
                  .margin({bottom:13})
                  Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center }){
                    Row(){
                      Image($r('app.media.like'))
                        .width(17)
                        .height(20)
                      Text('220000')
                        .fontSize(16)
                        .fontColor('#000')
                        .margin({left:2,right:4})
                      Image($r('app.media.comment'))
                        .width(17)
                        .height(20)
                      Text('320000')
                        .fontSize(16)
                        .fontColor('#000')
                        .margin({left:2})
                    }
                    .alignItems(VerticalAlign.Center)
                    Image($r('app.media.more_menu'))
                      .width(12)
                      .height(14)
                  }
                  .padding({left:20,right:20})
                }
              }
            }
          }
          .height('100%')
          .tabBar(this.TabTextBuilder('发现',3))
        }
        .onChange((index:number)=>{
          this.currentIndex=index
        })
        .barWidth(286)
        .barHeight(45)
        // .padding({left:32,right:32})
        .width('100%')
        .height('100%')
        .scrollable(true)
        // .backgroundColor('red')
        Image($r("app.media.search"))
          .width(22)
          .height(22)
          .position({
            x:328,
            y:14
          })
      }
      .justifyContent(FlexAlign.Start)
    }
}