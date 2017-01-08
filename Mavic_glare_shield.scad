// Mavic Glare Shield

// special vars
$fn=100;

// call main module
mavic_sun_shield();

module mavic_sun_shield() {
  difference() {
    // create main dome with gimbal area
    union() {
      main_dome();
      translate([-24,.5,-4.5]) {
        gimbal_housing_solid();
      }
      // add upper connector area
      translate([-3,3,21]) {
        rotate([18,0,0]) {
          cube(size=[40,40,18], center=true);
        }
      }
      // add lower connector area
      translate([-18,20,-17.4]) {
        lower_connector_solid();
      }
    }
    // hollow out upper connector area
    translate([-3,4,24]) {
      rotate([18,0,0]) {
        cube(size=[38,40,15], center=true);
      }
    }
    // hollow out the lower connecter area
    translate([-18,20,-15.5]) {
      rotate([90,0,0]) {
        linear_extrude(height = 17, center = true) {
          polygon(points=[[1.5,1.5],[28.5,1.5],[30.5,32],[-1.5,32]]);
        }
      }
    }
    // hollow out the sphere
    sphere(d=52.5);
    // hollow out the gimbal area
    translate([-24,.5,-4]) {
      gimbal_housing_hollow();
    }
    // trim the top at the proper angle
    translate([2,4.5,28]) {
      rotate([76,0,0]) {
        cube(size=[47,24,45], center=true);
      }
    }
    // trim the top of gimbal area at the proper angle
    translate([-25,4,31]) {
      rotate([76,8,0]) {
        cube(size=[12,28,45], center=true);
      }
    }
    // trim the rear at proper angle for lower connecter area
    translate([0,25,14.5]) {
      rotate([16,0,0]) {
        cube(size=[50,9,80], center=true);
      }
    }
    // trim the bottom of the dome
    translate([-32,-25,-31.2]) {
      cube(size=[80,60,14], center=false);
    }
    // cut out slot for pressing lower connector tab
    translate([-3,28,-16]) {
      cube(size=[12,6,5], center=true);
    }
  }
  // add the upper connector tabs
  for (x=[-12,6]) {
    translate([x,-16.5,22.5]) {
      rotate([8,0,0]) {
        upper_connector_tab();
      }
    }
  }
  // add the lower connector tab
  difference() {
    translate([-3,23.8,-11.2]) {
      rotate([-10,0,0]) {
        lower_connector_tab();
      }
    }
    // trim the bottom of the dome (match previous trim)
    translate([-32,-25,-31.2]) {
      cube(size=[80,60,14], center=false);
    }
  }
}

module main_dome() {
  difference() {
    sphere(d=54);
    // cut out camera view area
    hull() {
      translate([0,-19,0]) {
        rotate([-90,0,0]) {
          cylinder(d=33, h=15, center=true);
        }
      }
      translate([0,-19,-16]) {
        cube(size=[32.7,18,38], center=true);
      }
    }
  }
}

module gimbal_housing_solid() {
  hull() {
    rotate([0,90,0]) {
      cylinder(d=26, h=14, center=true);
    }
    translate([0,0,18]) {
      cube(size=[14,27,20], center=true);
    }
  }
}

module gimbal_housing_hollow() {
  hull() {
    translate([1.5,0,0]) {
      rotate([0,90,0]) {
        cylinder(d=24.5, h=14, center=true);
      }
      translate([1.5,0,18]) {
        cube(size=[14,25.5,25], center=true);
      }
    }
  } 
}

module upper_connector_tab() {
  cube(size=[5.6,1.2,4.5], center=true);
  translate([0,-1,2.2]) {
    rotate([-20,0,0]) {
      cube(size=[5.6,2,1.2], center=true);
    }
  }
}

module lower_connector_solid() {
  difference() {
    rotate([90,0,0]) {
      linear_extrude(height = 16, center = true) {
        polygon(points=[[0,0],[30,0],[32,31],[-3,31]]);
      }
    }
  }
}

module lower_connector_tab() {
  cube(size=[10,1.8,6.4], center=true);
  rotate([4,0,0]) {
    translate([0,1.8,2.2]) {
      cube(size=[10,3,1.6], center=true);
    }
    difference() {
      hull() {
        translate([0,3.5,-4]) {
          cube(size=[10,1.8,5], center=true);
        }
        translate([0,3.2,2]) {
          rotate([0,90,0]) {
            cylinder(d=1.8, h=10, center=true);
          }
        }
      }
      translate([0,4.4,-.2]) {
        rotate([0,90,0]) {
          cylinder(d=2.2, h=11, center=true);
        }
      }
    }
  }
}