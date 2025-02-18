Создать 3 ВМ в Я.Облаке (минимальная конфигурация: 2vCPU, 2GB RAM, 20 GB HDD): vm1 и vm2 (Ubuntu 20.04), vm3 (Centos 8).
    Установить на vm1 Ansible.
    Создать на vm1 пользователя для Ansible.
    Настроить авторизацию по ключу для этого пользователя с vm1 на vm2 и vm3.
Добавить в inventory информацию о созданных машинах. vm2 и vm3 должны быть в группе app, vm1 — в группе database и web.
Написать плейбук, реализующий следующее:
    на машинах группы app выполняется установка и запуск Docker;
    на машинах группы database выполняется установка и запуск 
    postgresql-server (версия и data-директория должны быть переменными, задающимися в inventory).
Протестировать написанный плейбук.
    Выложить плейбук и inventory в GitHub. Создайте отдельный репозиторий Ansible.
    Прислать ментору ссылку на репозиторий с плейбуком.

write_files:
  - path: "/usr/local/etc/sshgen.sh"  
    permissions: "755"
    content: | 
        #!/bin/bash
        mkdir /home/ansible/.ssh &&
        yes | ssh-keygen -o -t rsa -b 4096 -f /home/ansible/.ssh/id_rsa -N "" && 
        ssh-copy-id ansible@192.168.0.11 
        && ssh-copy-id ansible@192.168.0.12
    defer: true
