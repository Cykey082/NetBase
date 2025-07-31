var penslen=ds_list_size(pen.pens)
draw_text(100,100,"Pens Len:"+string(penslen))
for(var i=0;i<penslen;i++)
{
	var p=pen.pens[|i]
	var ip=p[0]
	var port=string(p[1])
	draw_text(100,150+50*i,string(i)+": "+ip+":"+port)
}
