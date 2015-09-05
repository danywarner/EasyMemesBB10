import bb.cascades 1.0
import bb.system 1.0

Container {
    id:root
    background: Color.create("#FFFFFF")
    layout: AbsoluteLayout {}
    
    function takeSnapshot()
    {
        console.log("photito")   
        _applicationui.capture(720,720,"1Meme",720,615)
    
    }
    
    ImageView 
    {
        id: imagev2
        imageSource:  _dirPaths.ememes+parameterId
       
        //imageSource: "asset:///images/philosoraptor.jpg"
        preferredHeight: 615
        preferredWidth: 720
        layoutProperties: AbsoluteLayoutProperties 
        {
            positionX: 0
            positionY: 0
        }
    }
onCreationCompleted: {
    _applicationui.callTimerDone.connect(takeSnapshot)
    _applicationui.startTimer2()
   
}
}

