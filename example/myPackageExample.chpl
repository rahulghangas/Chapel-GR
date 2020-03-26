// use GRPlot;
// var a : [1..10] real = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0];
// var b : [1..10] real = [1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1];
// polyline(a, b);
// writeln(inqlinewidth());
// setscale(10.0);
// writeln(inqscale());
// writeln(version());
// setcolormapfromrgb([0.1, 0.2], [0.1, 0.2], [0.1, 0.2], nil);
// setcoordxform([1 ,2 ,3, 4, 5, 6]);
// while true{
//   nothing;
// }

use GRPlot as gr;

var xd : [1..17] real = [3, 3, 10, 18, 18, 10, 10, 5, 1, 15, 20, 5, 15, 10, 7, 13, 16];
var yd : [1..17] real = [3, 18, 18, 3, 18, 10, 1, 5, 10, 5, 10, 15, 15, 15, 20, 20, 8];
var zd : [1..17] real = [25, 25, 25, 25, 25, -5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 25];

gr.setviewport(0.1, 0.9, 0.1, 0.9);
gr.setwindow(0.0, 20.0, 0.0, 20.0);
gr.setcharheight(0.027);
gr.settextalign(2, 0);
gr.settextfontprec(3, 0);
gr.text(0.5, 0.96, "Woohoo we can do this in Chapel now");
gr.selntran(1);
gr.setspace(-10.0, 40.0, 0, 90);
gr.axes(1.0, 1.0, 0.0, 0.0, 5, 5, -0.01);
gr.setwindow(0, 20, 0, 20);
gr.setspace(-10, 40, 0, 90);

var tup = gr.gridit(xd, yd, zd, 40, 40);
var x = tup[1];
var y = tup[2];
var z = tup[3];
var h = [x in -4..28 by 2] x :real;
gr.contour(x, y, h, z, 0);

gr.updatews();

readln();