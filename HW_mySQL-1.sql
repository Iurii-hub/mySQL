# 1. Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
select * from client where Length(firstname) < 6;

# 2. Вибрати львівські відділення банку.
select DepartmentCity from department where DepartmentCity like 'lviv';

# 3. Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from client where Education like 'high' order by LastName;

# 4. Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
select * from application order by idApplication desc limit 5;

# 5. Вивести усіх клієнтів, чиє прізвище закінчується на iv чи riv.
select * from client where LastName like '%iv';

# 6. Вивести клієнтів банку, які обслуговуються київськими відділеннями.
select * from client join department on client.Department_idDepartment = department.idDepartment where department.DepartmentCity = 'Kyiv'; #full info
select client.idClient, client.LastName, client.Department_idDepartment, client.City, department.DepartmentCity from client 
join department on client.Department_idDepartment = department.idDepartment where department.DepartmentCity = 'Kyiv';

# 7. Вивести імена клієнтів та їхні номера паспорта, погрупувавши їх за іменами.
select FirstName, Passport from client order by FirstName;

# 8. Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select client.FirstName, client.LastName, application.Sum from client 
join application on client.idClient = application.Client_idClient where Sum > 5000 and Currency like 'gryvnia';

# 9. Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
select count(idClient) from client union select count(idClient) from client 
join department on client.Department_idDepartment = department.idDepartment where department.DepartmentCity like 'lviv';

# 10.  Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
select idClient, FirstName, LastName, max(sum) from application 
join client on application.Client_idClient = client.idClient group by idClient;

# 11.  Визначити кількість заявок на кредит для кожного клієнта.
select idClient, FirstName, LastName, count(Client_idClient) from application 
join client on application.Client_idClient = client.idClient group by idClient;

# 12.  Визначити найбільший та найменший кредити.
select max(Sum), min(Sum) from application;

# 13.  Порахувати кількість кредитів для клієнтів, які мають вищу освіту.
select Education, FirstName,LastName, count(Client_idClient) from application 
join client on application.Client_idClient = client.idClient where Education = 'high' group by Client_idClient;

# 14.  Вивести дані про клієнта, в якого середня сума кредитів найвища.

# 15.  Вивести відділення, яке видало в кредити найбільше грошей.

# 16.  Вивести відділення, яке видало найбільший кредит.

# 17.  Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.

# 18.  Усіх клієнтів київських відділень пересилити до Києва.

# 19.  Видалити усі кредити, які є повернені.

# 20.  Видалити кредити клієнтів, в яких друга літера прізвища є голосною.

# 21.  Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000.

# 22.  Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000.

# 23.  Знайти максимальний неповернений кредит.

# 24.  Знайти клієнта, сума кредиту якого найменша.
select min(sum) from application where match(idApplication);

# 25.  Знайти кредити, сума яких більша за середнє значення усіх кредитів.

# 26.  Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів.

# 27.  Max sum.

# 28.  Місто чувака який набрав найбільше кредитів.
