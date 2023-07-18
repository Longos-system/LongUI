import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import LongUI 1.0 as LongUI

T.MenuItem
{
    id: control

    property color hoveredColor: LongUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.2)
                                                       : Qt.rgba(0, 0, 0, 0.1)
    property color pressedColor: LongUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1)
                                                       : Qt.rgba(0, 0, 0, 0.2)

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    verticalPadding: LongUI.Units.smallSpacing
    hoverEnabled: true
    topPadding: LongUI.Units.smallSpacing
    bottomPadding: LongUI.Units.smallSpacing

    icon.width: LongUI.Units.iconSizes.medium
    icon.height: LongUI.Units.iconSizes.medium

    icon.color: control.enabled ? (control.highlighted ? control.LongUI.Theme.highlightColor : control.LongUI.Theme.textColor) :
                             control.LongUI.Theme.disabledTextColor

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding + LongUI.Units.smallSpacing * 2 : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding + LongUI.Units.smallSpacing * 2

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? control.pressed || control.hovered ? control.LongUI.Theme.textColor : 
               LongUI.Theme.textColor : control.LongUI.Theme.disabledTextColor
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: control.visible ? LongUI.Units.gridUnit + LongUI.Units.largeSpacing : 0
        radius: LongUI.Theme.mediumRadius
        opacity: 1

        anchors {
            fill: parent
            leftMargin: LongUI.Units.smallSpacing
            rightMargin: LongUI.Units.smallSpacing
        }

        color: control.pressed || highlighted ? control.pressedColor : control.hovered ? control.hoveredColor : "transparent"
    }
}
