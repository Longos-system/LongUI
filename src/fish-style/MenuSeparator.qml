import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import LongUI 1.0 as LongUI

T.MenuSeparator {
    id: control

    implicitHeight: LongUI.Units.largeSpacing + separator.height
    width: parent.width

    background: Rectangle {
        id: separator
        anchors.centerIn: control
        width: control.width - LongUI.Units.largeSpacing * 2
        height: 1
        color: LongUI.Theme.textColor
        opacity: 0.3
    }
}