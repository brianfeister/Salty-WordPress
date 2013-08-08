mysql-server-5.5:
  pkg.installed

mysql:
  service.running:
    - name: mysql
    - require:
      - pkg: mysql-server-5.5
    - watch:
      - file: /etc/mysql/my.cnf

/etc/mysql/my.cnf:
  file.managed:
    - source: salt://config/mysql/my.cnf
    - user: root
    - group: root
    - mode: 644