import QtQuick;
import QtQuick3D;
import QtQuick3D.Helpers;
import myMouseClass;


Window {
    id: rootWIndow;
    visibility: "FullScreen"; //Simply makes the window fullscreen,
    visible: true;

    title: qsTr("Let's Game Jam!");
    property int half_height: (rootWIndow.height/2);
    property int half_width: (rootWIndow.width/2);
    property real difference_vertical: 0;
    property real difference_horizontal: 0;
    property real sensitivity: 0.1;

Custom_mouseClass{
            id: myMouseController;
    }
MouseArea{
anchors.fill: parent;
cursorShape: "BlankCursor";
}

Rectangle{
    Image {
        id: crosshair;
        source: "crosshair_0.png";
        sourceSize: Qt.size(42, 42);
        smooth:true;
    }
    id:crosshairRectangle;
    y: (half_height - (crosshair.sourceSize.height)/2);
    x: (half_width - (crosshair.sourceSize.width)/2);
}

    View3D{
    anchors.fill: parent;
    renderMode:  View3D.Underlay;
    DirectionalLight{brightness: 0.1;}

    PerspectiveCamera{
        id:myCam;
        z:1000;
        eulerRotation: Qt.vector3d(0, 0 ,0);
    }

Node{
        id: myCubeNode;
    Model{id: myCube
        source: "#Cube";
        scale: Qt.vector3d(3, 3, 3) //Perfect Cube!
        position: Qt.vector3d(0, 0, 0); //Vector3d is simply a function that denotes a scale value
                    materials: PrincipledMaterial {
                    baseColor: "#40c060" //Apparently works but doesn't do jack shit?
                    roughness: 0.1
                    metalness: 0
            }
        }
    }
}

property real result_vertical: 0.0;
property real result_horizontal: 0.0;

Timer{
    id:tickTimer;
running: true;
interval: 10 //Approximately 1/60th of a second.
//triggeredOnStart: true;//Just to make the first tick the one where the trigger action runs
repeat: true;
    onTriggered :{
        myCam.eulerRotation = (myMouseController.resultant_EulerRotation(myCam.eulerRotation,
        myMouseController.mouseXDifference(half_width),
        myMouseController.mouseYDifference(half_height),
        sensitivity))
        myMouseController.moveCursor(Qt.point(half_width, half_height)); //centers the mouse cursor
        }
    }
}
