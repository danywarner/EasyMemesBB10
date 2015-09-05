import bb.cascades 1.0
import bb.system 1.0

Container {
    id:root
    background: Color.create("#FFFFFF")
    layout: AbsoluteLayout {}
    
    function takeSnapshot()
    {
        console.log("photito23")   
        _applicationui.capture(720,1280,"1Meme",720,720)
    
    }
  
    
    ImageView 
    {
        id: imagev2
        imageSource:  _dirPaths.ememes+parameterId
       
        //imageSource: "asset:///images/philosoraptor.jpg"
        preferredWidth: 720
        preferredHeight: 720
        
        layoutProperties: AbsoluteLayoutProperties 
        {
            positionX: 0
            positionY: 0
        }
    }
    Label {
        text: "Meme View"
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 800
            positionX: 0
        }
        textStyle.color: Color.DarkGreen
    }
   
    onCreationCompleted: {
        _applicationui.callTimerDone.connect(takeSnapshot)
        _applicationui.startTimer2()
    
    }
    
    
   
    

}
