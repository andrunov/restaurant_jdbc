DELETE FROM users;
DELETE FROM roles;
DELETE FROM restaurants;
DELETE FROM menu_lists;
DELETE FROM orders;
DELETE FROM dishes;
DELETE FROM orders_dishes;

ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users(name,email,password,enabled,totalOrdersAmount) VALUES
  ('Вадим Гордеев','vgordeev.78@gmail.com','111222777','TRUE',671.0),
  ('Роман Елисеев','r_eliseev78yandex.ru','222333555','TRUE',1109.0),
  ('Полина Потапова','p.polya_1985@mail.ru','password','TRUE',796.0),
  ('Ростислав Крылов','krylov.rs@yandex.ru','password','TRUE',688.1),
  ('Вячеслав Шубин','slava_shubin@yahoo.com','password','TRUE',878.2),
  ('Алина Ковалёва','kov.alina@gmail.com','password','TRUE',889.6),
  ('Евгения Морозова','g.morozova@mail.ru','password','TRUE',590.0),
  ('Эдуард Симонов','esimonov@gmail.com','password','FALSE',464.0),
  ('Кирилл Тарасов','k_tarasov86@gmail.com','password','TRUE',668.3),
  ('Ирина Шубина','irisha_1978@yandex.ru','password','TRUE',752.0);

INSERT INTO roles(user_id, role) VALUES
  (100000,'ROLE_USER'),
  (100001,'ROLE_ADMIN'),
  (100002,'ROLE_USER'),
  (100003,'ROLE_USER'),
  (100004,'ROLE_USER'),
  (100005,'ROLE_USER'),
  (100006,'ROLE_USER'),
  (100007,'ROLE_USER'),
  (100008,'ROLE_USER'),
  (100009,'ROLE_USER');

INSERT INTO restaurants(name, address) VALUES
  ('Рандеву','ул. Некрасова, 7'),
  ('Прованс','пл. Пушкина, 6'),
  ('Бригантина','Привокзальная пл, 3'),
  ('Алые паруса','ул. Баррикадная, 17'),
  ('Дюймовочка','ул. Василевского, 25'),
  ('Золотая хохлома','ул. Декабристов, 62'),
  ('Юбилейное','ул. Балчуг, 75'),
  ('Пегас','ул. Советская, 52'),
  ('Мираж','ул. Железнодорожников, 8'),
  ('Глобус','ул. Журавлёва, 29');

INSERT INTO menu_lists(restaurant_id, description, date_time, enabled) VALUES
  (100010,'Меню на 30.09','2017-09-30 10:30:00','FALSE'),
  (100010,'Меню на 25.09','2017-09-25 16:30:00','FALSE'),
  (100010,'Меню на 01.10','2017-10-01 16:30:00','TRUE'),
  (100011,'Меню на сентябрь','2017-09-01 15:45:00','FALSE'),
  (100011,'Меню на октябрь','2017-10-01 15:45:00','TRUE'),
  (100012,'Обед','2017-10-01 15:40:00','FALSE'),
  (100012,'Обед','2017-10-02 15:32:00','TRUE'),
  (100013,'Меню, сентябрь','2017-09-02 15:32:00','FALSE'),
  (100013,'Меню, октябрь','2017-10-02 15:32:00','TRUE'),
  (100014,'Меню','2017-09-30 15:32:00','FALSE'),
  (100014,'Меню','2017-10-01 15:32:00','FALSE'),
  (100014,'Меню','2017-10-02 15:32:00','TRUE'),
  (100015,'Меню','2017-09-24 15:32:00','FALSE'),
  (100015,'Меню','2017-09-27 15:32:00','FALSE'),
  (100015,'Меню','2017-10-02 15:32:00','TRUE'),
  (100016,'Завтрак','2017-09-02 15:32:00','FALSE'),
  (100016,'Обед','2017-09-02 15:32:00','FALSE'),
  (100016,'Ужин','2017-09-02 15:32:00','FALSE'),
  (100016,'Завтрак','2017-10-02 15:32:00','TRUE'),
  (100016,'Обед','2017-10-02 15:32:00','TRUE'),
  (100016,'Ужин','2017-10-02 15:32:00','TRUE'),
  (100017,'Меню на сентябрь','2017-09-01 15:45:00','FALSE'),
  (100017,'Меню на октябрь','2017-10-01 15:45:00','TRUE'),
  (100018,'Меню','2017-10-01 15:32:00','FALSE'),
  (100018,'Меню','2017-10-02 15:32:00','TRUE'),
  (100019,'Меню сентябрь','2017-09-01 15:32:00','FALSE'),
  (100019,'Меню октябрь','2017-10-02 15:32:00','TRUE');

