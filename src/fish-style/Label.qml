import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Templates 2.3 as T
import LongUI 1.0 as LongUI

T.Label {
    id: control

    verticalAlignment: lineCount > 1 ? Text.AlignTop : Text.AlignVCenter

    activeFocusOnTab: false
    // Text.NativeRendering is broken on non integer pixel ratios
    // renderType: Window.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering

    renderType: LongUI.Theme.renderType

    font.capitalization: LongUI.Theme.defaultFont.capitalization
    font.family: LongUI.Theme.fontFamily
    font.italic: LongUI.Theme.defaultFont.italic
    font.letterSpacing: LongUI.Theme.defaultFont.letterSpacing
    font.pointSize: LongUI.Theme.fontSize
    font.strikeout: LongUI.Theme.defaultFont.strikeout
    font.underline: LongUI.Theme.defaultFont.underline
    font.weight: LongUI.Theme.defaultFont.weight
    font.wordSpacing: LongUI.Theme.defaultFont.wordSpacing
    color: LongUI.Theme.textColor
    linkColor: LongUI.Theme.linkColor

    opacity: enabled ? 1 : 0.6

    Accessible.role: Accessible.StaticText
    Accessible.name: text
}
