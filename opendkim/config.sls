# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "opendkim/map.jinja" import opendkim with context %}

include:
  - opendkim.install
  - opendkim.service

opendkim-config:
  file.managed:
    - name: {{ opendkim.config }}
    - source: salt://opendkim/files/opendkim.tmpl
    - mode: 644
    - user: root
    - group: root
    - template: 'jinja'
    - backup: minion
    - context: 
        conf: {{ opendkim.conf }}
    - watch_in:
      - service: opendkim_service
    - require:
      - pkg: opendkim_packages 
