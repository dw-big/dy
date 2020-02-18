SET NAMES UTF8;
DROP DATABASE IF EXISTS dy;
CREATE DATABASE dy CHARSET=UTF8;
USE dy;


/**用户信息**/
CREATE TABLE dy_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  createTime BIGINT,  #注册时间
  fname VARCHAR(48),
  fpwd VARCHAR(150),
  phone VARCHAR(16),
  gender INT, #性别  0-女  1-男
  avatar VARCHAR(150)     #头像图片
);
/****首页轮播广告商品****/
CREATE TABLE dy_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),     #图片
  title VARCHAR(64),    #名称
  href VARCHAR(128)     #跳转地址
);
/****首页轮播广告商品****/
INSERT INTO dy_index_carousel VALUES
(NULL, 'img/banner/banner1.jpg','轮播广告商品1','/commodity-detail/1'),
(NULL, 'img/banner/banner2.jpg','轮播广告商品2','/commodity-detail/2');
/****首页商品****/
CREATE TABLE dy_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,   #首页商品id
  title VARCHAR(64),     #楼层标题
  details VARCHAR(128),  #楼层解说
  product_name VARCHAR(64), #商品名称
  simg VARCHAR(128),     #商品图片
  price DECIMAL(10,2),   #商品价格
  spec VARCHAR(64),      #商品规格
  href VARCHAR(128)    #跳转地址
);
INSERT INTO dy_index_product VALUES
(NULL,'新品推荐','每一款新品都是我们精心准备','布朗山','img/index_product/01.jpg',245,'1901 . 150g','/commodity-detail/3'),
(NULL,'新品推荐','每一款新品都是我们精心准备','小金柑','img/index_product/02.jpg',228,'1901 · 120g','/commodity-detail/4'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','十年陈经典普洱袋泡组合','img/index_product/03.jpg',99,'袋泡组合 · 30g×2','/commodity-detail/5'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','益原素','img/index_product/04.jpg',428,'1801 · 357g','/commodity-detail/6'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','益原素茶晶','img/index_product/05.jpg',273,'1901 . 28g/56g','/commodity-detail/7'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','花草原叶袋泡组合','img/index_product/06.jpg',159,'花草袋泡组合 · 36g×4','/commodity-detail/8'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','小青柑','img/index_product/07.jpg',150,'1901 · 110g','/commodity-detail/9'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','益原素','img/index_product/04.jpg',428,'1801 · 357g','/commodity-detail/6'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','益原素茶晶','img/index_product/05.jpg',273,'1901 . 28g/56g','/commodity-detail/7'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','花草原叶袋泡组合','img/index_product/06.jpg',159,'花草袋泡组合 · 36g×4','/commodity-detail/8'),
(NULL,'立冬饮茶','冬境漫步，雪融茶浓','小青柑','img/index_product/07.jpg',150,'1901 · 110g','/commodity-detail/9'),
(NULL,'普洱熟茶','大益经典发酵技艺','润品','img/index_product/08.jpg',118,'1801 · 150g','/commodity-detail/10'),
(NULL,'普洱熟茶','大益经典发酵技艺','7572','img/index_product/09.png',55,'1901 · 100g','/commodity-detail/11'),
(NULL,'普洱熟茶','大益经典发酵技艺','兄弟起风了','img/index_product/10.jpg',68,'1601 · 357g','/commodity-detail/12'),
(NULL,'普洱熟茶','大益经典发酵技艺','大益一级散茶','img/index_product/11.jpg',249,'1701 · 125g','/commodity-detail/13'),
(NULL,'普洱熟茶','大益经典发酵技艺','小龙柱','img/index_product/12.png',268,'1801 · 357g','/commodity-detail/14'),
(NULL,'普洱生茶','大益经典制茶技艺','旺财元宝沱','img/index_product/12.jpg',88,'1801 · 100g','/commodity-detail/15'),
(NULL,'普洱生茶','大益经典制茶技艺','蜜香','img/index_product/13.jpg',128,'1901 · 300g','/commodity-detail/16'),
(NULL,'普洱生茶','大益经典制茶技艺','普知味3年陈','img/index_product/14.jpg',118,'1901 · 357g','/commodity-detail/17'),
(NULL,'普洱生茶','大益经典制茶技艺','7542','img/index_product/15.png',98,'1401 · 150g','/commodity-detail/18'),
(NULL,'普洱生茶','大益经典制茶技艺','甲级沱茶','img/index_product/16.jpg',160,'1801 · 100g×5','/commodity-detail/19'),
(NULL,'大益茶庭','时尚茶礼，品质生活','米奇纪念礼盒','img/index_product/17.jpg',218,'1801 · 100g×2','/commodity-detail/20'),
(NULL,'大益茶庭','时尚茶礼，品质生活','小青柑+小青柠','img/index_product/18.jpg',199,'青柑+青柠组合','/commodity-detail/21'),
(NULL,'大益茶庭','时尚茶礼，品质生活','米奇纪念茶','img/index_product/19.jpg',79,'1801 · 100g','/commodity-detail/22'),
(NULL,'大益茶庭','时尚茶礼，品质生活','小金豆礼盒','img/index_product/20.jpg',128,'1801 · 108g','/commodity-detail/23'),
(NULL,'大益茶庭','时尚茶礼，品质生活','迷你小金砖','img/index_product/21.jpg',99,'1701 · 35g×4','/commodity-detail/24'),
(NULL,'大益茶庭','时尚茶礼，品质生活','小青柑+小青柠','img/index_product/18.jpg',199,'青柑+青柠组合','/commodity-detail/21'),
(NULL,'大益茶庭','时尚茶礼，品质生活','米奇纪念茶','img/index_product/19.jpg',79,'1801 · 100g','/commodity-detail/22'),
(NULL,'大益茶庭','时尚茶礼，品质生活','小金豆礼盒','img/index_product/20.jpg',128,'1801 · 108g','/commodity-detail/23'),
(NULL,'大益茶庭','时尚茶礼，品质生活','迷你小金砖','img/index_product/21.jpg',99,'1701 · 35g×4','/commodity-detail/24'),
(NULL,'质美茶器','笠冠暮暮，福荫迢迢','三阳开泰','img/index_product/22.png',398,'250cc','/commodity-detail/25'),
(NULL,'质美茶器','笠冠暮暮，福荫迢迢','如是 · 文旦','img/index_product/23.jpg',799,'140cc','/commodity-detail/26'),
(NULL,'质美茶器','笠冠暮暮，福荫迢迢','小坐 · 梨式','img/index_product/24.jpg',1688,'210cc','/commodity-detail/27'),
(NULL,'质美茶器','笠冠暮暮，福荫迢迢','秋硕壶','img/index_product/25.png',1399,'180cc','/commodity-detail/28'),
(NULL,'质美茶器','笠冠暮暮，福荫迢迢','圆融','img/index_product/26.jpg',899,'200cc','/commodity-detail/29'),
(NULL,'茶礼甄选','有礼，方能立事','花好月圆','img/index_product/27.jpg',258,'生熟套组','/commodity-detail/30'),
(NULL,'茶礼甄选','有礼，方能立事','大益有礼','img/index_product/28.jpg',198,'1801 · 200g×2','/commodity-detail/31'),
(NULL,'茶礼甄选','有礼，方能立事','幸福安和','img/index_product/29.png',258,'生熟套组','/commodity-detail/32'),
(NULL,'茶礼甄选','有礼，方能立事','鸾翔凤集','img/index_product/30.jpg',628,'茶礼套组','/commodity-detail/33'),
(NULL,'茶礼甄选','有礼，方能立事','福禄双喜','img/index_product/31.jpg',298,'1901 · 357×2','/commodity-detail/34'),
(NULL,'习茶有道','凡益之道，与时皆行','茶道九章','img/index_product/32.jpg',49,'书籍','/commodity-detail/35'),
(NULL,'习茶有道','凡益之道，与时皆行','精通普洱','img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'习茶有道','凡益之道，与时皆行','茶道与文学','img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'习茶有道','凡益之道，与时皆行','茶悟人生','img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'习茶有道','凡益之道，与时皆行','紫砂艺术','img/index_product/36.png',52,'书籍','/commodity-detail/39');
/***商品列表大图****/
CREATE TABLE dy_commodity_list_img(
  imgid INT PRIMARY KEY AUTO_INCREMENT,   #首页商品i
  img VARCHAR(128),    #商品图片
  title VARCHAR(34)    #图片名称
);
/***商品列表大图****/
INSERT INTO dy_commodity_list_img VALUES
(NULL,'img/list_img/01.png','熟茶'),
(NULL,'img/list_img/02.png','生茶'),
(NULL,'img/list_img/03.png','茶器'),
(NULL,'img/list_img/04.jpg','茶道'),
(NULL,'img/list_img/05.png','茶庭'),
(NULL,'img/list_img/06.jpg','宝盒'),
(NULL,'img/list_img/07.jpg','食鲜');
/****商品列表****/
CREATE TABLE dy_commodity_list(
  nid INT PRIMARY KEY AUTO_INCREMENT,   #首页商品id
  title VARCHAR(64),     #商品类别
  product_name VARCHAR(64), #商品名称
  shopfname VARCHAR(64),    #商品副标题
  shelf_time BIGINT,          #上架时间
  counts INT,                  #剩余数量
  sold_count INT,             #已售出的数量
  simg VARCHAR(128),     #商品图片
  price DECIMAL(10,2),   #商品价格
  spec VARCHAR(64),      #商品规格
  href VARCHAR(128)    #跳转地址
);
INSERT INTO dy_commodity_list VALUES
(NULL,'食鲜','布朗山',"即食野生油鸡纵菌酱",1581009625028,0,23,'img/index_product/01.jpg',245,'1901 . 150g','/commodity-detail/3'),
(NULL,'食鲜','益原素',"乌蒙深山，泉水竹笋",1581009625028,120,65,'img/index_product/02.jpg',228,'1901 · 120g','/commodity-detail/4'),
(NULL,'食鲜','益原素',"香格里拉野生松茸",1581009625028,120,43,'img/index_product/04.jpg',428,'1801 · 357g','/commodity-detail/6'),
(NULL,'食鲜','益原素茶晶',"香格里拉野生松茸",1581009626666,120,123,'img/index_product/05.jpg',273,'1901 . 28g/56g','/commodity-detail/7'),
(NULL,'食鲜','花草原叶袋泡组合',"香格里拉野生松茸",1581009626666,120,12,'img/index_product/06.jpg',159,'花草袋泡组合 · 36g×4','/commodity-detail/8'),
(NULL,'食鲜','小青柑',"香格里拉野生松茸",1581009627743,120,65,'img/index_product/07.jpg',150,'1901 · 110g','/commodity-detail/9'),
(NULL,'食鲜','益原素',"香格里拉野生松茸",1581009627843,120,34,'img/index_product/04.jpg',428,'1801 · 357g','/commodity-detail/6'),
(NULL,'食鲜','益原素茶晶',"乌蒙深山，泉水竹笋",1581009628843,120,234,'img/index_product/07.jpg',150,'1901 · 110g','/commodity-detail/9'),
(NULL,'熟茶','7572','四季沐歌，春山如笑',1581009627843,120,34,'img/index_product/05.jpg',123,'1901 . 28g/56g','/commodity-detail/7'),
(NULL,'食鲜','花草原叶袋泡组合',"乌蒙深山，泉水竹笋",1581009628843,120,23,'img/index_product/06.jpg',159,'花草袋泡组合 · 36g×4','/commodity-detail/8'),
(NULL,'食鲜','小青柑',"乌蒙深山，泉水竹笋",1581009628866,120,45,'img/index_product/09.png',55,'1901 · 100g','/commodity-detail/11'),
(NULL,'熟茶','兄弟起风了','四季沐歌，春山如笑',1581009624442,120,314,'img/index_product/10.jpg',68,'1601 · 357g','/commodity-detail/12'),
(NULL,'熟茶','大益一级散茶','四季沐歌，春山如笑',1581009626662,120,34,'img/index_product/11.jpg',249,'1701 · 125g','/commodity-detail/13'),
(NULL,'熟茶','小龙柱','四季沐歌，春山如笑',1581009626662,120,34,'img/index_product/12.png',268,'1801 · 357g','/commodity-detail/14'),
(NULL,'熟茶','兄弟起风了','四季沐歌，春山如笑',1581009624499,120,4,'img/index_product/10.jpg',68,'1601 · 357g','/commodity-detail/12'),
(NULL,'熟茶','大益一级散茶','四季沐歌，春山如笑',1581009626676,120,334,'img/index_product/11.jpg',254,'1701 · 125g','/commodity-detail/13'),
(NULL,'熟茶','小龙柱','四季沐歌，春山如笑',1581009626663,120,54,'img/index_product/12.png',268,'1801 · 357g','/commodity-detail/14'),
(NULL,'熟茶','兄弟起风了','四季沐歌，春山如笑',1581009624499,120,4,'img/index_product/10.jpg',69,'1601 · 357g','/commodity-detail/12'),
(NULL,'熟茶','大益一级散茶','四季沐歌，春山如笑',1581009626676,120,334,'img/index_product/11.jpg',249,'1701 · 125g','/commodity-detail/13'),
(NULL,'熟茶','小龙柱','四季沐歌，春山如笑',1581009626663,120,54,'img/index_product/12.png',268,'1801 · 357g','/commodity-detail/14'),
(NULL,'生茶','蜜香','福禄盈门，双麒贺喜',1581009625555,120,34,'img/index_product/13.jpg',128,'1901 · 300g','/commodity-detail/16'),
(NULL,'生茶','普知味3年陈','福禄盈门，双麒贺喜',1581009625775,120,234,'img/index_product/14.jpg',118,'1901 · 357g','/commodity-detail/17'),
(NULL,'生茶','7542','福禄盈门，双麒贺喜',1581009623333,120,145,'img/index_product/15.png',98,'1401 · 150g','/commodity-detail/18'),
(NULL,'生茶','甲级沱茶','福禄盈门，双麒贺喜',1581009627777,120,15,'img/index_product/16.jpg',160,'1801 · 100g×5','/commodity-detail/19'),
(NULL,'生茶','蜜香','福禄盈门，双麒贺喜',1581009625555,120,34,'img/index_product/13.jpg',128,'1901 · 300g','/commodity-detail/16'),
(NULL,'生茶','普知味3年陈','福禄盈门，双麒贺喜',1581009625775,120,234,'img/index_product/14.jpg',118,'1901 · 357g','/commodity-detail/17'),
(NULL,'生茶','7542','福禄盈门，双麒贺喜',1581009623333,120,145,'img/index_product/15.png',98,'1401 · 150g','/commodity-detail/18'),
(NULL,'生茶','甲级沱茶','福禄盈门，双麒贺喜',1581009627777,120,15,'img/index_product/16.jpg',160,'1801 · 100g×5','/commodity-detail/19'),
(NULL,'生茶','蜜香','福禄盈门，双麒贺喜',1581009625555,120,34,'img/index_product/13.jpg',128,'1901 · 300g','/commodity-detail/16'),
(NULL,'生茶','普知味3年陈','福禄盈门，双麒贺喜',1581009625775,120,234,'img/index_product/14.jpg',118,'1901 · 357g','/commodity-detail/17'),
(NULL,'生茶','7542','福禄盈门，双麒贺喜',1581009623333,120,145,'img/index_product/15.png',98,'1401 · 150g','/commodity-detail/18'),
(NULL,'生茶','甲级沱茶','福禄盈门，双麒贺喜',1581009627777,120,15,'img/index_product/16.jpg',160,'1801 · 100g×5','/commodity-detail/19'),
(NULL,'茶庭','小青柑+小青柠','云上细雨，香甜如蜜',81009625544,120,34,'img/index_product/18.jpg',199,'青柑+青柠组合','/commodity-detail/21'),
(NULL,'茶庭','米奇纪念茶','云上细雨，香甜如蜜',81009625544,120,34,'img/index_product/19.jpg',79,'1801 · 100g','/commodity-detail/22'),
(NULL,'茶庭','小金豆礼盒','云上细雨，香甜如蜜',81009625654,120,134,'img/index_product/20.jpg',128,'1801 · 108g','/commodity-detail/23'),
(NULL,'茶庭','迷你小金砖','米奇90周年纪念茶',81009625774,120,134,'img/index_product/21.jpg',99,'1701 · 35g×4','/commodity-detail/24'),
(NULL,'茶庭','小青柑+小青柠','米奇90周年纪念茶',81009625544,120,34,'img/index_product/18.jpg',199,'青柑+青柠组合','/commodity-detail/21'),
(NULL,'茶庭','米奇纪念茶','米奇90周年纪念茶',81009625774,120,534,'img/index_product/19.jpg',79,'1801 · 100g','/commodity-detail/22'),
(NULL,'茶庭','小金豆礼盒','米奇90周年纪念茶',81009625788,120,534,'img/index_product/20.jpg',128,'1801 · 108g','/commodity-detail/23'),
(NULL,'茶庭','迷你小金砖','米奇90周年纪念茶',810096254564,120,334,'img/index_product/21.jpg',99,'1701 · 35g×4','/commodity-detail/24'),
(NULL,'茶庭','小青柑+小青柠','云上细雨，香甜如蜜',81009625544,120,34,'img/index_product/18.jpg',199,'青柑+青柠组合','/commodity-detail/21'),
(NULL,'茶庭','米奇纪念茶','云上细雨，香甜如蜜',81009625544,120,34,'img/index_product/19.jpg',79,'1801 · 100g','/commodity-detail/22'),
(NULL,'茶庭','小金豆礼盒','云上细雨，香甜如蜜',81009625654,120,134,'img/index_product/20.jpg',128,'1801 · 108g','/commodity-detail/23'),
(NULL,'茶庭','迷你小金砖','米奇90周年纪念茶',81009625774,120,134,'img/index_product/21.jpg',99,'1701 · 35g×4','/commodity-detail/24'),
(NULL,'茶庭','小青柑+小青柠','米奇90周年纪念茶',81009625544,120,34,'img/index_product/18.jpg',199,'青柑+青柠组合','/commodity-detail/21'),
(NULL,'茶庭','米奇纪念茶','米奇90周年纪念茶',81009625774,120,534,'img/index_product/19.jpg',79,'1801 · 100g','/commodity-detail/22'),
(NULL,'茶庭','小金豆礼盒','米奇90周年纪念茶',81009625788,120,534,'img/index_product/20.jpg',128,'1801 · 108g','/commodity-detail/23'),
(NULL,'茶庭','迷你小金砖','米奇90周年纪念茶',810096254564,120,334,'img/index_product/21.jpg',99,'1701 · 35g×4','/commodity-detail/24'),
(NULL,'茶器','如是 · 文旦','云上细雨，香甜如蜜',810096276,120,46,'img/index_product/23.jpg',799,'140cc','/commodity-detail/26'),
(NULL,'茶器','小坐 · 梨式','云上细雨，香甜如蜜',81009621254,120,49,'img/index_product/24.jpg',1688,'210cc','/commodity-detail/27'),
(NULL,'茶器','秋硕壶','云上细雨，香甜如蜜',81009625664,120,334,'img/index_product/25.png',1399,'180cc','/commodity-detail/28'),
(NULL,'茶器','圆融','云上细雨，香甜如蜜',81009625234,120,534,'img/index_product/26.jpg',899,'200cc','/commodity-detail/29'),
(NULL,'茶器','如是 · 文旦','云上细雨，香甜如蜜',81009627645,120,46,'img/index_product/23.jpg',799,'140cc','/commodity-detail/26'),
(NULL,'茶器','小坐 · 梨式','云上细雨，香甜如蜜',81009621254,120,49,'img/index_product/24.jpg',1688,'210cc','/commodity-detail/27'),
(NULL,'茶器','秋硕壶','云上细雨，香甜如蜜',81009625664,120,334,'img/index_product/25.png',1399,'180cc','/commodity-detail/28'),
(NULL,'茶器','圆融','云上细雨，香甜如蜜',81009625234,120,534,'img/index_product/26.jpg',899,'200cc','/commodity-detail/29'),
(NULL,'茶器','如是 · 文旦','云上细雨，香甜如蜜',81009627656,120,46,'img/index_product/23.jpg',799,'140cc','/commodity-detail/26'),
(NULL,'茶器','小坐 · 梨式','云上细雨，香甜如蜜',81009621254,120,49,'img/index_product/24.jpg',1688,'210cc','/commodity-detail/27'),
(NULL,'茶器','秋硕壶','云上细雨，香甜如蜜',81009625664,120,334,'img/index_product/25.png',1399,'180cc','/commodity-detail/28'),
(NULL,'茶器','圆融','云上细雨，香甜如蜜',81009625234,120,534,'img/index_product/26.jpg',899,'200cc','/commodity-detail/29'),
(NULL,'宝盒','大益有礼','一旬时光的沉淀',81009627656,120,46,'img/index_product/28.jpg',198,'1801 · 200g×2','/commodity-detail/31'),
(NULL,'宝盒','幸福安和','璀璨星光，耀动亚洲',81009625234,120,134,'img/index_product/29.png',258,'生熟套组','/commodity-detail/32'),
(NULL,'宝盒','鸾翔凤集','一旬时光的沉淀',81009627656,120,46,'img/index_product/30.jpg',628,'茶礼套组','/commodity-detail/33'),
(NULL,'宝盒','福禄双喜','璀璨星光，耀动亚洲',81009625234,120,134,'img/index_product/31.jpg',298,'1901 · 357×2','/commodity-detail/34'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39'),
(NULL,'茶道','精通普洱','大益文学第七期',810096276563,120,466,'img/index_product/33.png',65,'书籍','/commodity-detail/36'),
(NULL,'茶道','茶道与文学','大益文学第七期',810096276765,120,6,'img/index_product/34.png',39,'书籍','/commodity-detail/37'),
(NULL,'茶道','茶悟人生','大益文学第三期',81009626554,120,4,'img/index_product/35.png',49,'书籍','/commodity-detail/38'),
(NULL,'茶道','紫砂艺术','大益文学第三期',81009626932,120,15,'img/index_product/36.png',52,'书籍','/commodity-detail/39');
/** 商品规格***/
CREATE TABLE dy_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  hid INT,                    #所属商品id
  lname VARCHAR(32),          #品牌
  os VARCHAR(32),             #原料
  memory VARCHAR(32),         #类型
  resolution VARCHAR(32),     #批次
  video_card VARCHAR(32),     #净重
  cpu VARCHAR(32),            #形态
  video_memory VARCHAR(32),   #工艺
  category VARCHAR(32),       #包装
  disk VARCHAR(32),          #保质期
  ssk VARCHAR(32)            #存储条件
);
INSERT INTO dy_laptop VALUES
(NULL,1,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,2,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,3,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,4,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,5,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,6,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,7,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,8,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,9,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,10,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,11,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,12,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,13,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,14,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,15,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,16,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,17,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,18,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,19,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,20,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,21,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,22,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,23,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,24,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,25,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境"),
(NULL,26,"品牌：大益","原料：云南大叶种晒青毛茶","生熟：普洱茶生熟组合","批次：1901"," 净重：714g","形态：饼茶","工艺：大益制茶技艺","包装：礼盒包装","保质期：普洱茶在适宜的存储环境下可长期存放且越陈越香","储藏条件：通风、干燥、避光、无异味的存储环境");
/** 商品详情图片***/
CREATE TABLE dy_laptop_img(
  gid INT PRIMARY KEY AUTO_INCREMENT,
  hid INT,                    #所属商品id
  img1 VARCHAR(32),
  img2 VARCHAR(32),
  img3 VARCHAR(32),
  img4 VARCHAR(32),
  img5 VARCHAR(32),
  img6 VARCHAR(32),
  img7 VARCHAR(32),
  img8 VARCHAR(32),
  img9 VARCHAR(32),
  img10 VARCHAR(32),
  img11 VARCHAR(32),
  img12 VARCHAR(32),
  img13 VARCHAR(32),
  img14 VARCHAR(32),
  img15 VARCHAR(32),
  img16 VARCHAR(32),
  img17 VARCHAR(32),
  img18 VARCHAR(32),
  img19 VARCHAR(32),
  img20 VARCHAR(32),
  img21 VARCHAR(32),
  img22 VARCHAR(32),
  img23 VARCHAR(32),
  img24 VARCHAR(32),
  img25 VARCHAR(32),
  img26 VARCHAR(32),
  img27 VARCHAR(32),
  img28 VARCHAR(32),
  img29 VARCHAR(32),
  img30 VARCHAR(32),
  img31 VARCHAR(32),
  img32 VARCHAR(32),
  img33 VARCHAR(32),
  img34 VARCHAR(32),
  img35 VARCHAR(32),
  img36 VARCHAR(32),
  img37 VARCHAR(32),
  img38 VARCHAR(32),
  img39 VARCHAR(32),
  img40 VARCHAR(32)
);
INSERT INTO dy_laptop_img VALUES
(NULL,1,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,2,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,3,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,4,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,5,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,6,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,7,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,8,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,9,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,10,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,11,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,12,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,13,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,14,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,15,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,16,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,17,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,18,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,19,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,20,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg"),
(NULL,21,"img/dy_laptop_img/01.jpg","img/dy_laptop_img/02.jpg","img/dy_laptop_img/03.jpg","img/dy_laptop_img/04.jpg","img/dy_laptop_img/05.jpg","img/dy_laptop_img/06.jpg","img/dy_laptop_img/07.jpg","img/dy_laptop_img/08.jpg","img/dy_laptop_img/09.jpg","img/dy_laptop_img/10.jpg","img/dy_laptop_img/11.jpg","img/dy_laptop_img/12.jpg","img/dy_laptop_img/13.jpg","img/dy_laptop_img/14.jpg","img/dy_laptop_img/15.jpg","img/dy_laptop_img/16.jpg","img/dy_laptop_img/17.jpg","img/dy_laptop_img/18.jpg","img/dy_laptop_img/19.jpg","img/dy_laptop_img/20.jpg","img/dy_laptop_img/21.jpg","img/dy_laptop_img/22.jpg","img/dy_laptop_img/23.jpg","img/dy_laptop_img/24.jpg","img/dy_laptop_img/25.jpg","img/dy_laptop_img/26.jpg","img/dy_laptop_img/27.jpg","img/dy_laptop_img/28.jpg","img/dy_laptop_img/29.jpg","img/dy_laptop_img/30.jpg","img/dy_laptop_img/31.jpg","img/dy_laptop_img/32.jpg","img/dy_laptop_img/33.jpg","img/dy_laptop_img/34.jpg","img/dy_laptop_img/35.jpg","img/dy_laptop_img/36.jpg","img/dy_laptop_img/37.jpg","img/dy_laptop_img/38.jpg","img/dy_laptop_img/39.jpg","img/dy_laptop_img/40.jpg");
/****购物车****/
CREATE TABLE dy_shopping_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  shopp_id INT,    #商品id
  shopp_img VARCHAR(36), #商品图片
  shopp_title VARCHAR(36),  #商品名字
  shopp_price DECIMAL(10,2), #商品价格
  shopp_count INT,   #商品数量
  spec VARCHAR(64),   #商品规格
  href VARCHAR(128),   #跳转地址
  uid INT              #用户id
);
/**收货地址信息**/
CREATE TABLE dy_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  is_default BOOLEAN          #是否为当前用户的默认收货地址
);
/**用户订单**/
CREATE TABLE dy_order(
  xid INT PRIMARY KEY AUTO_INCREMENT,   #订单编号
  user_id INT,            #用户id
  address_id INT,         #收货地址id
  user_idshop_id INT,            #商品id 
  count INT,              #商品数量
  price DECIMAL(10,2),    #商品价格
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT,   #签收时间
  bz VARCHAR(160)         #备注消息
)
