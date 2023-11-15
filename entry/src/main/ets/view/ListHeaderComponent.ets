import { FontSize, ListHeaderStyle } from '../common/Constants'
@Component
export struct ListHeaderComponent {

  paddingValue: Padding | Length = 0
  widthValue: Length = 0

  build() {
    Row() {
      Text($r("app.string.page_number"))
        .fontSize(FontSize.SMALL)
        .fontWeight(ListHeaderStyle.FONT_WEIGHT)
        .fontColor($r("app.color.font_description"))
        .width(ListHeaderStyle.LAYOUT_WEIGHT_LEFT)
      Text($r("app.string.page_type"))
        .fontSize(FontSize.SMALL)
        .fontWeight(ListHeaderStyle.FONT_WEIGHT)
        .fontColor($r("app.color.font_description"))
        .width(ListHeaderStyle.LAYOUT_WEIGHT_CENTER)
      Text($r("app.string.page_vote"))
        .fontSize(FontSize.SMALL)
        .fontWeight(ListHeaderStyle.FONT_WEIGHT)
        .fontColor($r("app.color.font_description"))
        .width(ListHeaderStyle.LAYOUT_WEIGHT_RIGHT)
    }
    .width(this.widthValue)
    .padding(this.paddingValue)
  }
}