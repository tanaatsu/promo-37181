# README

## users テーブル
|Column---------------|Type----------|Options------------------------|
|nickname-------------|string--------|null :false--------------------|
|email----------------|string--------|null :false, unique: true------|
|encrypted_password---|string--------|null :false--------------------|
|last_name------------|string--------|null :false--------------------|
|first_name-----------|string--------|null :false--------------------|
|telephone------------|string--------|null :false--------------------|
|birthday-------------|date----------|null :false--------------------|
|industry_id----------|integer-------|null :false--------------------|
|reason_id------------|integer-------|null :false--------------------|
|person_id------------|integer-------|null :false--------------------|
|store_name-----------|string--------|-------------------------------|
|prefecture_id--------|integer-------|-------------------------------|
|area-----------------|string--------|-------------------------------|
|opening_hours--------|string--------|-------------------------------|

## Association
has_many :posts 
has_many :records 
has_many :comments

## posts テーブル
|Column---------------|Type----------|Options------------------------|
|title----------------|string--------|null :false--------------------|
|text-----------------|text----------|null :false--------------------|
|genre_id-------------|integer-------|null :false--------------------|
|price----------------|integer-------|-------------------------------|
|user-----------------|references----|null :false, foreign_key: true-|

## Association
has_many :comments 
belongs_to :user 
has_one :record

## comments テーブル
|Column---------------|Type----------|Options------------------------|
|text-----------------|text----------|null :false--------------------|
|user-----------------|references----|null :false,foreign_key: true--|
|post-----------------|references----|null :false,foreign_key: true--|

## Association
belongs_to :user 
belongs_to :post

## records テーブル
|Column---------------|Type-----------|Options------------------------|
|user-----------------|references-----|null :false,foreign_key: true--|
|post-----------------|references-----|null :false,foreign_key: true--|

## Association
belongs_to :post 
belongs_to :user 
has_one :address

## addresses テーブル
|Column---------------|Type-----------|Options------------------------|
|postal_code----------|string---------|null :false--------------------|
|prefecture_id--------|integer--------|null :false--------------------|
|municipality---------|string---------|null :false--------------------|
|address--------------|string---------|null :false--------------------|
|building_name--------|string---------|-------------------------------|
|record---------------|references-----|null :false, foreign_key: true-|

## Association
belongs_to :record