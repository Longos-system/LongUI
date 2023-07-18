// //LongOS - Button
// import QtQuick 2.12
// import QtQuick.Controls 2.12
// import QtQuick.Templates 2.12 as T
// import QtGraphicalEffects 1.0
// import LongUI 1.0 as LongUI
// import QtQuick.Controls.impl 2.12
import QtQuick 2.4
import QtQuick.Templates 2.4 as T
import LongUI 1.0 as LongUI
import QtQuick.Controls.impl 2.4

T.Button
{
    id: control
    implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + LongUI.Units.largeSpacing)
    implicitHeight: background.implicitHeight
    hoverEnabled: true

    property color hoveredColor: Qt.tint(LongUI.Theme.textColor, Qt.rgba(LongUI.Theme.backgroundColor.r,
                                                                       LongUI.Theme.backgroundColor.g,
                                                                       LongUI.Theme.backgroundColor.b, 0.9))
    property color pressedColor: Qt.tint(LongUI.Theme.textColor, Qt.rgba(LongUI.Theme.backgroundColor.r,
                                                                       LongUI.Theme.backgroundColor.g,
                                                                       LongUI.Theme.backgroundColor.b, 0.8))

    property color flatHoveredColor: Qt.lighter(LongUI.Theme.highlightColor, 1.1)
    property color flatPressedColor: Qt.darker(LongUI.Theme.highlightColor, 1.1)

    icon.width: LongUI.Units.iconSizes.small
    icon.height: LongUI.Units.iconSizes.small

    icon.color: control.enabled ? (control.highlighted ? control.LongUI.Theme.highlightColor : control.LongUI.Theme.textColor) : control.LongUI.Theme.disabledTextColor
    spacing: LongUI.Units.smallSpacing

    contentItem: IconLabel {
        text: control.text
        font: control.font
        icon: control.icon
        color: !control.enabled ? control.LongUI.Theme.disabledTextColor : control.flat ? LongUI.Theme.highlightedTextColor : LongUI.Theme.textColor
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignCenter
    }

    background: Item {
        implicitWidth:  (LongUI.Units.iconSizes.medium * 3) + LongUI.Units.largeSpacing
        implicitHeight: LongUI.Units.iconSizes.medium + LongUI.Units.smallSpacing

        Rectangle {
            id: _border
            anchors.fill: parent
            radius: LongUI.Theme.mediumRadius
            border.width: 1
            border.color: control.flat && control.enabled ? LongUI.Theme.highlightColor : control.activeFocus || control.pressed ? LongUI.Theme.highlightColor : 
                          Qt.tint(LongUI.Theme.textColor, Qt.rgba(LongUI.Theme.backgroundColor.r, LongUI.Theme.backgroundColor.g, LongUI.Theme.backgroundColor.b, 0.7))
            color: control.flat && control.enabled ? control.pressed ? control.flatPressedColor : control.hovered ? control.flatHoveredColor : LongUI.Theme.highlightColor
                                                   : control.pressed ? control.pressedColor : control.hovered ? control.hoveredColor : LongUI.Theme.backgroundColor
        }
    }
}
// T.Button {
//     id: control
//     implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + LongUI.Units.largeSpacing)
//     implicitHeight: background.implicitHeight
//     hoverEnabled: true

//     icon.width: LongUI.Units.iconSizes.small
//     icon.height: LongUI.Units.iconSizes.small

//     icon.color: control.enabled ? (control.highlighted ? control.LongUI.Theme.highlightColor : control.LongUI.Theme.textColor) : control.LongUI.Theme.disabledTextColor
//     spacing: LongUI.Units.smallSpacing

//     // property color hoveredColor: LongUI.Theme.darkMode ? Qt.lighter(LongUI.Theme.alternateBackgroundColor, 1.2)
//     //                                                    : Qt.darker(LongUI.Theme.alternateBackgroundColor, 1.1)

