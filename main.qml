import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Random Loader Coordinates Example")
    color: "black"

    Text {
        id: tekst
        text: qsTr("RMB - Create      |     LMB - Destroy")
        color: "white"
        x: mainWindow.width/3
        y: mainWindow.height - (mainWindow.height * 0.9)
    }

    Rectangle {
        id: rec1
        width: mainWindow.width/1.5
        height:  mainWindow.height/1.5
        anchors.centerIn: parent
        color: "blue"
        border {color: "red"; width: 2}
        clip: true

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: (mouse) => {      if (mouse.button === Qt.RightButton)   loader.sourceComponent = compo
                                    else if (mouse.button === Qt.LeftButton)    loader.sourceComponent = undefined
                                  }
        }
    }

        Loader {
            id: loader
            anchors.centerIn: parent
        }

        Component {
            id: compo

            Rectangle {
                parent: rec1
                id: rec2
                width: rec1.width/8
                height: rec1.height/8
                x: Math.floor ( Math.random() * ( ( rec1.width - rec2.width) - 0) )
                y: Math.floor ( Math.random() * ( ( rec1.height - rec2.height) - 0) )
                color: "chartreuse"
                border {color: "orange"; width: 10}
            }
        }
    }



