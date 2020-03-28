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
    var mwidth, mheight : real;
    var width, height : int;
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
  proc polyline(x : [?D] real, y : [D] real) {
    gr_polyline(x.size, x, y);
  }
  
  extern proc gr_polymarker(n : int, x : [] real, y : [] real);
  proc polymarker(x : [?D] real, y : [D] real) {
    gr_polymarker(x.size, x, y);
  }

  extern proc gr_text(x : real, y : real, text : c_string);
  proc text(x : real, y : real, text : string) {
    gr_text(x, y, text.c_str());
  }

  extern proc gr_inqtext(x : real, y : real, str : c_string, tbx : [] real, tby : [] real);
  proc inqtext(x : real, y : real, text : string) {
    var tbx, tby : [1..4] real;
    gr_inqtext(x, y, text.c_str(), tbx, tby);
    return (tbx, tby);
  }

  extern proc gr_fillarea(n : int, x : [] real, y : [] real);
  proc fillarea(x : [?D] real, y : [D] real) {
    gr_fillarea(x.size, x, y);
  }

  extern proc gr_cellarray(xmin : real, xmax : real, ymin : real, ymax : real,
                           dimx : int, dimy : int, scol : int, srow : int, 
                           ncol : int, nrow : int, color : [] int);
  proc cellarray(xmin : real, xmax : real, ymin : real, ymax : real, dimx : real, dimy : real, color : [] int) {
    gr_cellarray(xmin, xmax, ymin, ymax, dimx, dimy, 1, 1, dimx, dimy, color);
  }

  extern proc gr_nonuniformcellarray(x : [] real, y : [] real, dimx : int, 
                                     dimy : int, scol : int, ncol : int, 
                                     nrow : int, color : [] int);
  proc nonuniformcellarray(x : [] real, y : [] real, dimx : int, dimy : int, color : [] int) {
    if !(x.size == dimx+1 && y.size == dimy+1) then halt("Incorrect dimensions");
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
  proc gdp(x : [?D] real, y : [D] real, primid : int, datarec : [] int) {
    gr_gdp(x.size, x, y, primid, datarec.size, datarec);
  }

  extern proc gr_spline(n : int, px : c_ptr(real), py : c_ptr(real), m : int, method : int);
  proc spline(x : [] real, y : real, m : int, method : int) {
    gr_spline(x.size, x, y, m, method);
  }

  extern proc gr_gridit(nd : int, xd : [] real, yd : [] real, zd : [] real,
                        nx : int, ny : int, x : [] real, y : [] real, z : [] real);
  proc gridit(xd : [] real, yd : [] real, zd : [] real, nx : int, ny : int) {
    var x : [1..nx] real = {1..nx};
    var y : [1..ny] real = {1..ny};
    var z : [1..nx*ny] real = {1..nx*ny};
    gr_gridit(xd.size, xd, yd, zd, nx, ny, x, y, z);

    return (x, y, z);
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

  extern proc gr_inqmarkersize(ref size : real);
  proc inqmarkersize() {
    var size : int;
    gr_inqmarkersize(size);
    return size;
  }

  extern "gr_setmarkercolorind" proc setmarkercolorind(color : int);

  extern proc gr_inqmarkercolorind(ref ptr : int);
  proc inqmarkercolorind() {
    var color : int;
    gr_inqmarkercolorind(color);
    return color;
  }

  extern "gr_settextfontprec" proc settextfontprec(font : int, precision : int);

  extern "gr_setcharexpan" proc setcharexpan(factor : real);

  extern "gr_setcharspace" proc setcharspace(space : real);

  extern "gr_settextcolorind" proc settextcolorind(color : int);

  extern "gr_setcharheight" proc setcharheight(height : real);

  extern "gr_setcharup" proc setcharup(ux : real, uy : real);

  extern "gr_settextpath" proc settextpath(path : int);

  extern "gr_settextalign" proc settextalign(horizontal : int, vertical : int);

  extern "gr_setfillintstyle" proc setfillintstyle(style : int);

  extern proc gr_inqfillintstyle(ref style : int);
  proc inqfillintstyle() {
    var style : int;
    gr_inqfillintstyle(style);
    return style;
  }

  extern "gr_setfillstyle" proc setfillstyle(ind : int);

  extern "gr_setfillcolorind" proc setfillcolorind(color : int);

  extern proc gr_inqfillcolorind(ref color : int);
  proc inqfillcolorind() {
    var color : int;
    gr_inqfillcolorind(color);
    return color;
  }

  extern "gr_setcolorrep" proc setcolorrep(color_index : int, red : real, green : real, blue : real);

  extern "gr_setwindow" proc setwindow(xmin : real, xmax : real, ymin : real, ymax : real);

  extern proc gr_inqwindow(ref xmin : real, ref xmax : real, 
                           ref ymin : real, ref ymax : real);
  proc inqwindow() {
    var xmin, xmax, ymin, ymax : int;
    gr_inqwindow(xmin, xmax, ymin, ymax);
    return (xmin, xmax, ymin, ymax);
  }

  extern "gr_setviewport" proc setviewport(xmin : real, xmax : real, ymin : real, ymax : real);

  extern proc gr_inqviewport(ref xmin : real, ref xmax : real, 
                             ref ymin : real, ref ymax : real);
  proc inqviewport() {
    var xmin, xmax, ymin, ymax : int;
    gr_inqviewport(xmin, xmax, ymin, ymax);
    return (xmin, xmax, ymin, ymax);
  }

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

  extern "gr_axes" proc axes(x_tick : real, y_tick : real, x_org : real, y_org : real, 
                      major_x : int, major_y : int, tick_size : real);

  // TODO
  extern proc gr_axeslbl(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : int, 
                        major_y : int, tick_size : real, fpx : c_fn_ptr, fpy : c_fn_ptr);

  extern "gr_grid" proc grid(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : int, 
                      major_y : int);

  extern "gr_grid3d" proc grid3d(x_tick : real, y_tick : real, z_tick : real, 
                        x_org : real, y_org : real, z_org : real, 
                        major_x : int, major_y : int, major_z : int);

  extern proc gr_verrorbars(n : int, px : c_ptr(real), py : c_ptr(real), 
                            e1 : c_ptr(real), e2 : c_ptr(real));
  proc verrorbars(px : [?D] real, py : [D] real, e1 : [D] real, e2 : [D] real) {
    gr_verrorbars(px.size, px, py, e1, e2);
  }

  extern proc gr_herrorbars(n : int, px : c_ptr(real), py : c_ptr(real), 
                            e1 : c_ptr(real), e2 : c_ptr(real));
  proc herrorbars(px : [?D] real, py : [D] real, e1 : [D] real, e2 : [D] real) {
    gr_herrorbars(px.size, px, py, e1, e2);
  }

  extern proc gr_polyline3d(n : int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  proc polyline3d(px : [?D] real, py : [D] real, pz : [D] real) {
    gr_polyline3d(px.size, px, py, pz);
  }

  extern proc gr_polymarker3d(n : int, px : c_ptr(real), py : c_ptr(real), pz : c_ptr(real));
  proc polymarker3d(px : [?D] real, py : [D] real, pz : [D] real) {
    gr_polymarker3d(px.size, px, py, pz);
  }

  extern proc gr_axes3d(x_tick : real, y_tick : real, z_tick : real, 
                        x_org : real, y_org : real, z_org : real, 
                        major_x : int, major_y : int, major_z : int, tick_size : real);

  extern proc gr_titles3d(xtitle : c_string, ytitle : c_string, ztitle : c_string);
  proc titles3d(xtitle : string = "", ytitle : string = "", ztitle : string = "") {
    gr_titles3d(xtitle.c_str(), ytitle.c_str(), ztitle.c_str());
  }

  extern proc gr_surface(nx : int, ny : int, 
                         px : [] real, py : [] real, pz : [] real, 
                         option : int);
  proc surface(px : [] real, py : [] real, pz : [] real, option : int) {
    if !(pz.size == px.size * py.size) then halt("Incorrect dimensions for pz");
    gr_surface(px.size, px, py.size, py, pz, option);
  }

  extern proc gr_contour(nx : int, ny : int , nh : int, 
                         px : [] real, py : [] real, h : [] real, pz : [] real, 
                         majorH : int);
  proc contour(px : [] real, py : [] real, h : [] real, pz : [] real, majorH : int) {
    if !(pz.size == px.size * py.size) then halt("Incorrect dimensions for pz");
    gr_contour(px.size, py.size, h.size, px, py, h, pz, majorH);
  }
  
  extern proc  gr_contourf(nx : int, ny : int, nh : int, 
                 px : [] real, py : [] real, h : [] real, pz : [] real, 
                 major_h : int);
  proc contourf(px : [] real, py : [] real, h : [] real, pz : [] real, majorH : int) {
    if !(pz.size == px.size * py.size) then halt("Incorrect dimensions for pz");
    gr_contourf(px.size, py.size, h.size, px, py, h, pz, majorH);
  }

  extern proc gr_tricontour(npoints : int, x : [] real, y : [] real, z : [] real, nlevels : int, levels : [] real);
  proc tricontour(x : [?D] real, y : [D] real, z : [D] real, levels : int) {
    gr_tricontour(x.size, x, y, z, levels.size, levels);
  }

  extern proc gr_hexbin(n : int, x : [] real, y : [] real, nbins : int) : int;
  proc hexbin(x : [?D] real, y : [D] real, nbins : int) return gr_hexbin(x.size, x, y, nbins);
  
  extern "gr_setcolormap" proc setcolormap(map_index : int);

  extern proc gr_inqcolormap(ref mapIndex : int);
  proc inqcolormap() {
    var mapIndex : int;
    gr_inqcolormap(mapIndex);
    return mapIndex;
  }

  extern proc gr_setcolormapfromrgb(n : int, r : [] real, g : [] real, b : [] real, x : c_ptr(real));
  proc setcolormapfromrgb(r : [?D] real, g : [D] real, b : [D] real, positions = nil) {
    gr_setcolormapfromrgb(r.size, r, g, b, positions);
  }
  proc setcolormapfromrgb(r : [?D] real, g : [D] real, b : [D] real, positions : [D] real) {
    gr_setcolormapfromrgb(r.size, r, g, b, c_ptrTo(positions));
  }

  extern "gr_colorbar" proc colorbar();

  extern proc gr_inqcolor(color : int, ref rgb : int);
  proc inqcolor(color : int) {
    var rgb : int;
    gr_inqcolor(color, rgb);
    return rgb;
  }

  extern proc gr_inqcolorfromrgb(r : real, g : real, b : real) : int;
  proc inqcolorfromrgb( r: real, g : real, b : real) {
    return gr_inqcolorfromrgb(r, g, b);
  }

  extern proc gr_hsvtorgb(h : real, s :real, v :real, ref r : real, ref g : real, ref b : real);
  proc hsvtorgb(h : real, s : real, v : real) {
    var r, g, b : real;
    gr_hsvtorgb(h, s, v, r, g, b);
    return (r, g, b);
  }

  extern "gr_tick" proc tick(amin : real, amax : real) : real;

  extern "gr_validaterange" proc validaterange(amin : real, amax : real) : int;

  extern "gr_adjustlimits" proc adjustlimits(ref amin : real, amax : real);

  extern "gr_adjustrange" proc adjustrange(ref amin : real, ref amax : real);
  
  extern proc gr_beginprint(pathname : c_string);
  proc beginprint(pathname : string) {
    gr_beginprint(pathname.c_str());
  }

  extern proc gr_beginprintext(pathname : c_string, mode : c_string, format : c_string, orientation : c_string);
  proc beginprinttext(pathname : string, mode : string, format : string, orientation : string) {
    gr_beginprintext(pathname.c_str(), mode.c_str(), format.c_str(), orientation.c_str());
  }
  
  extern "gr_endprint" proc endprint();

  extern "gr_ndctowc" proc ndctowc(ref x : real, ref y : real);

  extern "gr_wctondc" proc wctondc(ref x : real, ref y : real);

  extern "gr_wc3towcx" proc wc3towcx(ref x : real, ref y : real, ref z : real);

  extern "gr_drawrect" proc drawrect(xmin : real, xmax : real, ymin : real, ymax : real);

  extern "gr_fillrect" proc fillrect(xmin : real, xmax : real, ymin : real, ymax : real);

  extern "gr_drawarc" proc drawarc(xmin : real, xmax : real, ymin : real, ymax : real, a1: real, a2 : real);

  extern "gr_fillarc" proc fillarc(xmin : real, xmax : real, ymin : real, ymax : real, a1: real, a2 : real);
  
  extern proc gr_drawpath(n : int, points : real, codes : [] c_uchar, fill : int);
  proc drawpath(points : [] real, codes : [] integral, fill : int) {
    var _codes = [x in codes] x : c_uchar;
    gr_drawpath(codes.size, points, _codes, fill);
  }

  extern "gr_setarrowstyle" proc setarrowstyle(style : int);
  extern "gr_setarrowsize" proc setarrowsize(size : real);
  extern "gr_drawarrow" proc drawarrow(x1 : real, x2 : real, y1 : real, y2 : real);
  
  // TODO
  extern proc gr_readimage(path : c_string, ref width : int, ref height : int, data : c_ptr(c_ptr(int))) : int;

  extern proc gr_drawimage(xmin : real, xmax : real, ymin : real, ymax : real, width : int, height : int, data : [] int, model : int);
  proc drawimage(xmin : real, xmax : real, ymin : real, ymax : real, width : int, height : int, data : [] int, model : int = 0) {
    gr_drawimage(xmin, xmax, ymin, ymax, width, height, data, model);
  }

  extern proc gr_importgraphics(path : c_string) : int;
  proc importgraphics(path : string) return gr_importgraphics(path.c_str());

  extern "gr_setshadow" proc setshadow(offsetx : real, offsety : real, blur : real);

  extern "gr_settransparency" proc settransparency(alpha : real);

  extern proc gr_setcoordxform(mat : [] real);
  proc setcoordxform(mat : [?D] ?t) {
    if mat.size != 6 {
      halt("Matrix cannot be cast to valid dimensions 2x3");
    }

    if mat.eltType != real {
      var matCast : [1..6] real = [x in mat] x : real;
      gr_setcoordxform(matCast);
      return;
    } else {
      gr_setcoordxform(mat);
    }
 
  }
  
  extern proc gr_begingraphics(path : c_string);
  proc begingraphics(path : string) {
    gr_begingraphics(path.c_str());
  }

  extern "gr_endgraphics" proc endgraphics();
  extern "gr_getgraphics" proc getgraphics() : c_string;

  extern proc gr_getgraphics(str : c_string) : int;
  proc getgraphics(str : string) return gr_getgraphics(str.c_str());

  extern proc gr_mathtex(x : real, y : real, str : c_string);
  proc mathtex(x : real, y : real, str : string) {
    gr_mathtex(x, y, str.c_str());
  }

  extern proc gr_inqmathtex(x : real, y :real, str : c_string, tbx : [] real, tby : [] real);
  proc inqmathtex(x : real, y : real, str : string) {
    var tbx, tby : [1..4] real;
    gr_inqmathtex(x, y, str, c_str(), tbx, tby);
  }

  extern "gr_beginselection" proc beginselection(x : int, y: int);
  extern "gr_endselection" proc endselection();
  extern "gr_moveselection" proc moveselection(x : real, y : real);

  extern "gr_resizeselection" proc gr_resizeselection(a : int, x : real, y: real);
  extern proc gr_inqbbox(ref xmin : real, ref xmax : real, ref ymin : real, ref ymax : real);
  proc inqbox() {
    var xmin, xmax, ymin, ymax : real;

  }
  
  extern "gr_precision" proc precision() : real;

  extern "gr_setregenflags" proc setregenflags(flag : int);

  extern "gr_inqregenflags" proc inqregenflags() : int;

  extern "gr_savestate" proc savestate();

  extern "gr_restorestate" proc restorestate();

  extern "gr_selectcontext" proc selectcontext(context : int);

  extern "gr_destroycontext" proc destroycontext(context : int);

  extern proc gr_uselinespec(linespec : c_string) : int;
  proc uselinespec(linespec : string) return gr_uselinespec(linespec.c_str());

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
  extern "gr_finalizemeta" proc gr_finalizemeta();

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

  extern "gr_clearmeta" proc clearmeta() : int;

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
  proc loadFromStr(str : string) return gr_load_from_str(str.c_str());

  extern proc gr_dumpmeta_json_str() : c_string;
  proc dumpMetaJsonStr() return gr_dumpmeta_json_str() : string;

  extern proc gr_version() : c_string;
  proc version() return gr_version() : string;

  // TODO : Below
  extern proc gr_shade(n : int, x : [] real, y : [] real, a : int, b : int, ptr : c_ptr(real), c : int, d : int, ptr2 : c_ptr(int));

  extern proc gr_shadepoints(n : int, x : [] real, y : [] real, xform : int, w : int, h : int);
  proc shadepoints(x : [?D] ?t, y : [D] t, dims = (1200,1200), xform = 1) {
    var (w, h) : int = dims;
    shadepoints(x.size, x, y, xform, w, h);
  }

  extern proc gr_shadelines(n : int, x : [] real, y : [] real, xform : int, w : int, h : int);
  proc shadelines(x : [?D] ?t, y : [D] t, dims = (1200,1200), xform = 1) {
    var (w, h) : int = dims;
    shadepoints(x.size, x, y, xform, w, h);
  }

  extern proc gr_panzoom(x : real, y : real, xzoom : real, yzoom : real, ref xmin : real, ref xmax : real, ref ymin : real, ref ymax : real);
  proc panzoom(x : real, y : real, zoom : real) {
    var xmin, xmax, ymin, ymax : real;
    gr_panzoom(x, y, zoom, zoom, xmin, xmax, ymin, ymax);
    return (xmin, xmax, ymin, ymax);
  }
  
  // TODO : Define findboundary
  // extern proc gr_findboundary

  extern "gr_setresamplemethod" proc setresamplemethod(method : int);

  extern proc gr_inqresamplemethod(ref flag : int);
  proc inqresamplemethod() {
    var flag : int;
    gr_inqresamplemethod(flag);
    return flag;
  }

  extern proc gr_path(n : int, x : [] real, y : [] real, codes : c_string);
  proc path(x : [?D] real, y : [D] real, codes : string) {
    gr_path(x.size, x, y, codes.c_str());
  }

  extern "gr_setborderwidth" proc setborderwidth(width : real);

  extern proc gr_inqborderwidth(ref width : real);
  proc inqborderwidth() {
    var width : real;
    gr_inqborderwidth(width);
    return width;
  }

  extern "gr_setbordercolorind" proc setbordercolorind(color : int);

  extern proc gr_inqbordercolorind(ref color : int);
  proc inqbordercolorind() {
    var color : int;
    gr_inqbordercolorind(color);
    return color;
  }
}
