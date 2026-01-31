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
    function moveMyCursor(x, y) {
    myMouseController.moveCursor(Qt.point(x, y));
    }

    View3D{
    anchors.fill: parent;
    DirectionalLight{brightness: 0.1}

    Node{
    id: cameraOriginNode
    PerspectiveCamera{
        id:myCam;
        z:1000;
        eulerRotation: Qt.vector3d(0, 0 ,0)

    }
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

Rectangle{
    visible: false
    anchors.fill:parent
    MouseArea{
        enabled: true;
        id:screenArea
     anchors.fill: parent //Defines a mouse Area which fills the entire parent
    //cursorShape: Qt.BlankCursor;
     acceptedButtons: "NoButton"
    hoverEnabled: false;
    onPositionChanged: {
        moveMyCursor(half_width, half_height); //Move cursor to the center, works

        difference_vertical  = (half_height  -= screenArea.mouseY);
        difference_horizontal  = (half_width -= screenArea.mouseX);

        difference_horizontal= Math.max(-89, Math.min(89, difference_horizontal));

            result_horizontal += (difference_horizontal  *=sensitivity)
            result_vertical += (difference_vertical*=sensitivity)

            myCam.eulerRotation = Qt.vector3d(result_horizontal, result_vertical, 0)

        }
    }
}

property real result_vertical: 0.0;
property real result_horizontal: 0.0;



Text {
    id: name
    text: qsTr(screenArea.mouseX)
}



}
