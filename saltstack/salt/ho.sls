hosts_init:
  file.managed:
    - name: /tmp/hosts
    - source: salt://files/hosts
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    
    {% if grains['fqdn'] == 'node1.xl.com' %}
    - role: master
    {% elif grains['fqdn'] == 'node2.xl.com' %}
    - role: backup
    {% endif %}
