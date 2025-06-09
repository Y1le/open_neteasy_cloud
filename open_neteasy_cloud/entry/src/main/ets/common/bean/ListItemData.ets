// D:/User/Desktop/shangke/hmos/open_neteasy_cloud-main/entry/src/main/ets/common/bean/ListItemData.ets
import Resource from '@ohos.app.ability.common'; // 鸿蒙14版本 Resource 的导入路径

/**
 * List item data.
 */
export class ListItemData {
  /**
   * List item title.
   */
  title: Resource = $r('app.string.default_list_item_title'); // 提供一个默认的字符串资源ID

  /**
   * Summary.
   */
  summary: Resource = $r('app.string.default_list_item_summary'); // 提供一个默认的字符串资源ID

  /**
   * Arrow image.
   */
  imageArrow: Resource = $r('app.media.ic_public_arrow_right'); // 提供一个默认的图片资源ID
  // 确保 ic_public_arrow_right.png (或其他格式) 文件存在于 resources/base/media/ 目录下
  // 如果不存在，请替换为项目中已有的图片资源ID，或者添加该图片文件。
}