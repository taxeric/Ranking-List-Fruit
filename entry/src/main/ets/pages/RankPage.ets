import { APP_EXIT_INTERVAL, Style, TIME, TITLE, WEIGHT } from '../common/Constants';
import { RankData } from '../viewmodel/RankData';
import { RankDataVM } from '../viewmodel/RankDataVM';
import prompt from '@ohos.promptAction';
import { TitleComponent } from '../view/TitleComponent';
import { ListHeaderComponent } from '../view/ListHeaderComponent';
import { ListItemComponent } from '../view/ListItemComponent';

let rankVM = new RankDataVM()

@Entry
@Component
struct RankPage {

  @State dataSource1: RankData[] = []
  @State dataSource2: RankData[] = []
  @State isSwitchDataSource: boolean = true
  private clickBackTimeRecord: number = 0

  aboutToAppear() {
    this.dataSource1 = rankVM.loadRankData1()
    this.dataSource2 = rankVM.loadRankData2()
  }

  isShowToast(): boolean {
    return new Date().getTime() - this.clickBackTimeRecord > APP_EXIT_INTERVAL
  }

  onBackPress() {
    if (this.isShowToast()) {
      prompt.showToast(
        {
          message: $r("app.string.prompt_text"),
          duration: TIME
        }
      )
      this.clickBackTimeRecord = new Date().getTime()
      return true
    }
    return false
  }

  build() {
    Column() {
      TitleComponent(
        {
          isRefreshData: $isSwitchDataSource,
          title: TITLE
        }
      )
      ListHeaderComponent(
        {
          paddingValue: {
            left: Style.RANK_PADDING,
            right: Style.RANK_PADDING,
          },
          widthValue: Style.CONTENT_WIDTH
        }
      )
        .margin(
          {
            top: Style.HEADER_MARGIN_TOP,
            bottom: Style.HEADER_MARGIN_BOTTOM
          }
        )
      this.RankList(Style.CONTENT_WIDTH)
    }
    .backgroundColor($r("app.color.background"))
    .height(WEIGHT)
    .width(WEIGHT)
  }

  @Builder RankList(widthValue: Length) {
    Column() {
      List() {
        ForEach(
          this.isSwitchDataSource ? this.dataSource1 : this.dataSource2,
          (item: RankData, index) => {
            ListItem() {
              ListItemComponent(
                {
                  index: (Number(index) + 1),
                  name: item.name,
                  vote: item.vote,
                  isSwitchDataSource: this.isSwitchDataSource
                }
              )
            }
          },
          (item: RankData) => {
            return JSON.stringify(item)
          }
        )
      }
      .width(WEIGHT)
      .height(Style.LIST_HEIGHT)
      .divider(
        {
          strokeWidth: Style.STROKE_WIDTH
        }
      )
    }
    .padding(
      {
        left: Style.RANK_PADDING,
        right: Style.RANK_PADDING,
      }
    )
    .borderRadius(Style.BORDER_RADIUS)
    .width(widthValue)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}