/* Documentation for GR */
module GRPlot {
  require "gr.h";

  extern proc gr_initgr();
  extern proc gr_opengks();
  extern proc gr_closegks();
  extern proc gr_inqdspsize(mWidth : c_ptr(real), mHeight : c_ptr(real), width : c_ptr(c_int), height : c_ptr(c_int));
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

  extern proc gr_axes(x_tick : real, y_tick : real, x_org : real, y_org : real, major_x : int, major_y : int, tick_size : real);
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
