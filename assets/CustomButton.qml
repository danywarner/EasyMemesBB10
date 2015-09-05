import bb.cascades 1.0

Container 
{
   
    property alias image: imagev.imageSource
    ImageView 
    {
        id: imagev
        imageSource:  "asset:///images/"+ListItemData.image
    }        
}
