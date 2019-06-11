import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import myextension 1.0

Window {

    id: window
    visible: true
    width: 640
    height: 480
    color: "#3f5d80"
    title: qsTr("Freeside Raytracer")
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2

    Rectangle {
        id: rectangle
        x: 134
        y: 78
        width: 320
        height: 240
        color: "#00000000"
        radius: 0
        border.color: "#00000000"
        border.width: 0
        clip: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        ImageItem {
            id: liveImageItem
            fillColor: "#000000"
            clip: true
            enabled: false
            smooth: false
            antialiasing: false
            anchors.fill: parent
        }
    }

    Connections {
        target: raytracer
        onRendererReady: liveImageItem.setImage(image)
    }

    Slider {
        id: slider
        x: 147
        y: 371
        width: 347
        height: 40
        stepSize: 0.1
        to: 10
        from: -10
        value: 0

        onMoved: {
            raytracer.fromXChanged(slider.value)
        }
    }

    Slider {
        id: slider1
        x: 486
        y: 120
        width: 57
        height: 240
        orientation: Qt.Vertical
        stepSize: 0.1
        to: 10
        value: 1.5
        from: -10

        onMoved: {
            raytracer.fromYChanged(slider1.value)
        }
    }
}

























/*##^## Designer {
    D{i:2;anchors_height:240;anchors_width:320}
}
 ##^##*/
