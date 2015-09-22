import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Window {
    width: 540
    height: 950
    visible: true
    title: qsTr("Telephone handset")
    ListModel {
        id: recentCallsListModel
        ListElement {
            number: "+9(999)999-99-99"
            duration: "00:10"
        }
    }

    Dialog {
        id: dialog
        property date currentDate: new Date()
        standardButtons: StandardButton.Cancel
        contentItem: FocusScope {
            implicitWidth: 400
            implicitHeight: 100
            Rectangle {
                anchors.fill: parent
                color: "lightskyblue"
            }
            ColumnLayout {
                anchors.fill: parent
                Item {
                    Layout.fillWidth: true
                    implicitHeight: 50
                    Text {
                        text: qsTr("Dialing...\n")+textInput.text
                        color: "navy"
                        anchors.centerIn: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Button {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: qsTr("Cancel")
                    isDefault: true
                    focus: true
                    onClicked: {
                        var closeDate = new Date()
                        dialog.close()
                        var durationDate = new Date(closeDate-dialog.currentDate)
                        // FIXME: timezones problem:
                        recentCallsListModel.append({"number": textInput.text, "duration":durationDate.toTimeString()})
                    }
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        ListView {
            Layout.fillWidth: true
            implicitHeight: 150
            model: recentCallsListModel
            delegate: Item {
                width: parent.width
                height: 50
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 20
                    Text {
                        id: numberText
                        text: number
                    }
                    // FIXME: appended item layout problem:
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                    Text {
                        color: "grey"
                        text: duration
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            textInput.insert(0,numberText.text)
                        }
                    }
                }
            }
        }

        TextInput {
            id: textInput
            Layout.fillWidth: true
            Layout.fillHeight: true
            selectByMouse: true
            inputMask: "+9(999)999-99-99"
            inputMethodHints: Qt.ImhDialableCharactersOnly
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 40
            font.bold: true
            font.family: "monospace"
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "1"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "2"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "3"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "4"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "5"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "6"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "7"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "8"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "9"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                enabled: false
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "*"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1

                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "0"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
            Button {
                enabled: false
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "#"
                onClicked: {
                    textInput.insert(textInput.cursorPosition,text)
                    textInput.cursorPosition+=1
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Dial")
                enabled: textInput.acceptableInput
                onClicked: {
                    dialog.visible=true
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Reset")
                onClicked: {
                    textInput.remove(0,textInput.length)
                    textInput.cursorPosition=0
                }
            }
        }

    }

}

