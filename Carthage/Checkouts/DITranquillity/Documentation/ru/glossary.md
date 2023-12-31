# Словарик

Данная страница нужна для лучшего понимания слов, которые используются в документации.

* Аргумент - Тот же самый аргумент на языке Swift, который мы передаем в метод инициализации.
* Экземпляр класса - Swift или Obj-C объект, который был создан с помощью библиотеки, используя контейнер.
* Компонент – Набор контрактов с библиотекой, позволяющие описать способ создания объекта.
* [Рутовый Компонент](core/registration_and_service.md#рутовый-компонент) - Это компонент помеченный специальный образом, указывающий на то, что создание графа зависимостей может начинаться с него. Это еще одна опциональная ступенька к улучшению защищенности/валидации ваших зависимостей. 
* [Регистрация](core/registration_and_service.md) - Код, записанный в определенном стиле для описания способа создания объекта. При регистрации создаются компоненты.
* DI контейнер - Контейнер для регистрации компонент и создания экземпляров классов.
* Зависимость - Контракт, между двумя и более объектами, говорящий, что для создания одного объекта требуется создать другие.
* [Внедрение](core/injection.md) - Процесс при котором создаются экземпляры классов, описанные как зависимости.
* [Время жизни](core/scope_and_lifetime.md) - Время после создания экземпляра класса и до его уничтожения.
* [Часть](core/modular.md#Часть) - Класс для объединения нескольких компонентов в одну сущность, для дальнейшего использования.
* [Фреймворк](core/modular.md#Фреймворк) - Класс для объединения нескольких частей в одну сущность, для дальнейшего использования.
* [Модификаторы](core/modificated_injection.md) - Дополнение, к обычному синтаксису библиотеки позволяющее передать дополнительные данные о способе внедрения.

