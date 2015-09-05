import bb.cascades 1.0
import bb.system 1.0

Container {
    id:root
    background: Color.create("#FFFFFF")
    layout: AbsoluteLayout {}
    
    function takeSnapshot()
    {
        console.log("photito2")   
        _applicationui.capture(768,1280,"1Meme",768,768)
    
    }
    
    ImageView 
    {
        id: imagev2
        imageSource:  _dirPaths.ememes+parameterId
       
        //imageSource: "asset:///images/philosoraptor.jpg"
        preferredHeight: 768
        preferredWidth: 768
        layoutProperties: AbsoluteLayoutProperties 
        {
            positionX: 0
            positionY: 0
        }
    }
    Label {
        text: "Meme View"
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 768
            positionX: 0
        }
        textStyle.color: Color.DarkGreen
    }

    onCreationCompleted: {
        _applicationui.callTimerDone.connect(takeSnapshot)
        _applicationui.startTimer2()
    
    }
    
    
   
    

}