INSERT INTO dishes( menu_list_id,description,price) VALUES
  (100020,'Блинчики',25.25),
  (100020,'Сырники',27.45),
  (100020,'Салат «Апрель»',12.40),
  (100020,'Гуляш говяжий',50.00),
  (100020,'Картофельное пюре',20.00),
  (100020,'Гуляш говяжий',50.00),
  (100020,'Чай черный',8.00),
  (100020,'Чай зеленый',8.00),
  (100020,'Кофе',9.00),
  (100021,'Блинчики',28.25),
  (100021,'Сырники',30.45),
  (100021,'Салат «Апрель»',15.40),
  (100021,'Салат «Сельдь п/шубой»',25.50),
  (100021,'Гуляш говяжий',50.60),
  (100021,'Голубцы ленивые',30.50),
  (100021,'Картофельное пюре',25.60),
  (100021,'Гуляш говяжий',50.60),
  (100021,'Чай черный',9.00),
  (100021,'Чай зеленый',9.00),
  (100021,'Кофе',10.20),
  (100022,'Блинчики',29.45),
  (100022,'Сырники',32.45),
  (100022,'Салат «Апрель»',17.40),
  (100022,'Салат «Сельдь п/шубой»',29.50),
  (100022,'Гуляш говяжий',55.40),
  (100022,'Голубцы ленивые',35.60),
  (100022,'Картофельное пюре',20.00),
  (100022,'Гуляш говяжий',50.00),
  (100022,'Чай черный',9.00),
  (100022,'Чай зеленый',9.00),
  (100022,'Кофе',10.20),
  (100023,'Бульон',30.00),
  (100023,'Суп-пюре грибной',45.00),
  (100023,'Солянка мясная',55.00),
  (100023,'Рыба запеченая',50.00),
  (100023,'Цыпленок табака',70.00),
  (100023,'Картофель жареный',20.00),
  (100023,'Картофель запеченый',25.00),
  (100023,'Морс',10.00),
  (100023,'Чай',5.00),
  (100023,'Кофе',5.00),
  (100024,'Бульон',35.00),
  (100024,'Суп-пюре грибной',50.00),
  (100024,'Солянка мясная',60.00),
  (100024,'Рыба запеченая',55.00),
  (100024,'Жаркое по-деревенски',55.00),
  (100024,'Картофель жареный',25.00),
  (100024,'Картофель запеченый',20.00),
  (100024,'Морс',10.00),
  (100024,'Чай',5.00),
  (100024,'Кофе',5.00),
  (100025,'Овощная доска',25.00),
  (100025,'Плато мясное',98.00),
  (100025,'Карпаччо из сёмги',87.00),
  (100025,'Застолье пиратов',125.00),
  (100025,'Капитан Морган',25.00),
  (100025,'Ромовая Рапсодия',35.00),
  (100025,'Амаретто Джаз',25.00),
  (100026,'Овощная доска',26.00),
  (100026,'Плато мясное',95.00),
  (100026,'Рыбная нарезка',64.00),
  (100026,'Застолье пиратов XXL',135.00),
  (100026,'Капитан Морган',23.00),
  (100026,'Ромовая Рапсодия',35.00),
  (100026,'Амаретто Джаз',25.00),
  (100027,'Салат "Греческий"',45.00),
  (100027,'Салат "Цезарь"',45.00),
  (100027,'Лапша грибная',55.00),
  (100027,'Мясная солянка',65.00),
  (100027,'Филе Мурманской трески',105.00),
  (100027,'Бифштекс рубленный под яйцом',122.00),
  (100027,'Фреш апельсиновый',25.00),
  (100027,'Минеральная вода "Харрогейт"',20.00),
  (100027,'Квас',25.00),
  (100028,'Салат "Греческий"',45.00),
  (100028,'Салат "Цезарь"',45.00),
  (100028,'Суп-крем из шпината',75.00),
  (100028,'Уха по-Камчатски',85.00),
  (100028,'Филе Мурманской трески',105.00),
  (100028,'Бифштекс рубленный под яйцом',122.00),
  (100028,'Сок апельсиновый',15.00),
  (100028,'Минеральная вода "Харрогейт"',20.00),
  (100028,'Пиво Калнапилис',35.00),
  (100029,'Пицца «Чипполино»',35.00),
  (100029,'Салатик «Аленький цветочек»',45.00),
  (100029,'Яичница глазунья «Солнышко»',40.00),
  (100029,'Блинчики с осетриной',55.00),
  (100029,'Блинчики с мясом',60.00),
  (100029,'Блинчики с вареньем',50.00),
  (100029,'Жульен из курочки',80.00),
  (100029,'Лимонад',30.00),
  (100029,'Компотик',25.00),
  (100030,'Пицца «Чипполино»',39.00),
  (100030,'Салатик «Аленький цветочек»',50.00),
  (100030,'Яичница глазунья «Солнышко»',45.00),
  (100030,'Блинчики с осетриной',60.00),
  (100030,'Блинчики с мясом',60.00),
  (100030,'Блинчики с вареньем',55.00),
  (100030,'Жульен из курочки',70.00),
  (100030,'Лимонад',20.00),
  (100030,'Компотик',20.00),
  (100031,'Пицца «Чипполино»',45.00),
  (100031,'Салатик «Аленький цветочек»',56.00),
  (100031,'Яичница глазунья «Солнышко»',47.00),
  (100031,'Блинчики с осетриной',68.00),
  (100031,'Блинчики с мясом',65.00),
  (100031,'Блинчики с вареньем',60.00),
  (100031,'Жульен из курочки',80.00),
  (100031,'Лимонад',20.00),
  (100031,'Компотик',20.00),
  (100032,'Закуска',20.00),
  (100032,'Щи',40.00),
  (100032,'Суп-лапша домашняя',48.00),
  (100032,'Солянка сборная мясная',60.00),
  (100032,'Рыба по барски',73.00),
  (100032,'Жаркое по русски',89.00),
  (100032,'Водка',20.00),
  (100032,'Пиво',20.00),
  (100032,'Чай',10.00),
  (100033,'Салат традиционный',30.00),
  (100033,'Салат крабовый',35.00),
  (100033,'Щи',40.00),
  (100033,'Суп-лапша домашняя',48.00),
  (100033,'Солянка сборная мясная',60.00),
  (100033,'Рыба в горшочке',65.00),
  (100033,'Жаркое по русски',89.00),
  (100033,'Водка',20.00),
  (100033,'Пиво',20.00),
  (100033,'Чай',10.00),
  (100034,'Салат традиционный',31.50),
  (100034,'Ассорти рыбное',42.00),
  (100034,'Щи',43.70),
  (100034,'Суп-лапша домашняя',52.30),
  (100034,'Эскалоп из свинины',65.00),
  (100034,'Рыба в горшочке',65.00),
  (100034,'Жаркое по русски',89.00),
  (100034,'Водка',20.00),
  (100034,'Пиво',20.00),
  (100034,'Чай',10.00),
  (100035,'Блины с творогом',30.00),
  (100035,'Каша овсяная',20.00),
  (100035,'Каша пшенная',20.00),
  (100035,'Сырники',35.00),
  (100035,'Омлет',42.00),
  (100035,'Оладьи со сметаной',27.00),
  (100035,'Чай черный',10.00),
  (100035,'Кофе черный',12.00),
  (100035,'Кофе с молоком',12.00),
  (100036,'Салат «Апрель»',12.00),
  (100036,'Котлета рыбная «Афродита»',12.00),
  (100036,'Поджарка свинная ',40.00),
  (100036,'Голубцы мясо/рис',42.00),
  (100036,'Жаркое по-домашнему',49.00),
  (100036,'Чай черный',10.00),
  (100036,'Кофе черный',12.00),
  (100036,'Кофе с молоком',12.00),
  (100037,'Салат из ев капусты с краб.палочками',20.00),
  (100037,'Борщ со ев капустой с фрикадел',30.00),
  (100037,'Рыба жареная в яйце',32.00),
  (100037,'Азу по-татарски',41.00),
  (100037,'Картофельное пюре',18.00),
  (100037,'Каша гречневая',14.00),
  (100037,'Чай черный',10.00),
  (100037,'Кофе черный',12.00),
  (100037,'Кофе с молоком',12.00),
  (100038,'Блины с творогом',32.00),
  (100038,'Каша овсяная',24.00),
  (100038,'Каша пшенная',22.00),
  (100038,'Сырники',37.00),
  (100038,'Омлет',44.00),
  (100038,'Оладьи со сметаной',28.00),
  (100038,'Чай черный',12.00),
  (100038,'Кофе черный',12.00),
  (100038,'Кофе с молоком',12.00),
  (100039,'Салат «Апрель»',14.00),
  (100039,'Котлета рыбная «Афродита»',14.00),
  (100039,'Поджарка свинная ',44.00),
  (100039,'Голубцы мясо/рис',45.00),
  (100039,'Жаркое по-домашнему',52.00),
  (100039,'Чай черный',10.00),
  (100039,'Кофе черный',12.00),
  (100039,'Кофе с молоком',12.00),
  (100040,'Салат из ев капусты с краб.палочками',22.00),
  (100040,'Борщ со ев капустой с фрикадел',32.00),
  (100040,'Рыба жареная в яйце',35.00),
  (100040,'Азу по-татарски',45.00),
  (100040,'Картофельное пюре',17.00),
  (100040,'Каша гречневая',15.00),
  (100040,'Чай черный',10.00),
  (100040,'Кофе черный',12.00),
  (100040,'Кофе с молоком',12.00),
  (100041,'Рис с овощами',17.00),
  (100041,'Макаронные изделия с ветчиной',24.00),
  (100041,'Картофельное пюре',18.00),
  (100041,'Рис с грибами',22.00),
  (100041,'Напиток из вишни',12.00),
  (100041,'Напиток из малины',12.00),
  (100041,'Соки в ассортименте',14.00),
  (100041,'Чай с сахаром/лимоном',8.00),
  (100041,'Рис с сыром',19.00),
  (100042,'Гречка с грибами',28.00),
  (100042,'Картофельное пюре',19.00),
  (100042,'Рис с овощами',20.00),
  (100042,'Напиток из вишни',12.00),
  (100042,'Напиток из малины',12.00),
  (100042,'Соки в ассортименте',14.00),
  (100042,'Чай с сахаром/лимоном',8.00),
  (100043,'Салат "Синьор помидор"',18.00),
  (100043,'Салат "Морской бриз"',28.00),
  (100043,'Салат "Жозефина"',24.00),
  (100043,'Борщ',36.00),
  (100043,'Окрошка',39.00),
  (100043,'Тефтели',42.00),
  (100043,'Гуляш',45.00),
  (100043,'Рыба по-русски',36.00),
  (100043,'Напитки в ассортименте',9.00),
  (100044,'Салат "Синьор помидор',20.00),
  (100044,'Салат "Морской бриз"',30.00),
  (100044,'Борщ',38.00),
  (100044,'Окрошка',39.00),
  (100044,'Тефтели',42.00),
  (100044,'Гуляш',45.00),
  (100044,'Рыба по-русски',8.00),
  (100044,'Напитки в ассортименте',8.00),
  (100045,'Традиционный борщ',58.00),
  (100045,'Пельмени',36.00),
  (100045,'Блинчики с мясной начинкой',32.00),
  (100045,'Салат Винегрет',24.00),
  (100045,'Бефстроганов',68.00),
  (100045,'Кулебяка',72.00),
  (100045,'Ассорти из шашлыка',84.00),
  (100045,'Чай',8.00),
  (100045,'Кофе черный/с молоком',10.00),
  (100045,'Вода минеральная',5.00),
  (100046,'Традиционный борщ',58.00),
  (100046,'Венский Шницель',48.00),
  (100046,'Пельмени',36.00),
  (100046,'Хинкали',42.00),
  (100046,'Блинчики с мясной начинкой',32.00),
  (100046,'Салат Винегрет',24.00),
  (100046,'Бефстроганов',68.00),
  (100046,'Кулебяка',72.00),
  (100046,'Ассорти из шашлыка',84.00),
  (100046,'Чай',8.00),
  (100046,'Кофе черный/с молоком',10.00),
  (100046,'Вода минеральная',5.00);

