# drawWithFriend

### 目前功能
* 繪製線條

### 預計新增功能
* RGB slider調整筆刷顏色
* 調整筆刷粗細

* 與後端串連，記錄使用者及軌跡資料，達到共同繪圖的目的

### API規劃

* 進入房間(POST)

| 欄位名稱 | 資料型態 |
| - | - |
| name | String |

```swift
"result": [{
  "member": [{
    "id": Int
    "name": String
  }],
  "paths": [{
    "color": {
      "red": Int,
      "green": Int,
      "blue": Int
    },
    "width": Int,
    "path": [{
      "x": Int,
      "y": Int
    }]
  }]
}]
```

* 得到繪圖結果(GET)

```swift
"result": [{
  "member": [{
    "id": Int
    "name": String
  }],
  "paths": [{
    "color": {
      "red": Int,
      "green": Int,
      "blue": Int
    },
    "width": Int,
    "path": [{
      "x": Int,
      "y": Int
    }]
  }]
}]
```

* 更新繪圖內容(POST)

| 欄位名稱 | 資料型態 |
| - | - |
| name | String |
| pathData | |

將pathData加入paths

* 回上一步(POST)

| 欄位名稱 | 資料型態 |
| - | - |
| name | String |

刪除該名字下最新一條繪圖路徑

* 離開房間(POST)

| 欄位名稱 | 資料型態 |
| - | - |
| name | String |

將該使用者從member中移除
