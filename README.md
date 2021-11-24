
## users テーブル

| Column             | Type   | Options     |
| email              | string | null: false ｜　ユニーク制約
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |


## prototype テーブル
| title              | string | null: false |
| catch_copy         | text   | null: false |
| concept            | text   | null: false |
| user               | references | null: false,外部キー|

## comments テーブル
| content            | text   | null: false |
| prototype          | references | null: false,外部キー|
| user               | references |null: false,外部キー |




| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
| ------ | ---------- | ------------------------------ |