INSERT INTO orders(user_id, restaurant_id, date_time, status, total_price) VALUES
  (100009,  100013, '2017-09-19 21:00:00',  'FINISHED',240),
  (100009,  100014, '2017-09-30 20:00:00',	'FINISHED',	140),
  (100009,  100013, '2017-10-04 19:00:00',	'FINISHED',	135),
  (100009,  100011,	'2017-10-09 10:22:00',	'READY'	,     110),
  (100005,  100017,	'2017-09-20 16:00:00',	'FINISHED',	72),
  (100005,  100015,	'2017-09-21 14:00:00',	'FINISHED',	90),
  (100005,  100011,	'2017-09-22 15:00:00',	'FINISHED',	75),
  (100005,  100010,	'2017-09-26 18:00:00',	'FINISHED',	100.6),
  (100005,  100016,	'2017-09-29 18:00:00',	'FINISHED',	90),
  (100005,  100016,	'2017-09-30 20:00:00',	'FINISHED',	72),
  (100005,  100013,	'2017-10-09 20:00:00',	'ACCEPTED',	200),
  (100005,  100019,	'2017-10-09 09:00:00',	'READY',	97),
  (100005,  100018,	'2017-10-09 17:00:00',	'PREPARING',	93),
  (100002,  100019,	'2017-09-20 19:00:00',	'FINISHED',	161),
  (100002,  100018,	'2017-10-03 18:00:00',	'FINISHED',	118),
  (100002,  100015,	'2017-10-05 20:00:00',	'FINISHED',	145),
  (100000,	100012,	'2017-10-01 18:00:00',	'FINISHED',	210),
  (100000,	100012,	'2017-10-09 08:31:00',	'READY'	,     167),
  (100003,	100017,	'2017-09-18 19:00:00',	'FINISHED',	36),
  (100003,	100019,	'2017-10-03 17:00:00',	'FINISHED',	116),
  (100003,	100015,	'2017-10-09 18:38:00',  'PREPARING',	201.3),
  (100007,	100014,	'2017-09-30 18:00:00',	'FINISHED',	80),
  (100007,	100018,	'2017-10-01 19:00:00',	'FINISHED',	75),
  (100007,	100017,	'2017-10-09 09:00:00',	'READY',	63),
  (100007,	100017,	'2017-10-09 16:00:00',	'PREPARING',	52),
  (100007,	100011,	'2017-10-09 21:50:47',	'ACCEPTED',	65),
  (100004,	100010,	'2017-09-26 18:00:00',	'FINISHED',	66.5),
  (100004,	100018,	'2017-10-02 20:00:00',	'FINISHED',	69),
  (100004,	100019,	'2017-10-02 18:00:00',	'FINISHED',	109),
  (100004,	100012,	'2017-10-05 22:00:00',	'FINISHED',	193),
  (100004,	100013,	'2017-10-09 17:55:00',	'PREPARING',	225),
  (100008,	100012,	'2017-10-01 22:00:00',	'FINISHED',	162),
  (100008,	100019,	'2017-10-04 20:00:00',	'FINISHED',	100),
  (100008,	100018,	'2017-10-05 21:00:00',	'FINISHED',	54),
  (100008,	100011,	'2017-10-06 20:00:00',	'FINISHED',	85),
  (100008,	100010,	'2017-10-09 23:08:13',	'ACCEPTED',	81.8),
  (100001,	100013,	'2017-09-12 13:00:00',	'FINISHED',	130),
  (100001,	100013,	'2017-09-15 14:00:00',	'FINISHED',	200),
  (100001,	100013,	'2017-09-22 13:00:00',	'FINISHED',	125),
  (100001,	100013,	'2017-09-29 13:00:00',	'FINISHED',	232),
  (100001,	100013,	'2017-10-09 23:17:22',	'ACCEPTED',	167),
  (100006,	100014,	'2017-10-03 16:00:00',	'FINISHED',	85),
  (100006,	100014,	'2017-10-06 18:00:00',	'FINISHED',	85),
  (100006,	100014,	'2017-10-09 10:18:00',	'PREPARING',	80),
  (100000,	100018,	'2017-10-09 18:26:39',	'PREPARING',	77),
  (100000,	100014,	'2017-10-09 21:25:00',	'ACCEPTED',	141),
  (100002,	100016,	'2017-09-21 19:00:00',	'FINISHED',	69),
  (100000,	100017,	'2017-09-05 18:00:00',	'FINISHED',	55),
  (100000,	100011,	'2017-09-14 17:00:00',	'FINISHED',	85),
  (100002,	100016,	'2017-10-09 09:00:00',	'READY',	76),
  (100004,	100015,	'2017-10-09 10:00:00',	'READY',	105.7),
  (100004,	100012,	'2017-10-09 23:00:00',	'ACCEPTED',	118),
  (100001,	100013,	'2017-10-09 10:00:00',	'READY',	145),
  (100001,	100013,	'2017-10-09 18:00:00',	'PREPARING',	110),
  (100006,	100014,	'2017-10-09 09:00:00',	'READY',	80),
  (100006,	100014,	'2017-10-09 22:22:08',	'ACCEPTED',	65),
  (100006,	100014,	'2017-10-01 18:00:00',	'FINISHED',	90),
  (100002,	100016,	'2017-10-09 18:00:00',	'PREPARING',	40),
  (100006,	100014,	'2017-09-30 11:00:00',	'FINISHED',	85),
  (100002,	100016,	'2017-10-09 21:00:00',	'ACCEPTED',	67),
  (100009,	100018,	'2017-10-09 19:00:00',	'PREPARING',	54),
  (100009,	100019,	'2017-10-09 23:00:00',	'ACCEPTED',	58),
  (100003,	100010,	'2017-09-25 18:00:00',	'FINISHED',	60.8),
  (100008,	100015,	'2017-10-09 10:00:00',	'READY',	130.5),
  (100008,	100018,	'2017-10-09 18:00:00',	'PREPARING',	55),
  (100003,	100013,	'2017-09-22 20:00:00',	'FINISHED',	175),
  (100002,	100016,	'2017-09-07 08:00:00',	'FINISHED',	59),
  (100002,	100016,	'2017-09-14 13:00:00',	'FINISHED',	73),
  (100003,	100012,	'2017-10-09 09:00:00',	'READY',	26),
  (100003,	100019,	'2017-10-09 22:47:24',	'ACCEPTED',	73),
  (100007,	100016,	'2017-09-13 14:00:00',	'FINISHED',	73),
  (100007,	100016,	'2017-09-27 18:00:00',	'FINISHED',	56);

