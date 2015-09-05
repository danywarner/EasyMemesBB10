import bb.cascades 1.0


Page {
    Container {
        
        
        TextArea {
            backgroundVisible: false
            editable: false
            text: qsTr("Text Color:")
        }
        ImageButton {
            defaultImageSource: "asset:///colors/blue.png"
            onClicked: {
               _applicationui.changeTextColor("blue");
            }
        }
        ImageButton {
            defaultImageSource: "asset:///colors/red.png"
        }
        ImageButton {
            defaultImageSource: "asset:///colors/green.png"
        }
        ImageButton {
            defaultImageSource: "asset:///colors/black.png"
        }
        ImageButton {
            defaultImageSource: "asset:///colors/orange.png"
        }
        ImageButton {
            defaultImageSource: "asset:///colors/pink.png"
        }
        ImageButton {
            defaultImageSource: "asset:///colors/yellow.png"
        }
        
       
    }
    attachedObjects: 
    [
    	ComponentDefinition {
    	id: memeView
    	source: "MemeView.qml"
    	}
    ]
}