#include "mymouseclass.h"
#include <math.h>
#include <QVector3D>
//Define everyting below here. Aside from Variables.

void myMouseClass::moveCursor( QPoint &p){
    myCursor.setPos(p.x(), p.y());
}

QPoint myMouseClass::readCursorPosition(){
    return myCursor.pos();
}

int myMouseClass::mouseYDifference(int &basePotisionY){
    return (basePotisionY - myCursor.pos().y());
};
int myMouseClass::mouseXDifference(int &basePotisionX){
    return (basePotisionX - myCursor.pos().x());
}

QVector3D myMouseClass::resultant_EulerRotation(qint16 &pitch_difference, qint16 &yaw_difference, qreal &sensitivity){
    qreal result_X_rotation = (pitch_difference * sensitivity);
    qreal result_Y_rotation = (yaw_difference * sensitivity);
    //Clamping X
    result_X_rotation = std::max(89.0, std::min(result_X_rotation, 89.0));



    QVector3D returnVector(result_X_rotation, result_Y_rotation, 0.0);
    return returnVector;
};
