# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rake db:drop && rake db:seed

# User
u1 = User.find_or_initialize_by email: '1@1.com', nickname: 'user1'
u1.update_attributes password: '123123123'
u1.confirm

u2 = User.find_or_initialize_by email: '2@1.com', nickname: 'user2'
u2.update_attributes password: '123123123'
u2.confirm

u3 = User.find_or_initialize_by email: '3@1.com', nickname: 'user3'
u3.update_attributes password: '123123123'
u3.confirm

# Reprots
r1 = Report.find_or_create_by! title: 'WWE最具影响力的十大男选手', owner: u1, desc: '世界摔角娱乐（World Wrestling Entertainment）是一家世界级的体育娱乐（职业摔角）和媒体整合型上市公司，营业收入来源除了职业摔角比赛外，还包含电影、音乐、版权、行销等相关产业。'
r2 = Report.find_or_create_by! title: 'WWE最具影响力的十大女选手',owner: u1, desc: '世界摔角娱乐（World Wrestling Entertainment）是一家世界级的体育娱乐（职业摔角）和媒体整合型上市公司，营业收入来源除了职业摔角比赛外，还包含电影、音乐、版权、行销等相关产业。'

# Line
l1 = Line.find_or_create_by! name: '约翰塞纳'
l2 = Line.find_or_create_by! name: '送葬者'
l3 = Line.find_or_create_by! name: '兰迪奥顿'
l4 = Line.find_or_create_by! name: '罗曼罗斯'
l5 = Line.find_or_create_by! name: '布雷怀特'

l21 = Line.find_or_create_by! name: 'paige'
l22 = Line.find_or_create_by! name: 'Nick'
l23 = Line.find_or_create_by! name: 'AJ Lee'

# Element
e1 = Element.find_or_create_by! line: l1, post: r1
e2 = Element.find_or_create_by! line: l2, post: r1
e3 = Element.find_or_create_by! line: l3, post: r1
e4 = Element.find_or_create_by! line: l4, post: r1
e5 = Element.find_or_create_by! line: l5, post: r1

e21 = Element.find_or_create_by! line: l21, post: r2
e22 = Element.find_or_create_by! line: l22, post: r2
e23 = Element.find_or_create_by! line: l23, post: r2

# Mark
m1 = Mark.find_or_create_by! element: e1, owner: u1
m2 = Mark.find_or_create_by! element: e2, owner: u1
m3 = Mark.find_or_create_by! element: e3, owner: u1
m4 = Mark.find_or_create_by! element: e4, owner: u1
m5 = Mark.find_or_create_by! element: e5, owner: u1

m21 = Mark.find_or_create_by! element: e21, owner: u1
m22 = Mark.find_or_create_by! element: e22, owner: u1
m23 = Mark.find_or_create_by! element: e23, owner: u1