//     // property color pressedColor: LongUI.Theme.darkMode ? Qt.lighter(LongUI.Theme.alternateBackgroundColor, 1.1)
//     //                                                    : Qt.darker(LongUI.Theme.alternateBackgroundColor, 1.2)
//     property color hoveredColor: LongUI.Theme.darkMode ? Qt.lighter(LongUI.Theme.wBoColor, 1.2)
//                                                        : Qt.darker(LongUI.Theme.wBoColor, 1.1)

//     property color pressedColor: LongUI.Theme.darkMode ? Qt.lighter(LongUI.Theme.wBoColor, 1.1)
//                                                        : Qt.darker(LongUI.Theme.wBoColor, 1.2)

//     property color borderColor: Qt.rgba(LongUI.Theme.highlightColor.r,
//                                         LongUI.Theme.highlightColor.g,
//                                         LongUI.Theme.highlightColor.b, 0.5)

//     property color flatHoveredColor: Qt.rgba(LongUI.Theme.highlightColor.r,
//                                              LongUI.Theme.highlightColor.g,
//                                              LongUI.Theme.highlightColor.b, 0.2)
//     property color flatPressedColor: Qt.rgba(LongUI.Theme.highlightColor.r,
//                                              LongUI.Theme.highlightColor.g,
//                                              LongUI.Theme.highlightColor.b, 0.25)

//     contentItem: IconLabel {
//         text: control.text
//         font: control.font
//         icon: control.icon
//         // color: !control.enabled ? control.LongUI.Theme.disabledTextColor : control.flat ? LongUI.Theme.highlightColor : LongUI.Theme.textColor
//         // color: LongUI.Theme.textColor
//         color: !control.flat ? control.LongUI.Theme.nflatBoColor : control.flat ? LongUI.Theme.linesColor : LongUI.Theme.textColor
//         spacing: control.spacing
//         mirrored: control.mirrored
//         display: control.display
//         alignment: Qt.AlignCenter
//     }

//     background: Item {
//         implicitWidth: (LongUI.Units.iconSizes.medium * 3) + LongUI.Units.largeSpacing
//         implicitHeight: LongUI.Units.iconSizes.medium + LongUI.Units.smallSpacing

//         Rectangle {
//             id: _flatBackground
//             anchors.fill: parent
//             radius: 20
//             border.width: 2
//             border.color: LongUI.Theme.linesColor
//             visible: control.flat

//             color: {
//                 if (!control.enabled)
//                     // return LongUI.Theme.alternateBackgroundColor
//                     return "transparent"

//                 if (control.pressed)
//                     return control.flatPressedColor

//                 if (control.hovered)
//                     return control.flatHoveredColor
//                     // return LongUI.Theme.hoColor

//                 return "transparent"
//                 // return Qt.rgba(LongUI.Theme.highlightColor.r,
//                 //                LongUI.Theme.highlightColor.g,
//                 //                LongUI.Theme.highlightColor.b, 0.1)
//             }
//         }

//         Rectangle {
//             id: _background
//             anchors.fill: parent
//             radius: 20
//             border.width: 2
//             visible: !control.flat
//             // border.color: control.enabled ? control.activeFocus ? LongUI.Theme.highlightColor : "transparent"
//             //                               : "transparent"
//             border.color: LongUI.Theme.nflatBoColor

//             color: {
//                 if (!control.enabled)
//                     return "transparent"

//                 if (control.pressed)
//                     return control.pressedColor

//                 if (control.hovered)
//                     return control.hoveredColor

//                 // return LongUI.Theme.alternateBackgroundColor
//                 return "transparent"
//             }
//         }

//         // Rectangle {
//         //     id: _background
//         //     anchors.fill: parent
//         //     radius: 20
//         //     border.width: 0
//         //     visible: !control.flat
//         //     border.color: control.enabled ? control.activeFocus ? LongUI.Theme.highlightColor : "transparent"
//         //                                   : "transparent"

//         //     color: {
//         //         if (!control.enabled)
//         //             return LongUI.Theme.alternateBackgroundColor

//         //         if (control.pressed)
//         //             return control.pressedColor

//         //         if (control.hovered)
//         //             return control.hoveredColor

//         //         return LongUI.Theme.alternateBackgroundColor
//         //     }
//         // }
//     }
// }