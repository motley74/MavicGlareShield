// Mavic Glare Shield

//special vars
$fn=100;


mavic_sun_shield();

module mavic_sun_shield() {
  translate([0,0,16]) {
    difference() {
      union() {
        main_dome();
        translate([-21,2,-8]) {
          gimbal_housing_solid();
        }
        translate([0,1,23]) {
          upper_connector_base();
        }
        translate([-13,21,-18]) {
          lower_connector_solid();
        }
      }
      translate([0,2.5,24]) {
        rotate([10,0,0]) {
          cube(size=[38,40,10], center=true);
        }
      }
      translate([0,0,-24]) {
        cube(size=[60,60,16], center=true);
      }
      translate([0,0,16.5]) {
        cube(size=[18,15,30], center=true);
      }
      sphere(d=53.5);
      translate([-21,2,-8]) {
        gimbal_housing_hollow();
      }
      translate([-13,21,-16]) {
        rotate([90,0,0]) {
          linear_extrude(height = 14, center = true) {
            polygon(points=[[1.5,1.5],[25.5,1.5],[27.5,30],[-2.5,30]]);
          }
        }
      }
      translate([0,4,21]) {
        rotate([75,0,0]) {
          cube(size=[60,10,45], center=true);
        }
      }
      translate([0,25.5,1.5]) {
        rotate([16,0,0]) {
          cube(size=[40,6,50], center=true);
        }
      }
      translate([0,28,-16]) {
        cube(size=[8,4,5], center=true);
      }
    }
    for (x=[-9,9]) {
      translate([x,-18,23]) {
        rotate([16,0,0]) {
          upper_connector_tab();
        }
      }
    }
    translate([0,24,-11.6]) {
      lower_connector_tab();
    }
  }
}

module main_dome() {
  difference() {
    sphere(d=55);
    translate([0,29,5]) {
      cube(size=[40,10,40], center=true);
    }
    translate([1,-18,-16]) {
      cube(size=[34,20,38], center=true);
    }
    translate([1,-23,0]) {
      rotate([-90,0,0]) {
        difference() {
          cylinder(d=34.5, h=10, center=true);
          translate([0,10,-5]) {
            cube(size=[40,20,20], center=true);
          }
        }
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
      cube(size=[14,26,20], center=true);
    }
  }
}

module gimbal_housing_hollow() {
  hull() {
    translate([1.5,0,0]) {
      rotate([0,90,0]) {
        cylinder(d=23, h=14, center=true);
      }
      translate([1.5,0,18]) {
        cube(size=[14,23,25], center=true);
      }
    }
  } 
}

module upper_connector_base() {
  difference() {
    rotate([18,0,0]) {
      cube(size=[40,40,10], center=true);
    }
    translate([0,0,5]) {
      rotate([-18,0,0]) {
        cube(size=[45,45,22], center=true);
      }
    }
  }
}

module upper_connector_tab() {
  cube(size=[5.6,1.2,4.5], center=true);
  translate([0,-1,2]) {
    rotate([-20,0,0]) {
      cube(size=[5.6,2,1.4], center=true);
    }
  }
}

module lower_connector_tab() {
  rotate([-17,0,0]) {
    cube(size=[6,2,7], center=true);
  }
  translate([0,1.3,3]) {
    cube(size=[6,2.5,2], center=true);
  }
}

module lower_connector_solid() {
  difference() {
    rotate([90,0,0]) {
      linear_extrude(height = 12, center = true) {
        polygon(points=[[0,0],[28,0],[30,30],[-5,30]]);
      }
    }
    translate([0,12,2]) {
      rotate([16,0,0]) {
        cube(size=[70,10,70], center=true);
      }
    }
  }
}