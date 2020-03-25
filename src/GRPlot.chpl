/* Documentation for GR */
module GRPlot {
  use SysCTypes;
  require "gr.h";

  extern "gr_initgr" proc initgr();
  extern "gr_opengks" proc opengks();
  extern "gr_closegks" proc closegks();

  extern proc gr_inqdspsize(ref mWidth : real, ref mHeight : real, ref width : int, 
                            ref height : int);
  proc inqdspsize(){
    var mwidth : real;
    var mheight : real;
    var width : int;
    var height : int;
    gr_inqdspsize(mwidth, mheight, width, height);
    return (mwidth, mheight, width, height);
  }

  extern proc gr_openws(workstation_id : int, connection : c_string, workstation_type : int);
  proc openws(workstation_id : int, connection : string, workstation_type : int){
    gr_openws(workstation_id, connection.c_str(), workstation_id);
  }

  extern "gr_closews" proc closews(workstation_id : int);
  extern "gr_activatews" proc activatews(workstation_id : int);
  extern "gr_deactivatews" proc deactivatews(workstation_id : int);
  extern "gr_configurews" proc configurews();
  extern "gr_clearws" proc clearws();
  extern "gr_updatews" proc updatews();

  extern proc gr_polyline(n : int, x : [] real, y : [] real);
  proc polyline(x : [?D1] ?t1, y : [?D2] ?t2) {
    gr_polyline(x.size, x, y);
    gr_axes(gr_tick(0, 1), gr_tick(0, 1), 0, 0, 1, 1, -0.01);
  }
  
  extern proc gr_polymarker(n : int, x : [] real, y : [] real);
  proc polymarker(x : [?D1] ?t1, y : [?D2] ?t2) {
    gr_polymarker(x.size, x, y);
  }

  extern proc gr_text(x : real, y : real, text : c_string);
  proc text(x : real, y : real, text : string) {
    gr_text(x, y, text.c_str());
  }

  extern proc gr_inqtext(x : real, y : real, str : c_string, tbx : c_ptr(real), tby : c_ptr(real));
  proc inqtext(x : real, y : real, text : string) {
    var tbx : real;
    var tby : real;
    gr_inqtext(x, y, text.c_str(), c_ptrTo(tbx), c_ptrTo(tby));
    return (tbx, tby);
  }

  extern proc gr_fillarea(n : int, x : [] real, y : [] real);
  proc fillarea(x : [] real, y : [] real) {
    gr_fillarea(x.size, x, y);
  }

  extern proc gr_cellarray(xmin : real, xmax : real, ymin : real, ymax : real,
                           dimx : int, dimy : int, scol : int, srow : int, 
                           ncol : int, nrow : int, color : [] int);
  proc cellarray(xmin : real, xmax : real, ymin : real, ymax : real, dimx : real, dimy : real, color : [] ?t) {
    var colorCast = [elt in color] elt : int;
    gr_cellarray(xmin, xmax, ymin, ymax, dimx, dimy, 1, 1, dimx, dimy, colorCast);
  }

  extern proc gr_nonuniformcellarray(x : [] real, y : [] real, dimx : int, 
                                     dimy : int, scol : int, ncol : int, 
                                     nrow : int, color : [] int);
  proc nonuniformcellarray(x : [] real, y : real, dimx : int, dimy : int, color : [] int) {
    gr_nonuniformcellarray(x, y, dimx, dimy, 1, 1, dimx, dimy, color); 
  }

  extern proc gr_polarcellarray(xorg : real, yorg : real, phimin : real, 
                                phimax : real, rmin : real, rmax : real, dimphi : int,
                                dimr : int, scol : int, srow : int, ncol : int,
                                nrow : int, color : c_ptr(int));
  proc polarcellarray(xorg : real, yorg : real, phimin : real, phimax : real, rmin : real, rmax : real, dimphi : int, dimr : int, color : [] int) {
    gr_polarcellarray(xorg, yorg, phimin, phimax, rmin, rmax, dimphi, dimr, 1, 1, dimphi, dimr, color);
  }

