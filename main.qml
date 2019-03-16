import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property var myModel: [1,2,3,4,5]

    Component {
        id: myDelegate
        Rectangle {
            color: "red"
            width: parent.width
            height: 50
            radius: 10
            Text {
                anchors.centerIn: parent
                text: modelData
                font.pointSize: 55
                font.bold: true
                color: "white"
            }
        }
    }

    ListView {
        id: listview
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height - 50
        model: myModel
        delegate: myDelegate
        spacing: 2
    }

    Button {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50
        width: parent.width
        text: "AGREGAR"
        onClicked: {
            myModel.push(myModel[myModel.length-1]+1);
            root.myModelChanged();
            listview.positionViewAtEnd();
        }
    }
}
