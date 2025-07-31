if(async_load[?"id"]	!=sock)				exit
if(async_load[?"type"]	!=network_type_data)exit
if(async_load[?"size"]	<5)					exit
var b=async_load[?"buffer"]
var code=buffer_read(b,buffer_u16)
	if(code!=1013)exit
var ip	=async_load[?"ip"]
var port=async_load[?"port"]
	code=buffer_read(b,buffer_string)
show_debug_message(code+ip)
if(code=="BRD")
{
	var len=buffer_read(b,buffer_f64)
	ds_list_clear(pens)
	for(var i=0;i<len;i++)
	{
		ip=buffer_read(b,buffer_string)
		port=buffer_read(b,buffer_f64)
		//show_debug_message(ip)
		//show_debug_message(port)
		ds_list_add(pens,[ip,port])
		//show_debug_message(pens[|ds_list_size(pens)-1])
	}
}