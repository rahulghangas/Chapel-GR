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
  extern proc gr_setcolorrep(color_index : c_int, red : real, green : real, blue : real);
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
  extern proc gr_axes3d(x_tick : real, y_tick : real, z_tick : real, 
                        x_org : real, y_org : real, z_org : real, 
                        major_x : c_int, major_y : c_int, major_z : c_int, tick_size : real);
  extern proc titles3d(x_title : c_string, y_title : c_string, z_title : c_string);
  extern proc gr_surface(nx : c_int, ny : c_int, 
                         px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real), 
                         option : c_int);
  extern proc gr_contour(nx : c_int, ny : c_int , nh : c_int, 
                         px : c_ptr(real), py : c_ptr(real), h : c_ptr(real), pz : c_ptr(real), 
                         mahor_h : c_int);
  extern proc  gr_contourf(nx : c_int, ny : c_int, nh : c_int, 
                 px : c_ptr(real), py : c_ptr(real), h : c_ptr(real), pz : c_ptr(real), 
                 major_h : c_int);
  extern proc gr_tricontour(npoints : c_int, x : c_ptr(real), y :c_ptr(real), z : c_ptr(real), nlevels : c_int, evels : c_ptr(real));
  extern proc gr_hexbin(n : c_int, x : c_ptr(real), y : c_ptr(real), nbins : c_int) : c_int;
  extern proc gr_setcolormap(map_index : c_int);
  extern proc gr_inqcolormap(map_index : c_ptr(c_int));
  extern proc gr_setcolormapfromrgb(n : c_int, r : c_ptr(real), g : c_ptr(real), b : c_ptr(real), x : c_ptr(real));
  extern proc gr_colorbar();
  extern proc gr_inqcolor(color : c_int, rgb : c_ptr(c_int));
  extern proc gr_inqcolorfromrgb(r : real, g : real, b : real) : c_int;
  extern proc gr_hsvtorgb(h : real, s :real, v :real, r :c_ptr(real), g : c_ptr(real), b : c_ptr(real));
  extern proc gr_tick(amin : real, amax : real) : real;
  extern proc gr_validaterange(amin : real, amax : real) : c_int;
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
  extern proc gr_drawpath(n : c_int, points : c_ptr(real), codes : c_ptr(c_uchar), fill : c_int);
  extern proc gr_setarrowstyle(style : c_int);
  extern proc gr_setarrowsize(size : real);
  extern proc gr_drawarrow(x1 : real, x2 : real, y1 : real, y2 : real);
  extern proc gr_readimage(path : c_string, width : c_ptr(c_int), height : c_ptr(c_int), data : c_ptr(c_ptr(c_int))) : c_int;
  extern proc gr_drawimage(xmin : real, xmax : real, ymin : real, ymax : real, width : c_int, height : c_int, data : c_ptr(c_int), model : c_int);
  extern proc gr_importgraphics(path : c_string) : c_int;
  extern proc gr_setshadow(offsetx : real, offsety : real, blur : real);
  extern proc gr_settransparency(alpha : real);
  extern proc gr_setcoordxform(mat : c_ptr(real));
  extern proc gr_begingraphics(path : c_string);
  extern proc gr_endgraphics();
  extern proc gr_getgraphics() : c_string;
  extern proc gr_getgraphics(str : c_string) : c_int;
  extern proc gr_mathtex(x : real, y : real, str : c_string);
  extern proc gr_inqmathtex(x : real, y :real, str : c_string, tbx : c_ptr(real), tby : c_ptr(real));
  extern proc gr_beginselection(x : c_int, y: c_int);
  extern proc gr_endselection();
  extern proc gr_moveselection(x : real, y : real);
  extern proc gr_resizeselection(a : c_int, x : real, y: real);
  extern proc gr_inqbbox(xmin : c_ptr(real), xmax : c_ptr(real), ymin : c_ptr(real), ymax : c_ptr(real));
  extern proc gr_precision() : real;
  extern proc gr_setregenflags(flag : c_int);
  extern proc gr_inqregenflags() : c_int;
  extern proc gr_savestate();
  extern proc gr_restorestate();
  extern proc gr_selectcontext(context : c_int);
  extern proc gr_destroycontext(context : c_int);
  extern proc gr_uselinespec(linespec : c_string) : c_int;
  extern proc gr_delaunay(n : c_int, const x : real, const y : real, ntri : c_ptr(c_int), traingles : c_ptr(c_ptr(c_int)));
  extern proc gr_reducepoints(n : c_int, const x : real, const y : real, points : c_int, x_array : c_ptr(real), y_array : c_ptr(real));
  extern proc gr_trisurface(n : c_int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  extern proc gr_gradient(nx : c_int, ny : c_int, x : c_ptr(real), y : c_ptr(real), z : c_ptr(real), u : c_ptr(real), v : c_ptr(real));
  extern proc gr_quiver(nx : c_int, ny : c_int, x : c_ptr(real), y : c_ptr(real), u : c_ptr(real), v : c_ptr(real), color : c_int);
  extern proc gr_interp2(nx : c_int, ny : c_int, 
                         const x : c_ptr(real), const y : c_ptr(real), const z : c_ptr(real), 
                         nxq : c_int, nyq : c_int, 
                         const xq : c_ptr(real), const yq : c_ptr(real), const zq : c_ptr(real), 
                         method : c_int, extrapval : real);
  extern proc gr_newmeta() : c_void_ptr;
  extern proc gr_deletemeta(arg : c_void_ptr);
  extern proc gr_finalizemeta();

  // Finish gr_meta...
  extern proc gr_meta_args_push(arg : c_void_ptr, str : c_string ...?n);
  // gr_meta... block end

  extern proc gr_openmeta(target : c_int, device : c_string, port : c_uint, send_c : c_void_ptr, recv_c : c_void_ptr) : c_void_ptr;
  extern proc gr_recvmeta(handle : c_void_ptr, arg : c_void_ptr) : c_void_ptr;
  extern proc gr_sendmeta(const handle : c_void_ptr, str : c_string) : c_int;
  extern proc gr_sendmeta_buf(const handle : c_void_ptr, key : c_string, const data : c_void_ptr, len : c_int) : c_int;
  extern proc gr_sendmeta_ref(const handle : c_void_ptr, key : c_string, fmt : c_char, const data : c_void_ptr, len : c_int) : c_int;
  extern proc gr_sendmeta_args(handle : c_void_ptr, arg : c_void_ptr) : c_int;
  extern proc gr_closemeta(const handle : c_void_ptr);
  extern proc gr_clearmeta() : c_int;
  extern proc gr_inputmeta(const arg : c_void_ptr) : c_int;
  extern proc gr_mergemeta(const arg : c_void_ptr) : c_int;
  extern proc gr_mergemeta_named(const args : c_void_ptr, identificator : c_string) : c_int;
  extern proc gr_plotmeta(const args : c_void_ptr) : c_int;
  extern proc gr_readmeta(const args : c_void_ptr, str : c_string) : c_int;
  extern proc gr_switchmeta(id : c_uint);
  extern proc gr_registermeta(meta_event_type : c_void_ptr, meta_event_callback : c_void_ptr) : c_int;
  extern proc gr_unregistermeta(meta_event_type : c_void_ptr) : c_int;
  extern proc gr_meta_max_plotid() : c_uint;

  // TODO : dumpmeta and dumpmeta_json

  extern proc gr_load_from_str(str : c_string) : c_int;
  extern proc gr_dumpmeta_json_str() : c_string;
  extern proc gr_version() : c_string;
  extern proc gr_shade(n : c_int, x : c_ptr(real), y : c_ptr(real), a : c_int, b : c_int, ptr : c_ptr(real), c : c_int, d : c_int, ptr2 : c_ptr(c_int));
  extern proc gr_shadepoints(n : c_int, x : c_ptr(real), y : c_ptr(real), xform : c_int, w : c_int, h : c_int);
  extern proc gr_shadelines(n : c_int, x : c_ptr(real), y : c_ptr(real), xform : c_int, w : c_int, h : c_int);
  extern proc gr_panzoom(x : real, y : real, xzoom : real, yzoom : real, xmin : c_ptr(real), xmax : c_ptr(real), ymin : c_ptr(real), ymax : c_ptr(real));
  
  // TODO : Define findboundary
  // extern proc gr_findboundary

  extern proc gr_setresamplemethod(method : c_uint);
  extern proc gr_inqresamplemethod(flag : c_ptr(c_uint));
  extern proc gr_path(n : c_int, x : c_ptr(real), y : c_ptr(real), codes : c_string);
  extern proc gr_setborderwidth(width : real);
  extern proc gr_inqborderwidth(width : c_ptr(real));
  extern proc gr_setbordercolorind(color : c_int);
  extern proc gr_inqbordercolorind(color : c_ptr(c_int));

  proc polyline(x : [?D1] ?t1, y : [?D2] ?t2){
    gr_polyline((x.size : uint(8)) : int(32), x, y);
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
