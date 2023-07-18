import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import LongUI 1.0 as LongUI

T.TabButton {
    id: control

    property int standardHeight: LongUI.Units.iconSizes.medium + LongUI.Units.smallSpacing
    property color pressedColor: Qt.rgba(LongUI.Theme.textColor.r, LongUI.Theme.textColor.g, LongUI.Theme.textColor.b, 0.5)

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             standardHeight)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 0
    spacing: 0

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        text: control.text
        font: control.font
        color: !control.enabled ? LongUI.Theme.disabledTextColor : control.pressed ? pressedColor : control.checked ? LongUI.Theme.textColor : LongUI.Theme.textColor
    }
}
