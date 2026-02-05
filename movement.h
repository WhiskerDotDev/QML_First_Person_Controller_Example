#ifndef MOVEMENT_H
#define MOVEMENT_H

#include <QObject>
#include <QQuickItem>

class movement : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    //Though, I barely have any idea what to do here... I guess I put a function to measure the time pressed down for a certain key? I may have to do one for each of the W, A, S, D keys...
    // Maybe I can add the camera directly as a function parameter so it can directly return a new 3D vector for position? That may be slightly more efficient...
    //However, question still remains, Tracking player movement. I probably don't have to make it excessively Complicated as the timer is expected to be 1/60th of a second or faster...
    //So within that time, the player barely has time to switch direction.
    //For now, I can just check for movement... Record prev. pos. and then depending on duration of a key being pressed, add to that initial position (based on speed)
    // We can evaluate:
    /*
     New_position = (old.+ (durationKeyPressed * speed))

    At each tick of the timer... Not the most elegant... Again, but could be better than the default controller, and easily swapped for a physics-based system (wink wink, maaaybe soon)
*/
    Q_INVOKABLE void movePlayer(); //Final class to move player by a certain amount each tick

signals:
};

#endif // MOVEMENT_H
