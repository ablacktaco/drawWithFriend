# drawWithFriend

### 目前功能
* 繪製線條

### 預計新增功能
* RGB slider調整筆刷顏色
* 調整筆刷粗細

* 與後端串連，記錄使用者及軌跡資料，達到共同繪圖的目的

"result": [{
  name: String,
  paths: [
    {
      color: {
        red: Int,
        green: Int,
        blue: Int
      },
      width: Int,
      path: [{
        x: Int,
        y: Int
      }]
    }
  ]
}]
