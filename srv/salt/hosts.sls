hosts_init:
  file.managed:
    - name: /tmp/hosts  
    - source: salt://files/hosts
    - user: root
    - group: root
    - template: jinja
    - defaults:
      {% if grains['fqdn'] == 'node1' %}
      - ROLE: MASTER
      - PRI_ID: 200
      - VIR_ID: 3
      {% elif grains['fqdn'] == 'node2' %}
      - ROLE: BACKUP
      - PRI_ID: 100
      - VIR_ID: 4
      {% endif %}
