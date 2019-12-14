var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var sql = require("mssql/msnodesqlv8"); 



var urlencodedParser = bodyParser.urlencoded({ extended: false })
var dbConfig=require('./dbConfig');



module.exports = function(app){
app.post('/process_makeComment', urlencodedParser, function (req, res) {  

    var PlaceID = req.body.PlaceID;
	var AuthorID = req.body.AuthorID;
	var Comment = req.body.Comment;
	
   res.header("Access-Control-Allow-Origin","*");
   console.log("Yorum gönderme işlemi -->"+PlaceID+"  "+AuthorID+" "+Comment);   
    sql.close(); 
   sql.connect(dbConfig, function(err){
	 
        if(err){
            console.log(err);
        }
        else {                       
            var request = new sql.Request();          
             request.query("INSERT INTO CommentsTable (PlaceID,AuthorID,Comment) VALUES ('"+PlaceID+"','"+AuthorID+"','"+Comment+"')",
			function(err, data){
			  var result="";
				if(err)
				{
                    result='{ "success":false}';						
					console.log("Yorum gönderilemedi -->",JSON.stringify(err));	
					res.end(result);					
                }
                else
				{
					result='{ "success":true}';				
					console.log("Yorum gönderildi -->",PlaceID+"  "+AuthorID+" "+Comment);	
					res.end(result);
                }
			
				console.log("**********************************************\n");
                sql.close();      
            });        		
        }		
    });
})


   

}