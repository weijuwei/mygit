{% if grains['fqdn'] == 'node1.xl.com' %}
test: node1
role_id: MASTER
vir_id: 3
pri_id: 200
{% elif grains['fqdn'] == 'node2.xl.com' %}
test: node2
role_id: BACKUP
vir_id: 4
pri_id: 100
{% endif %}