  extern proc gr_gdp(n : int, x : c_ptr(real), y : c_ptr(real), primid : int, 
                     ldr : int, datrec : c_ptr(int));
  proc gdp(x : [] real, y : [] real, primid : int, datarec : [] int) {
    gr_gdp(x.size, x, y, primid, datarec.size, datarec);
  }

  extern proc gr_spline(n : int, px : c_ptr(real), py : c_ptr(real), m : int, method : int);
  proc spline(x : [] real, y : real, m : int, method : int) {
    gr_spline(x.size, x, y, m, method);
  }

  extern proc gr_gridit(nd : int, xd : c_ptr(real), yd : c_ptr(real), zd : c_ptr(real),
                        nx : int, ny : int, x : c_ptr(real), y : c_ptr(real), z : c_ptr(real));
  proc gridit(xd : [] real, yd : [] real, zd : [] real, nx : int, ny : int) {
    var x : [1..nx] real = {1..nx};
    var y : [1..ny] real = {1..ny};
    var z : [1..nx*ny] real = {1..nx*ny};
    gr_gridit(xd.size, xd, yd, zd, nx, ny, x, y, z);
  }

  extern "gr_setlinetype" proc setlinetype(style : int);

  extern proc gr_inqlinetype(ref ptr : real);
  proc inqlinetype() {
    var style : real;
    gr_inqlinetype(style);
    return style;
  }

  extern "gr_setlinewidth" proc gr_setlinewidth(width : real);

  extern proc gr_inqlinewidth(ref ptr : real);
  proc inqlinewidth() {
    var width : real;
    gr_inqlinewidth(width);
    return width;
  }

  extern "gr_setlinecolorind" proc setlinecolorind(color : int);

  extern proc gr_inqlinecolorind(ref ptr : int);
  proc inqlinecolorind() {
    var color : int;
    gr_inqlinecolorind(color);
    return color;
  }

  extern "gr_setmarkertype" proc setmarkertype(markerType : int);

  extern proc gr_inqmarkertype(ref ptr : int);
  proc inqmarkertype() {
    var markerType : int;
    gr_inqmarkertype(markerType);
    return markerType;
  }

  extern "gr_setmarkersize" proc setmarkersize(size : real);
  extern proc gr_inqmarkersize(size : c_ptr(real));
  // TODO

  extern "gr_setmarkercolorind" proc setmarkercolorind(color : int);
  extern proc gr_inqmarkercolorind(ptr : c_ptr(int));

  extern "gr_settextfontprec" proc settextfontprec(font : int, precision : int);
  extern "gr_setcharexpan" proc setcharexpan(factor : real);
  extern "gr_setcharspace" proc setcharspace(space : real);
  extern "gr_settextcolorind" proc settextcolorind(color : int);
  extern "gr_setcharheight" proc setcharheight(height : real);
  extern "gr_setcharup" proc setcharup(ux : real, uy : real);
  extern "gr_settextpath" proc settextpath(path : int);
  extern "gr_settextalign" proc settextalign(horizontal : int, vertical : int);
  extern "gr_setfillintstyle" proc setfillintstyle(style : int);
  extern proc gr_inqfillintstyle(style : c_ptr(int));
  // TODO

  extern "gr_setfillstyle" proc setfillstyle(ind : int);
  extern "gr_setfillcolorind" proc setfillcolorind(color : int);
  extern proc gr_inqfillcolorind(color : c_ptr(int));
  // TODO

  extern "gr_setcolorrep" proc setcolorrep(color_index : int, red : real, green : real, blue : real);
  extern "gr_setwindow" proc setwindow(xmin : real, xmax : real, ymin : real, ymax : real);
  extern proc gr_inqwindow(xmin : c_ptr(real), xmax : c_ptr(real), 
                           ymin : c_ptr(real), ymax : c_ptr(real));
  // TODO

  extern "gr_setviewport" proc gr_setviewport(xmin : real, xmax : real, ymin : real, ymax : real);

  extern proc gr_inqviewport(xmin : c_ptr(real), xmax : c_ptr(real), 
                             ymin : c_ptr(real), ymax : c_ptr(real));
  // TODO

