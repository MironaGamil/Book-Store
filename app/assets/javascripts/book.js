function addAuthorField() {
 
    //create Date object
    var date = new Date();
 
    //get number of milliseconds since midnight Jan 1, 1970 
    //and use it for address key
    var mSec = date.getTime(); 
 
    //Replace 0 with milliseconds
    idAttribut =  
          "book_authors_attributes_0_name".replace("0", mSec);
    nameAttribut =  
          "book[authors_attributes][0][name]".replace("0", mSec);
 
    //create <li> tag
    var li = document.createElement("li");
 
    //create label for Kind, set it's for attribute, 
    //and append it to <li> element
    var labelname = document.createElement("label");
    labelname.setAttribute("for", idAttribut);
    var nameLabelText = document.createTextNode("name");
    labelname.appendChild(nameLabelText);
    li.appendChild(labelname);
 
    //create input for Kind, set it's type, id and name attribute, 
    //and append it to <li> element
    var inputname = document.createElement("INPUT");
    inputname.setAttribute("type", "text");
    inputname.setAttribute("id", idAttribut);
    inputname.setAttribute("name", nameAttribut);
    li.appendChild(inputname);
 
 
    //add created <li> element with its child elements 
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(li);
 
    //show address header
    $("#authorHeader").show(); 
}