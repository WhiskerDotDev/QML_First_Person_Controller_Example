#include "mymouseclass.h"
#include <QtTypes>
#include <algorithm>
//Define everyting below here. Aside from Variables.

void myMouseClass::moveCursor(const QPoint &p){
    myCursor.setPos(p.x(), p.y());
}

QPoint myMouseClass::readCursorPosition(){
    return myCursor.pos();
}

int myMouseClass::mouseYDifference(const int basePotisionY){
    return (basePotisionY - myCursor.pos().y());
}
int myMouseClass::mouseXDifference(const int basePotisionX){
    return (basePotisionX - myCursor.pos().x());
}

QVector3D myMouseClass::resultant_EulerRotation(const qint16 pitch_difference, const qint16 yaw_difference, const qreal sensitivity){
    qreal result_Y_rotation = (yaw_difference * sensitivity);
    qreal result_X_rotation = (pitch_difference * sensitivity);


    //Clamping X
    result_X_rotation = std::max(-89.0, std::min(result_X_rotation, 89.0));

    QVector3D returnVector(result_X_rotation, result_Y_rotation, 0.0);
    return returnVector;
}
