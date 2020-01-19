## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true, index|
|email|string|null: false, unique: true|
|password|string|null: infalse|
|incomes|integer|null: false|
|fixedcosts|integer|null: false|
|save|integer|null: false|

### Association
- has_many :plans
- has_many :wishes
- has_many :records
- has_one :totals


## plansテーブル

|Column|Type|Option|
|------|----|------|
|month|integer||
|content|string||
|cost|integer|null: false|
|user|references|foreign_key: true|

### Association
bolongs_to :user


## wishesテーブル

|Column|Type|Option|
|------|----|------|
|month|integer||
|content|string||
|cost|integer|null: false|
|user|references|foreign_key: true|

### Association
bolongs_to :user


## recordsテーブル

|Column|Type|Option|
|------|----|------|
|month|integer||
|content|string||
|cost|integer|null: false|
|user|references|foreign_key: true|
|total|references|foreign_key: true|

### Association
bolongs_to :user
belongs_to :total


## totalsテーブル

|Column|Type|Option|
|------|----|------|
|expenses|integer||
|balance_year|integer||
|balance_month|integer||
|record|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
has_many :records
bolongs_to :user
