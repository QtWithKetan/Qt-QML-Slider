import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")    

    Column
    {
        spacing: 20
        anchors.centerIn: parent
        width: 640

        Slider
        {
            id: mySlider
            width: parent.width * 0.8
            from: 0
            to: 1000
            stepSize: 1
            anchors.centerIn: parent

            onValueChanged:
            {
                console.log("Slider Value : " , value);
            }

            background: Rectangle
            {
                x: mySlider.leftPadding
                y: mySlider.topPadding + mySlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 20
                width: mySlider.availableWidth
                height: implicitHeight
                radius: height / 2
                color: "#0abde3"

                Rectangle
                {
                    width: mySlider.visualPosition == 0 ? 0 : mySlider.handle.x  + mySlider.handle.width / 2
                    height: parent.height
                    color: "#341f97"
                    radius: height / 2
                }
            }

            handle: Rectangle
            {
                x: mySlider.leftPadding + mySlider.visualPosition * (mySlider.availableWidth - width)
                y: mySlider.topPadding + mySlider.availableHeight / 2 - height/ 2
                implicitHeight: 50
                implicitWidth: 50
                radius: implicitWidth / 2
                color: mySlider.pressed ? "#ee5253" : "#222f3e"
                border.color: "#1dd1a1"
                border.width: 2
            }
        }

        Text
        {
            id: mySliderText
            text : "Slider Value : " + mySlider.value
            anchors.top: mySlider.bottom
            anchors.horizontalCenter: mySlider.horizontalCenter
        }
    }
}
