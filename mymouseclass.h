#ifndef MYMOUSECLASS_H
#define MYMOUSECLASS_H

#include <QObject>
#include <QQmlEngine>
#include <QCursor>
#include <QVector3D>
#include <QtTypes>

class myMouseClass : public QObject
{
    Q_OBJECT
    QML_ELEMENT


 public slots:

    Q_INVOKABLE void moveCursor(const QPoint &p);
    Q_INVOKABLE QPoint readCursorPosition(); //Remember to use the .x and .y methods.
    Q_INVOKABLE int mouseYDifference(const int basePotisionY);
    Q_INVOKABLE int mouseXDifference(const int basePositionX);
    Q_INVOKABLE QVector3D resultant_EulerRotation(const qint16 x_difference, const qint16 y_difference, const qreal sensitivity); //X, Y and 0 will be reutnred. I.e.
private:
    QCursor myCursor;
};

#endif // MYMOUSECLASS_H
