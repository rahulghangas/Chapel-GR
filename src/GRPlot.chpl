/* Documentation for GR */
module GRPlot {
  require "gr.h";

  extern proc gr_initgr();
  extern proc gr_opengks();
  extern proc gr_closegks();
  extern proc gr_inqdspsize(mWidth : c_ptr(real), mHeight : c_ptr(real), width : c_ptr(c_int), 
                            height : c_ptr(c_int));
  extern proc gr_openws(workstation_id : c_int, connection : c_string, workstation_type : c_int);
  extern proc gr_closews(workstation_id : c_int);
  extern proc gr_activatews(workstation_id : c_int);
  extern proc gr_deactivatews(workstation_id : c_int);
  extern proc gr_configurews();
  extern proc gr_clearws();
  extern proc gr_updatews();
  extern proc gr_polyline(n : c_int, x : [] real, y : [] real);
  extern proc gr_polymarker(n : c_int, x : [] real, y : [] real);
  extern proc gr_text(x : real, y : real, text : c_string);
  extern proc gr_inqtext(x : real, y : real, str : c_string, tbx : c_ptr(real), tby : c_ptr(real));
  extern proc gr_fillarea(n : int, x : c_ptr(real), y : c_ptr(real));
  extern proc gr_cellarray(xmin : real, xmas : real, ymin : real, ymax : real,
                           dimx : c_int, dimy : c_int, scol : c_int, srow : c_int, 
                           ncol : c_int, nrow : c_int, color : c_ptr(c_int));
  extern proc gr_nonuniformcellarray(x : c_ptr(real), y : c_ptr(real), dimx : c_int, 
                                     dimy : c_int, scol : c_int, ncol : c_int, 
                                     nrow : c_int, color : c_ptr(c_int));
  extern proc gr_polarcellarray(x_org : real, y_org : real, phimin : real, 
                                phimax : real, rmin : real, rmax : real, dimphi : c_int,
                                dimr : c_int, scol : c_int, srow : c_int, ncol : c_int,
                                nrow : c_int, color : c_ptr(c_int));
  extern proc gr_gdp(n : c_int, x : c_ptr(real), y : c_ptr(real), primid : c_int, 
                     ldr : c_int, datrec : c_ptr(c_int));
  extern proc gr_spline(n : c_int, px : c_ptr(real), py : c_ptr(real), m : c_int, method : c_int);
  extern proc gr_gridit(nd : c_int, xd : c_ptr(real), yd : c_ptr(real), zd : c_ptr(real),
                        nx : c_int, ny : c_int, x : c_ptr(real), y : c_ptr(real), z : c_ptr(real));
  extern proc gr_setlinetype(lineType : int);
  extern proc gr_inqlinetype(ptr : c_ptr(real));
  extern proc gr_setlinewidth(width : real);
  extern proc gr_inqlinewidth(ptr : c_ptr(real));
  extern proc gr_setlinecolorind(color : c_int);
  extern proc gr_inqlinecolorind(ptr : c_ptr(c_int));
  extern proc gr_setmarkertype(marker_type : c_int);
  extern proc gr_inqmarkertype(ptr : c_ptr(c_int));
  extern proc gr_setmarkersize(size : real);
  extern proc gr_inqmarkersize(size : c_ptr(real));
  extern proc gr_setmarkercolorind(color : c_int);
  extern proc gr_inqmarkercolorind(ptr : c_ptr(c_int));
  extern proc gr_settextfontprec(font : c_int, precision : c_int);
  extern proc gr_setcharexpan(factor : real);
  extern proc gr_setcharspace(space : real);
  extern proc gr_settextcolorind(color : c_int);
  extern proc gr_setcharheight(height : real);
  extern proc gr_setcharup(ux : real, uy : real);
  extern proc gr_settextpath(path : c_int);
  extern proc gr_settextalign(horizontal : c_int, vertical : c_int);
  extern proc gr_setfillintstyle(style : c_int);
  extern proc gr_inqfillintstyle(style : c_ptr(c_int));
  extern proc gr_setfillstyle(ind : c_int);
  extern proc gr_setfillcolorind(color : c_int);
  extern proc gr_inqfillcolorind(color : c_ptr(c_int));
  extern proc gr_setcolorrep(colorIndex : c_int, red : real, green : real, blue : real);
  extern proc gr_setwindow(xmin : real, xmax : real, ymin : real, ymax : real);
  extern proc gr_inqwindow(xmin : c_ptr(real), xmax : c_ptr(real), 
                           ymin : c_ptr(real), ymax : c_ptr(real));
  extern proc gr_setviewport(xmin : real, xmax : real, ymin : real, ymax : real);
  extern proc gr_inqviewport(xmin : c_ptr(real), xmax : c_ptr(real), 
                             ymin : c_ptr(real), ymax : c_ptr(real));
  extern proc gr_selntran(transform : c_int);
  extern proc gr_setclip(indicator : c_int);
  extern proc gr_setwswindow(xmin : real, xmax : real, ymin : real, ymax : real);
  extern proc gr_setwsviewport(xmin : real, xmax : real, ymin :real, ymax : real);
  extern proc gr_createseg(n : c_int);
  extern proc gr_copysegws(n : c_int);
  extern proc gr_redrawsegws();
  extern proc gr_setsegtran(segment : c_int, fx : real, fy : real, transx : real, transy : real, 
                            phi : real, scalex : real, scaley : real);
  extern proc gr_closeseg();
  extern proc gr_emergencyclosegks();
  extern proc gr_updategks();
  extern proc gr_setspace(zmin : real, zmax : real, rotation : c_int, tilt : c_int) : c_int;
  extern proc gr_inqspace(a : c_ptr(real), b : c_ptr(real), c : c_ptr(c_int), d : c_ptr(c_int));
  extern proc gr_setscale(options : c_int) : c_int;
  extern proc gr_inqscale(options : c_ptr(c_int));
  extern proc gr_textext(x : real, y : real, str : c_string) : c_int;
  extern proc gr_inqtextext(x : real, y : real, str : c_string, tbx : c_ptr(real), tby : c_ptr(real));
  extern proc gr_axes(x_tick : real, y_tick : real, x_org : real, y_org : real, 
                      major_x : c_int, major_y : c_int, tick_size : real);
  extern proc gr_axeslbl(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : c_int, 
                        major_y : c_int, tick_size : real, fpx : c_fn_ptr, fpy : c_fn_ptr);
  extern proc gr_grid(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : c_int, 
                      major_y : c_fn_ptr);
  extern proc gr_grid3d(x_tick : real, y_tick : real, z_tick : real, 
                        x_org : real, y_org : real, z_org : real, 
                        major_x : c_int, major_y : c_int, major_z : c_int);
  extern proc gr_verrorbars(n : c_int, px : c_ptr(real), py : c_ptr(real), 
                            e1 : c_ptr(real), e2 : c_ptr(real));
  extern proc gr_herrorbars(n : c_int, px : c_ptr(real), py : c_ptr(real), 
                            e1 : c_ptr(real), e2 : c_ptr(real));
  extern proc gr_polyline3d(n : c_int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  extern proc gr_polymarker3d(n : c_int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  // extern proc gr_axes3d();

  extern proc gr_tick (start : real, end : real): real;

  proc polyline(x : [?D1] ?t1, y : [?D2] ?t2){
    gr_polyline(x.size : int(32), x, y);
    gr_axes(gr_tick(0, 1), gr_tick(0, 1), 0, 0, 1, 1, -0.01);
  }

}

use GRPlot;
var a : [1..10] real = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0];
var b : [1..10] real = [1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1];
polyline(a, b);
while true{
  nothing;
}
