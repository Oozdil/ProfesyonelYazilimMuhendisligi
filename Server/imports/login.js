var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var sql = require("mssql/msnodesqlv8"); 



var urlencodedParser = bodyParser.urlencoded({ extended: false })
var dbConfig=require('./dbConfig');



module.exports = function(app){



   app.post('/process_login', urlencodedParser, function (req, res) { 
 
    var email = req.body.email;
	var password = req.body.pwd;
	res.header("Access-Control-Allow-Origin","*");
	console.log(email+" "+password+" için login isteği geldi");

	sql.close();
	sql.connect(dbConfig, function(err){
        if(err){
            console.log(err);
        }
        else {                       
            var request = new sql.Request();          
            request.query("select UserID,Name,Surname,Email,IsAdmin from UsersTable WHERE Email='"+email+"' and Password='"+password+"' and IsActive=1",
			function(err, data){
                if(err){
                       console.log(err);                   
                }
                else
				{
					
					var result="";
					if(data.recordsets[0][0])
					{
						result=(JSON.stringify(data.recordsets[0][0]));	
						console.log("Sonuç : "+result);
					}
					else
					{
						result='{ "UserID":"", "Name":"", "Surname":"","Email":""}';
						console.log("Kullanıcı bulunamadı");
					}  
								
					res.end(result);
					console.log("**********************************************\n");
                }
                sql.close();    
            });        		
        }
    });
	
})
}