INSERT INTO orders_dishes(order_id, dish_id,dish_quantity) VALUES
  (100293,	100115,	1),
  (100293,	100113,	1),
  (100293,	100116,	1),
  (100293,	100118,	1),
  (100294,	100136,	1),
  (100294,	100138,	1),
  (100294,	100130,	1),
  (100295,	100121,	1),
  (100295,	100127,	1),
  (100295, 100123,  1),
  (100296, 100088,  1),
  (100296, 100095,  2),
  (100296, 100091,  1),
  (100297, 100240,  1),
  (100297, 100243,  1),
  (100297, 100244,  3),
  (100298, 100157,  1),
  (100298, 100160,  1),
  (100298, 100165,  1),
  (100299, 100083,  1),
  (100299, 100085,  1),
  (100299, 100079,  1),
  (100300, 100063,  1),
  (100300, 100062,  1),
  (100300, 100058,  1),
  (100300, 100064,  1),
  (100301, 100207,  1),
  (100301, 100205,  1),
  (100301, 100203,  1),
  (100301, 100209,  2),
  (100302, 100205,  1),
  (100302, 100203,  1),
  (100302, 100209,  2),
  (100303, 100129,  2),
  (100303, 100122,  1),
  (100303, 100124,  1),
  (100304, 100282,  1),
  (100304, 100292,  3),
  (100304, 100291,  1),
  (100304, 100286,  1),
  (100305, 100270,  2),
  (100305, 100266,  1),
  (100305, 100269,  1),
  (100305, 100264,  1),
  (100306, 100277,  1),
  (100306, 100280,  1),
  (100306, 100276,  1),
  (100307, 100262,  1),
  (100307, 100258,  1),
  (100307, 100255,  1),
  (100307, 100259,  1),
  (100308, 100167,  1),
  (100308, 100166,  1),
  (100308, 100170,  1),
  (100308, 100175,  2),
  (100309, 100104,  1),
  (100309, 100101,  1),
  (100309, 100102,  1),
  (100309, 100103,  1),
  (100310, 100109,  2),
  (100310, 100105,  1),
  (100310, 100106,  1),
  (100311, 100239,  1),
  (100311, 100243,  1),
  (100312, 100282,  1),
  (100312, 100292,  2),
  (100312, 100281,  1),
  (100313, 100182,  1),
  (100313, 100184,  3),
  (100313, 100179,  1),
  (100314, 100133,  1),
  (100314, 100138,  1),
  (100315, 100258,  1),
  (100315, 100261,  1),
  (100316, 100248,  1),
  (100316, 100251,  2),
  (100316, 100249,  1),
  (100317, 100247,  1),
  (100317, 100250,  2),
  (100318, 100092,  1),
  (100318, 100095,  1),
  (100319, 100062,  1),
  (100319, 100058,  1),
  (100319, 100059,  1),
  (100320, 100262,  1),
  (100320, 100261,  1),
  (100320, 100256,  1),
  (100321, 100285,  1),
  (100321, 100292,  1),
  (100321, 100288,  1),
  (100322, 100108,  1),
  (100322, 100109,  1),
  (100322, 100110,  1),
  (100323, 100121,  1),
  (100323, 100123,  1),
  (100323, 100125,  1),
  (100324, 100102,  2),
  (100324, 100100,  1),
  (100324, 100098,  1),
  (100325, 100285,  1),
  (100325, 100291,  1),
  (100325, 100281,  1),
  (100326, 100265,  1),
  (100326, 100270,  1),
  (100326, 100269,  1),
  (100327, 100094,  1),
  (100327, 100095,  1),
  (100327, 100091,  1),
  (100328, 100071,  1),
  (100328, 100069,  1),
  (100328, 100076,  1),
  (100329, 100119,  1),
  (100329, 100115,  1),
  (100329, 100112,  1),
  (100330, 100120,  2),
  (100330, 100113,  1),
  (100330, 100116,  1),
  (100331, 100114,  1),
  (100331, 100112,  1),
  (100331, 100118,  1),
  (100332, 100126,  1),
  (100332, 100129,  1),
  (100332, 100123,  1),
  (100333, 100126,  1),
  (100333, 100122,  1),
  (100334, 100152,  1),
  (100334, 100156,  1),
  (100335, 100152,  1),
  (100335, 100155,  1),
  (100336, 100153,  1),
  (100336, 100156,  1),
  (100337,	100152,	1),
  (100337,	100155,	1),
  (100337,	100149,	1),
  (100338,	100266,	1),
  (100338,	100269,	1),
  (100338,	100264,	1),
  (100339,	100239,	1),
  (100339,	100238,	1),
  (100339,	100244,	1),
  (100340,	100084,	1),
  (100340,	100080,	1),
  (100340,	100086,	1),
  (100341,	100177,	1),
  (100341,	100183,	1),
  (100341,	100178,	1),
  (100342,	100109,	1),
  (100342,	100106,	1),
  (100343,	100121,	1),
  (100343,	100127,	1),
  (100343,	100124,	1),
  (100344,	100129,	1),
  (100344,	100123,	1),
  (100345,	100153,	1),
  (100345,	100156,	1),
  (100346,	100155,	1),
  (100346,	100148,	1),
  (100347,	100145,	1),
  (100347,	100146,	1),
  (100348,	100134,	1),
  (100348,	100138,	1),
  (100349,	100265,	1),
  (100349,	100270,	1),
  (100349,	100269,	1),
  (100350,	100282,	1),
  (100350,	100291,	1),
  (100351,	100182,	1),
  (100351,	100176,	1),
  (100351,	100185,	1),
  (100352,	100270,	1),
  (100352,	100266,	1),
  (100352,	100269,	1),
  (100353,	100187,	1),
  (100353,	100193,	1),
  (100353,	100191,	1),
  (100354,	100199,	1),
  (100354,	100202,	1),
  (100354,	100195,	1),
  (100355,	100206,	1),
  (100355,	100207,	1),
  (100355,	100209,	1),
  (100356,	100212,	2),
  (100356,	100220,	1),
  (100357,	100222,	1),
  (100357,	100228,	1),
  (100357,	100221,	1),
  (100358,	100231,	1),
  (100358,	100229,	1),
  (100358,	100235,	1),
  (100359,	100063,	1),
  (100359,	100066,	1),
  (100360,	100112,	1),
  (100360,	100116,	1),
  (100360,	100118,	1),
  (100361,	100105,	1),
  (100362,  100287,	1),
  (100362,	100292,	1),
  (100363,	100199,	1),
  (100363,	100202,	1),
  (100363,	100195,	1),
  (100364,	100208,	1),
  (100364,	100205,	1),
  (100364,	100209,	1);




