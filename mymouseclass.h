#ifndef MYMOUSECLASS_H
#define MYMOUSECLASS_H

#include <QObject>
#include <QQmlEngine>
#include <QCursor>
#include <QVector3D>

class myMouseClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT


 public slots:

    Q_INVOKABLE void moveCursor(QPoint &p);
    Q_INVOKABLE QPoint readCursorPosition(); //Remember to use the .x and .y methods.
    Q_INVOKABLE int mouseYDifference(int &basePotisionY);
    Q_INVOKABLE int mouseXDifference(int &basePositionX);
    Q_INVOKABLE QVector3D resultant_EulerRotation(qint16 &x_difference, qint16 &y_difference, qreal &sensitivity); //X, Y and 0 will be reutnred. I.e.
private:
    QCursor myCursor;
};

#endif // MYMOUSECLASS_H
