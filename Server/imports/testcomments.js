var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var sql = require("mssql/msnodesqlv8"); 



var urlencodedParser = bodyParser.urlencoded({ extended: false })
var dbConfig=require('./dbConfig');



module.exports = function(app){
app.get('/process_commentsList', urlencodedParser, function (req, res) { 
	res.header("Access-Control-Allow-Origin","*");
    console.log("Yorumlar alındı : ");
   
   
   sql.connect(dbConfig, function(err){
	 
        if(err){
            console.log(err);
        }
        else {                       
            var request = new sql.Request();
            var result="";			
            //request.query("SELECT * FROM LikesTable ORDER BY PlaceID,AuthorID,DateOfCreate DESC",   
			request.query("SELECT CommentsTable.ID, CommentsTable.PlaceID, CommentsTable.AuthorID, CommentsTable.Comment, CommentsTable.DateOfCreate,CommentsTable.Active,{ fn CONCAT({ fn CONCAT(UsersTable.Name, ' ') }, UsersTable.Surname) } AS FullName FROM CommentsTable INNER JOIN UsersTable ON CommentsTable.AuthorID = UsersTable.UserID order by CommentsTable.DateOfCreate DESC",
			function(err, data){			 
				if(err)
				{                     				
					console.log(JSON.stringify(err));						
                }
                else
				{								
					var result="";
					if(data.recordsets[0].length>0)
					{
						result=(JSON.stringify(data.recordsets[0]));	
						console.log("Sonuç : "+result);
					}
					else
					{
					    result='{"ID":"","PlaceID":"","AuthorID":"","Comment":"","DateOfCreate":"","Active":"","FullName"}';
						console.log("Kullanıcı bulunamadı",result);
					}  						
                }				
				res.end(result);
				console.log("**********************************************\n");
                sql.close();      
            });        		
        }
		
    });
})


   

}