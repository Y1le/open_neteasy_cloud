// D:/User/Desktop/shangke/hmos/open_neteasy_cloud-main/entry/src/main/ets/common/bean/Category.ets
import type { ListItemData } from './ListItemData';
import Resource from '@ohos.app.ability.common'; // 鸿蒙14版本 Resource 的导入路径

/**
 * Category item information.
 */
export class Category {

  /**
   * Category title.
   */
  title: Resource = $r('app.string.default_category_title'); // 提供一个默认的字符串资源ID

  /**
   * Category content(a list).
   */
  categoryContent: Array<ListItemData> = []; // 默认初始化为空数组
}