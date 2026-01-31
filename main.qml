import QtQuick;
import QtQuick3D;
import QtQuick3D.Helpers;
import myMouseClass;


Window {
    id: rootWIndow
    visibility: "FullScreen"; //Simply makes the window fullscreen,
    visible: true;

    title: qsTr("Let's Game Jam!");
    property int half_height: (rootWIndow.height/2);
    property int half_width: (rootWIndow.width/2);
    property real difference_vertical: 0;
    property real difference_horizontal: 0;
    property real sensitivity: 0.1;

    Custom_mouseClass{
        id: myMouseController
        }

    View3D{
    anchors.fill: parent;
    DirectionalLight{brightness: 0.1}
    renderMode:  View3D.Overlay

    PerspectiveCamera{
        id:myCam;
        z:1000;
        eulerRotation: Qt.vector3d(0, 0 ,0)

    }

   // DirectionalLight{brightness: 0.1 } //This is simply a global light, presumably with a brightness value of 100.
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
interval: 200; //Approximately 1/60th of a second.
triggeredOnStart: true; //Just to make the first tick the one where the trigger action runs
onTriggered :{
myMouseController.moveCursor(Qt.point(half_width, half_height)); //centers the mouse cursor
myCam.eulerRotation = (myMouseController.resultant_EulerRotation(
    myMouseController.mouseXDifference(half_width),
    myMouseController.mouseYDifference(half_height),
    sensitivity))
}
repeat: true;
}

}
