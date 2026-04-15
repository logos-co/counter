import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    QtObject {
        id: d
        readonly property var backend: typeof logos !== "undefined" && logos ? logos.module(mod) : null
        readonly property string mod: "counter"
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 16

        Text {
            text: d.backend ? d.backend.count : "0"
            font.pixelSize: 48
            font.weight: Font.Bold
            color: "#333333"
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Increment me"
            Layout.alignment: Qt.AlignHCenter

            contentItem: Text {
                text: parent.text
                font.pixelSize: 15
                font.weight: Font.Medium
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                implicitWidth: 140
                implicitHeight: 44
                color: parent.pressed ? "#1a7f37" : "#238636"
                radius: 8
                border.color: "#2ea043"
                border.width: 1
            }

            onClicked: if (d.backend) d.backend.increment()
        }
    }
}
