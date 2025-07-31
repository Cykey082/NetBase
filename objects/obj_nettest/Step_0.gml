if(beat--)exit
else beat=120
if(beat)exit
var penslen=ds_list_size(pen.pens)
show_debug_message("Pens Len:"+string(penslen))
for(var i=0;i<penslen;i++)
{
	var p=pen.pens[|i]
	show_debug_message(p)
	var ip=p[0]
	var port=string(p[1])
	show_debug_message(string(i)+": "+ip+":"+port)
}