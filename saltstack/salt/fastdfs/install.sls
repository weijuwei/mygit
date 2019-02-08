libfastcommon_instll:
  file.managed:
    - name: /root/libfastcommon-1.0.40.tar.gz
    - source: salt://fastdfs/files/libfastcommon-1.0.40.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /root && tar xf libfastcommon-1.0.40.tar.gz && cd libfastcommon-1.0.40 && ./make.sh && ./make.sh install
    - requre:
      - file: libfastcommon_instll

fastdfs_install:
  file.managed:
    - name: /root/fastdfs-5.0.12.tar.gz
    - source: salt://fastdfs/files/fastdfs-5.0.12.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /root && tar xf fastdfs-5.0.12.tar.gz && cd fastdfs-5.0.12 && ./make.sh && ./make.sh install
    - requre:
      - file: fastdfs_install