  extern "gr_selntran" proc selntran(transform : int);
  extern "gr_setclip" proc setclip(indicator : int);
  extern "gr_setwswindow" proc setwswindow(xmin : real, xmax : real, ymin : real, ymax : real);
  extern "gr_setwsviewport" proc setwsviewport(xmin : real, xmax : real, ymin :real, ymax : real);
  extern "gr_createseg" proc createseg(n : int);
  extern "gr_copysegws" proc copysegws(n : int);
  extern "gr_redrawsegws" proc redrawsegws();
  extern "gr_setsegtran" proc setsegtran(segment : int, fx : real, fy : real, transx : real, transy : real, 
                            phi : real, scalex : real, scaley : real);
  extern "gr_closeseg" proc closeseg();
  extern "gr_emergencyclosegks" proc emergencyclosegks();
  extern "gr_updategks" proc updategks();
  extern "gr_setspace" proc setspace(zmin : real, zmax : real, rotation : int, tilt : int) : int;

  extern proc gr_inqspace(ref zmin : real, ref zmax : real, ref rotation : int, ref tilt : int);
  proc inqspace() {
    var zmin, zmax : real;
    var rotation, tilt : int;
    gr_inqspace(zmin ,zmax, rotation, tilt);
    return (zmin, zmax, rotation, tilt);
  }

  extern "gr_setscale" proc setscale(options : int) : int;
  
  extern proc gr_inqscale(ref options : int);
  proc inqscale() {
    var options : int;
    gr_inqscale(options);
    return options;
  }

  extern proc gr_textext(x : real, y : real, str : c_string) : int;
  proc textext(x : integral, y : integral, str: string) {
    return gr_textext(x : real, y : real, str.c_str());
  }

  extern proc gr_inqtextext(x : real, y : real, str : c_string, tbx : c_ptr(real), tby : c_ptr(real));
  proc inqtextext(x: integral, y : integral, str : string) {
    var tbx, tby : [1..4] real;
    gr_inqtextext(x, y, str.c_str(), tbx, tby);
    return (tbx, tby);
  }

