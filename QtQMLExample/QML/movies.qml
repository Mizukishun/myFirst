import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 320;
    height: 300;
    color: "#d0d0d0";

    Rectangle {
        id: resultHolder;
        color: "#a0a0a0";
        width: 220;
        height: 80;
        anchors.centerIn: parent;
        visible: false;
        z: 2;
        opacity: 0.8;
        border.width: 2;
        border.color: "#808080";
        radius: 8;
        Text {
            id: result;
            anchors.fill: parent;
            anchors.margins: 5;
            font.pointSize: 16;
            color: "blue";
            font.bold: true;
            wrapMode: Text.Wrap;
        }
    }

    Component {
        id: checkStyle;
        CheckBoxStyle {
            indicator: Rectangle {
                implicitWidth: 14;
                implicitHeight: 14;
                border.color: control.hovered ? "dardblue" : "gray";
                border.width: 1
                Canvas {
                    anchors.fill: parent;
                    anchors.margins: 3;
                    visible: control.checked;
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.save();
                        ctx.strokeStyle = "#c00020";
                        ctx.lineWidth = 2;
                        ctx.beginPath();
                        ctx.moveTo(0, 0);
                        ctx.lineTo(width, height);
                        ctx.moveTo(0, height);
                        ctx.lineTo(width, 0);
                        ctx.stroke();
                        ctx.restore();
                    }
                }
            }

            label: Text{
                color: control.checked ? "blue" : "black";
                text: control.text;
            }
        }
    }

    Text {
        id: notation;
        text: "Please select the best love movies";
        anchors.top: parent.top;
        anchors.topMargin: 16;
        anchors.left: parent.left;
        anchors.leftMargin: 8;
    }

    Column {
        id: movies;
        anchors.top: notation.bottom;
        anchors.topMargin: 8;
        anchors.left: notation.left;
        anchors.leftMargin: 20;
        spacing: 8;
        CheckBox {
            text: "Hero";
            style: checkStyle;
            onClicked: resultHolder.visible = false;
        }
        CheckBox {
            text: "Mirror";
            style: checkStyle;
            onClicked: resultHolder.visible = false;
        }

        CheckBox {
            text:"LoveLive";
            style: checkStyle;
            onClicked: resultHolder.visible =false;
        }
        CheckBox {
            text: "Seed";
            style: checkStyle;
            onClicked: resultHolder.visible = false;
        }
    }

    Button {
         id: confirm;
         text: "Confirm";
         anchors.top: movies.bottom;
         anchors.topMargin: 8;
         anchors.left: notation.left;
         onClicked: {
             var str = new Array();
             var index = 0;
             var count = movies.children.length;
             for(var i= 0; i < count; ++i)
             {
                 if(movies.children[i].checked)
                 {
                     str[index] = movies.children[i].text;
                     index++;
                 }
             }
             if(index > 0)
             {
                 result.text = str.join();
                 resultHolder.visible = true;
             }
         }
    }
}
