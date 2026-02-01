#include "mymouseclass.h"
#include <QtTypes>

void myMouseClass::moveCursor(const QPoint &p){
    myCursor.setPos(p.x(), p.y());
}

QPoint myMouseClass::readCursorPosition(){
    return myCursor.pos();
}

qint16 myMouseClass::mouseYDifference(const qint16 basePotisionY){
    return (basePotisionY - myCursor.pos().y());
}
qint16 myMouseClass::mouseXDifference(const qint16 basePotisionX){
    return (basePotisionX - myCursor.pos().x());
}

QVector3D myMouseClass::resultant_EulerRotation(QVector3D previousRotation ,const qint16 pitch_difference, const qint16 yaw_difference, const qreal sensitivity){
    qreal result_Y_rotation = (previousRotation.y() + (pitch_difference * sensitivity));
    qreal result_X_rotation = (previousRotation.x() +(yaw_difference * sensitivity)/2);
    previousRotation.setX(result_X_rotation);
    previousRotation.setY(result_Y_rotation);
    //Clamping X
    if(result_X_rotation >= 89.0){
        result_X_rotation = 88.9;
    } else if(result_X_rotation <= -89.0){
        result_X_rotation = (-88.9);
    }

    QVector3D returnVector(result_X_rotation, result_Y_rotation, 0.0);
    return returnVector;
}
