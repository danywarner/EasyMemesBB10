import bb.cascades 1.0


Page {
    Container 
    {
        leftPadding: 15
        maxWidth: 768
        TextArea {
            editable: false
            backgroundVisible: false
            text: "Edit and share your classic memes in five easy steps:"
            textStyle 
            {
                fontSize: FontSize.PointValue
                textAlign: TextAlign.Center
                fontSizeValue: 10000
                
                
                fontWeight: FontWeight.Bold
                color: Color.create ("#000000")
            }
        } 
        TextArea {
            editable: false
            backgroundVisible: false
            text:"1. Select the picture you want to edit."
        }
        TextArea {
            editable: false
            backgroundVisible: false
            text:"2. Touch and edit the top label."
        }
        TextArea {
            editable: false
            backgroundVisible: false
            text:"3. Touch and edit the bottom label."
        }
        
        TextArea {
            editable: false
            backgroundVisible: false
            text:"4. Save The Picture"
        }
       
        TextArea {
            editable: false
            backgroundVisible: false
            text:"5. Share it on you favorite social network!\n\n Note: All the memes are saved on \nthe \"misc/easymemes\"  folder."
        }
    }



}