# FireFighter-drone on Kaspersky OS / Дрон-огнеборец на Касперский ОС
# Общая информация

Этот проект представляет собой заготовку для задачи "Дрон-огнеборец" на КОС и предназначен для получения представления об интерфейсе взаимодействия компонентов, возможных способах реализации их минимального функционала, его объеме и т.д.
Проект предполагает запуск как локально в эмуляторе Qemu, так и на аппаратной платформе Raspberry Pi 4b 1.5 rev.

# Оговорка разработчика и условия использования

Пример является отправной точкой работы, но не обязательно является образцом "хорошо" или "правильно" и может быть изменен и расширен участниками в своих реализациях.

Применять только в учебных целях. Данный код может содержать ошибки, авторы не несут никакой ответственности за любые последствия использования этого кода.
Условия использования и распространения - MIT лицензия (см. файл LICENSE).

## Настройка и запуск

Возможны оба варианта. Использовать docker контейнер проще и быстрее, что полезно для быстрого ознакомления.
Для разработки удобнее настроить на хост системе всё необходимое.

### Используя docker контейнер
Для сборки проекта понадобится любой Linux дистрибутив способный запускать **docker**.
В этой ветке используется (пока) неофициальная версия пакета KasperskyOS-Community-Edition_1.2.0.45.zip. Файл с архивом необходимо скачать и разместить в папке с проектом.

Сборка docker образа с установленным KOS SDK:
```
make d-build
```
Запуск контейнера (из папки проекта):
```
make develop
```
Сборка и запуск проекта (находясь внутри контейнера):
```
make sim
```
Дополнительно требуется запустить FPS
```
./fps
```

Примечание, для работы fps следует обновить файл /etc/hosts, прописав IP 127.0.0.1 для хоста communication  (127.0.0.1 communication)

### Настроив хост систему

Предполагается, что настройка и подготовка хостовой и гостевой машины были осуществлены в соответствии с инструкциями, приведенными в подготовительном курсе 
  - https://stepik.org/course/133991/promo.

Дополнительные сведения о настройке хост системы описаны в документации по Касперский ОС 
  - https://support.kaspersky.ru/help/KCE/1.1/ru-RU/getting_started.htm

### Системные требования

Данный пример разработан и проверен на ОС Ubuntu 22.04, авторы предполагают, что без каких-либо изменений этот код может работать на любых Debian-подобных OS, для других Linux систем. Для MAC OS как минимум необходимо использовать другой менеджер пакетов. В Windows необходимо самостоятельно установить необходимое ПО или воспользоваться виртуальной машиной с Ubuntu (также можно использовать WSL версии не ниже 2).

### Используемое ПО

Стандартный способ запуска демо-версии предполагает наличие установленного пакета *docker*, а также *KasperskyOS-Community-Edition-1.2.0.45*. 
Для автоматизации типовых операций используется утилита *cmake*.

Для работы с кодом примера рекомендуется использовать Vim.

### Дополнительные материалы для разработчика
- [Документ для разработчиков](./docs/dev.md) включает архитектуру и подробное описание логики решения.

