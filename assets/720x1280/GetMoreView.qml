import bb.cascades 1.0


Page {
    property NavigationPane nav  
    Container {
        layout: AbsoluteLayout {
        
        }
        
        ListView {
            
            maxHeight: 1280
            
            dataModel: XmlDataModel 
            {
                source: "buymodel.xml"
            }
            layout: GridListLayout 
            {
                columnCount: 3
            }
            listItemComponents: 
            [
                ListItemComponent 
                {
                    type: "item"
                    CustomButton 
                    {
                    
                    
                    }  
                }
            
            ]  
        }///listview
        Container 
        {
            
            leftPadding: 120
            topPadding: 590
            
            Button 
            {
                
                text: "Get 150+ More Images like these!"
                
                onClicked: 
                {
                    _applicationui.purchase("morememes01");
                
                }
            }
        }//container
    
    }
}