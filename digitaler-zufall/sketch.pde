buy schaschlikspieße[50];
buy tape;
get glasplatte(opak);
get softbox;
get camera;
get tripod;

void setup() {
    create Arbeitsfläche() {
        material = glasplatte(opak);
        size(1000, 1000);
}

    create Rectangle() {
        mode = center;
        size(200, 200);
        stroke(tape) ;
        }

    install Light() {
        softbox.position(under(rectangle));
        softbox.direction(up);
        }

    install Camera() {
        tripod.position(over(rectangle));
        mount camera(tripod);
        }

    new Document(InDesign) {
        size(1000, 1000);
        bgColor = white;
        margins(15, 15, 15, 15);
        create grid {
            horizontal(width/4);
            vertical(height/4);
            spacing = 10;
            strokeWeight = 7;
            strokeColor = black;
            }
        }
}

void draw() {
    for(int i = 0; i<16; i++) {
    mikado.fall();
    camera.photo();
    }

    camera.transfer();
    laptop.imageprocessing();
    laptop.indesign();
}

class mikado {

    void fall() {
        schaschlikspieße[50].position(center(rectangle));
        release schaschlikspieße[50];
    {
}

class camera {

    void photo() {
        resolution = max;
        iso = 100;
        aperture = 11;
        shutterSpeed = 200;
        focus = auto;
        imageSection(Rectangle);
        release(shutter);
    }

    void transfer() {
        connect camera(laptop);
        copy images.all(laptop);
    }
}

class laptop {

    void imageprocessing {
        colormode = greyscale;
        contrast = high;
    }

    void indesign {
        import images(InDesign);
        crop images(Rectangle - 5);
        arrange images(grid);
    }
}

void display {
    printout Document(InDesign);
    exhibit printout(gallery);
    IF (you != get(rich) || you != get(famous)) {
    try(somethingelse);
    }
}
