install fastdfs+nginx

#在nginx配置文件中添加
location /group1/M00/ {
	ngx_fastdfs_module;
}