  extern proc gr_axes(x_tick : real, y_tick : real, x_org : real, y_org : real, 
                      major_x : int, major_y : int, tick_size : real);
  extern proc gr_axeslbl(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : int, 
                        major_y : int, tick_size : real, fpx : c_fn_ptr, fpy : c_fn_ptr);
  extern proc gr_grid(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : int, 
                      major_y : c_fn_ptr);
  extern proc gr_grid3d(x_tick : real, y_tick : real, z_tick : real, 
                        x_org : real, y_org : real, z_org : real, 
                        major_x : int, major_y : int, major_z : int);
  extern proc gr_verrorbars(n : int, px : c_ptr(real), py : c_ptr(real), 
                            e1 : c_ptr(real), e2 : c_ptr(real));
  extern proc gr_herrorbars(n : int, px : c_ptr(real), py : c_ptr(real), 
                            e1 : c_ptr(real), e2 : c_ptr(real));
  extern proc gr_polyline3d(n : int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  extern proc gr_polymarker3d(n : int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  extern proc gr_axes3d(x_tick : real, y_tick : real, z_tick : real, 
                        x_org : real, y_org : real, z_org : real, 
                        major_x : int, major_y : int, major_z : int, tick_size : real);
  extern proc titles3d(x_title : c_string, y_title : c_string, z_title : c_string);
  extern proc gr_surface(nx : int, ny : int, 
                         px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real), 
                         option : int);
  extern proc gr_contour(nx : int, ny : int , nh : int, 
                         px : c_ptr(real), py : c_ptr(real), h : c_ptr(real), pz : c_ptr(real), 
                         mahor_h : int);
  extern proc  gr_contourf(nx : int, ny : int, nh : int, 
                 px : c_ptr(real), py : c_ptr(real), h : c_ptr(real), pz : c_ptr(real), 
                 major_h : int);
  extern proc gr_tricontour(npoints : int, x : c_ptr(real), y :c_ptr(real), z : c_ptr(real), nlevels : int, evels : c_ptr(real));
  extern proc gr_hexbin(n : int, x : c_ptr(real), y : c_ptr(real), nbins : int) : int;
  extern proc gr_setcolormap(map_index : int);
  extern proc gr_inqcolormap(map_index : c_ptr(int));
  extern proc gr_setcolormapfromrgb(n : int, r : c_ptr(real), g : c_ptr(real), b : c_ptr(real), x : c_ptr(real));
  extern proc gr_colorbar();
  extern proc gr_inqcolor(color : int, rgb : c_ptr(int));
  extern proc gr_inqcolorfromrgb(r : real, g : real, b : real) : int;
  extern proc gr_hsvtorgb(h : real, s :real, v :real, r :c_ptr(real), g : c_ptr(real), b : c_ptr(real));
  extern proc gr_tick(amin : real, amax : real) : real;
  extern proc gr_validaterange(amin : real, amax : real) : int;
  extern proc gr_adjustlimits(amin : c_ptr(real), amax : c_ptr(real));
  extern proc gr_adjustrange(amin : c_ptr(real), amax : c_ptr(real));
  extern proc gr_beginprint(pathname : c_string);
  extern proc gr_beginprintext(pathname : c_string, mode : c_string, format : c_string, orientation : c_string);
  extern proc gr_endprint();
  extern proc gr_ndctowc(x : c_ptr(real), y : c_ptr(real));
  extern proc gr_wctondc(x : c_ptr(real), y : c_ptr(real));
  extern proc gr_wc3towcx(x : c_ptr(real), y : c_ptr(real), z : c_ptr(real));
  extern proc gr_drawrect(xmin : real, xmax : real, ymin : real, ymax : real);
  extern proc gr_fillrect(xmin : real, xmax : real, ymin : real, ymax : real);
  extern proc gr_drawarc(xmin : real, xmax : real, ymin : real, ymax : real, a1: real, a2 : real);
  extern proc gr_fillarc(xmin : real, xmax : real, ymin : real, ymax : real, a1: real, a2 : real);
  extern proc gr_drawpath(n : int, points : c_ptr(real), codes : c_ptr(c_uchar), fill : int);
  extern proc gr_setarrowstyle(style : int);
  extern proc gr_setarrowsize(size : real);
  extern proc gr_drawarrow(x1 : real, x2 : real, y1 : real, y2 : real);
  extern proc gr_readimage(path : c_string, width : c_ptr(int), height : c_ptr(int), data : c_ptr(c_ptr(int))) : int;
  extern proc gr_drawimage(xmin : real, xmax : real, ymin : real, ymax : real, width : int, height : int, data : c_ptr(int), model : int);
  extern proc gr_importgraphics(path : c_string) : int;
  extern proc gr_setshadow(offsetx : real, offsety : real, blur : real);
  extern proc gr_settransparency(alpha : real);
  extern proc gr_setcoordxform(mat : c_ptr(real));
  extern proc gr_begingraphics(path : c_string);
  extern proc gr_endgraphics();
  extern proc gr_getgraphics() : c_string;
  extern proc gr_getgraphics(str : c_string) : int;
  extern proc gr_mathtex(x : real, y : real, str : c_string);
  extern proc gr_inqmathtex(x : real, y :real, str : c_string, tbx : c_ptr(real), tby : c_ptr(real));
  extern proc gr_beginselection(x : int, y: int);
  extern proc gr_endselection();
  extern proc gr_moveselection(x : real, y : real);
  extern proc gr_resizeselection(a : int, x : real, y: real);
  extern proc gr_inqbbox(xmin : c_ptr(real), xmax : c_ptr(real), ymin : c_ptr(real), ymax : c_ptr(real));
  extern proc gr_precision() : real;
  extern proc gr_setregenflags(flag : int);
  extern proc gr_inqregenflags() : int;
  extern proc gr_savestate();
  extern proc gr_restorestate();
  extern proc gr_selectcontext(context : int);
  extern proc gr_destroycontext(context : int);
  extern proc gr_uselinespec(linespec : c_string) : int;
  extern proc gr_delaunay(n : int, const x : real, const y : real, ntri : c_ptr(int), traingles : c_ptr(c_ptr(int)));
  extern proc gr_reducepoints(n : int, const x : real, const y : real, points : int, x_array : c_ptr(real), y_array : c_ptr(real));
  extern proc gr_trisurface(n : int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  extern proc gr_gradient(nx : int, ny : int, x : c_ptr(real), y : c_ptr(real), z : c_ptr(real), u : c_ptr(real), v : c_ptr(real));
  extern proc gr_quiver(nx : int, ny : int, x : c_ptr(real), y : c_ptr(real), u : c_ptr(real), v : c_ptr(real), color : int);
  extern proc gr_interp2(nx : int, ny : int, 
                         const x : c_ptr(real), const y : c_ptr(real), const z : c_ptr(real), 
                         nxq : int, nyq : int, 
                         const xq : c_ptr(real), const yq : c_ptr(real), const zq : c_ptr(real), 
                         method : int, extrapval : real);
  extern proc gr_newmeta() : c_void_ptr;
  extern proc gr_deletemeta(arg : c_void_ptr);
  extern proc gr_finalizemeta();

  // Finish gr_meta...
  extern proc gr_meta_args_push(arg : c_void_ptr, str : c_string ...?n);
  // gr_meta... block end

  extern proc gr_openmeta(target : int, device : c_string, port : c_uint, send_c : c_void_ptr, recv_c : c_void_ptr) : c_void_ptr;
  extern proc gr_recvmeta(handle : c_void_ptr, arg : c_void_ptr) : c_void_ptr;
  extern proc gr_sendmeta(const handle : c_void_ptr, str : c_string) : int;
  extern proc gr_sendmeta_buf(const handle : c_void_ptr, key : c_string, const data : c_void_ptr, len : int) : int;
  extern proc gr_sendmeta_ref(const handle : c_void_ptr, key : c_string, fmt : c_char, const data : c_void_ptr, len : int) : int;
  extern proc gr_sendmeta_args(handle : c_void_ptr, arg : c_void_ptr) : int;
  extern proc gr_closemeta(const handle : c_void_ptr);
  extern proc gr_clearmeta() : int;
  extern proc gr_inputmeta(const arg : c_void_ptr) : int;
  extern proc gr_mergemeta(const arg : c_void_ptr) : int;
  extern proc gr_mergemeta_named(const args : c_void_ptr, identificator : c_string) : int;
  extern proc gr_plotmeta(const args : c_void_ptr) : int;
  extern proc gr_readmeta(const args : c_void_ptr, str : c_string) : int;
  extern proc gr_switchmeta(id : c_uint);
  extern proc gr_registermeta(meta_event_type : c_void_ptr, meta_event_callback : c_void_ptr) : int;
  extern proc gr_unregistermeta(meta_event_type : c_void_ptr) : int;
  extern proc gr_meta_max_plotid() : c_uint;

  // TODO : dumpmeta and dumpmeta_json

  extern proc gr_load_from_str(str : c_string) : int;
  extern proc gr_dumpmeta_json_str() : c_string;
  extern proc gr_version() : c_string;
  extern proc gr_shade(n : int, x : c_ptr(real), y : c_ptr(real), a : int, b : int, ptr : c_ptr(real), c : int, d : int, ptr2 : c_ptr(int));
  extern proc gr_shadepoints(n : int, x : c_ptr(real), y : c_ptr(real), xform : int, w : int, h : int);
  extern proc gr_shadelines(n : int, x : c_ptr(real), y : c_ptr(real), xform : int, w : int, h : int);
  extern proc gr_panzoom(x : real, y : real, xzoom : real, yzoom : real, xmin : c_ptr(real), xmax : c_ptr(real), ymin : c_ptr(real), ymax : c_ptr(real));
  
  // TODO : Define findboundary
  // extern proc gr_findboundary

  extern proc gr_setresamplemethod(method : c_uint);
  extern proc gr_inqresamplemethod(flag : c_ptr(c_uint));
  extern proc gr_path(n : int, x : c_ptr(real), y : c_ptr(real), codes : c_string);
  // TODO
  // Line 936 GR.jl

  extern proc gr_setborderwidth(width : real);
  extern proc gr_inqborderwidth(width : c_ptr(real));
  extern proc gr_setbordercolorind(color : int);
  extern proc gr_inqbordercolorind(color : c_ptr(int));


}

use GRPlot;
// var a : [1..10] real = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0];
// var b : [1..10] real = [1.0,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1];
// polyline(a, b);
// writeln(inqlinewidth());
// setscale(10.0);
// writeln(inqscale());
while true{
  nothing;
}
