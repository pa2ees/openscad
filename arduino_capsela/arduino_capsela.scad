old_style_body_ID=10;
old_style_body_OD=14;
new_style_body_slot_diameter=12;
body_height=12;


module pie(radius, arc_len, angle) {
    render() {
        rotate([0, 0, angle]) {
            intersection() {
                $fa=1;
                $fs=.1;
                circle(radius);
                difference() {
                    square(radius, radius);
                    rotate([0, 0, arc_len]) {
                        square(radius*2, radius*2);
                    }
                }
            }
        }
    }
}

module octagon(diameter) {
    intersection() {
        square(diameter, center=true);
        rotate([0, 0, -45]) {
            square(diameter, center=true);
        }
    }
}

module old_style_body(id, od) {
    rotate([0, 0, -45/2]) {

        difference() {
            $fa=1;
            $fs=.1;
            circle(od/2); // circle takes a radius
            octagon(id);
        }
    }
}

linear_extrude(height=body_height) {
    difference() {
        old_style_body(old_style_body_ID, old_style_body_OD);
    
        for (var = [0 : 360/8 : 360]) {
            pie(new_style_body_slot_diameter/2, 20, var-10);
            
        }
    }
}

